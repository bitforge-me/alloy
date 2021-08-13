import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:extended_image/extended_image.dart';
import 'package:image/image.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import 'package:zapdart/widgets.dart';

import 'paydb.dart';
import 'config.dart';
import 'addr_search.dart';
import 'autocomplete_service.dart';

class AccountLogin {
  final String email;
  final String password;

  AccountLogin(this.email, this.password);
}

class AccountImageUpdate extends StatelessWidget {
  final Function(String? img, String imgType) _imageUpdate;
  final String? _imgString;
  final String? _imgType;

  AccountImageUpdate(this._imgString, this._imgType, this._imageUpdate)
      : super();

  Future<String?> _imgDataEdited(BuildContext context, PickedFile file) async {
    final editorKey = GlobalKey<ExtendedImageEditorState>();
    final imageEditor = ExtendedImage.memory(
      await file.readAsBytes(),
      fit: BoxFit.contain,
      mode: ExtendedImageMode.editor,
      extendedImageEditorKey: editorKey,
      initEditorConfigHandler: (state) {
        return EditorConfig(
            maxScale: 8.0,
            cropRectPadding: EdgeInsets.all(20.0),
            hitTestSize: 20.0,
            cropAspectRatio: CropAspectRatios.ratio1_1);
      },
    );
    await showGeneralDialog(
      context: context,
      barrierColor: Colors.black12.withOpacity(0.6),
      barrierDismissible: false,
      pageBuilder: (context, __, ___) {
        return SizedBox.expand(
            child: Scaffold(
                body: Column(children: [
          Expanded(child: imageEditor),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.flip),
                onPressed: () {
                  editorKey.currentState?.flip();
                },
              ),
              IconButton(
                icon: const Icon(Icons.rotate_left),
                onPressed: () {
                  editorKey.currentState?.rotate(right: false);
                },
              ),
              IconButton(
                icon: const Icon(Icons.rotate_right),
                onPressed: () {
                  editorKey.currentState?.rotate(right: true);
                },
              ),
              IconButton(
                icon: const Icon(Icons.restore),
                onPressed: () {
                  editorKey.currentState?.reset();
                },
              ),
              IconButton(
                icon: const Icon(Icons.done),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        ])));
      },
    );
    var editorKeyState = editorKey.currentState;
    if (editorKeyState == null) return null;
    var editAction = editorKeyState.editAction;
    var cropRect = editorKeyState.getCropRect();
    var src = decodeImage(editorKeyState.rawImageData);
    if (src == null) return null;
    if (editAction != null && cropRect != null) {
      if (editAction.needCrop)
        src = copyCrop(src, cropRect.left.toInt(), cropRect.top.toInt(),
            cropRect.width.toInt(), cropRect.height.toInt());
      if (editAction.needFlip) {
        Flip mode = Flip.horizontal;
        if (editAction.flipY && editAction.flipX)
          mode = Flip.both;
        else if (editAction.flipY)
          mode = Flip.horizontal;
        else if (editAction.flipX) mode = Flip.vertical;
        src = flip(src, mode);
      }
      if (editAction.hasRotateAngle)
        src = copyRotate(src, editAction.rotateAngle);
    }
    src = copyResize(src, width: 200, height: 200);
    var jpgBytes = encodeJpg(src, quality: 50);
    return base64Encode(jpgBytes);
  }

  void _imgFromCamera(BuildContext context) async {
    var file = await ImagePicker()
        .getImage(source: ImageSource.camera, imageQuality: 50);
    if (file == null) return;
    var imgString = await _imgDataEdited(context, file);
    _imageUpdate(imgString, 'raster');
  }

  void _imgFromGallery(BuildContext context) async {
    var file = await ImagePicker()
        .getImage(source: ImageSource.gallery, imageQuality: 50);
    if (file == null) return;
    var imgString = await _imgDataEdited(context, file);
    _imageUpdate(imgString, 'raster');
  }

  Widget _imageSizeWidget() {
    if (_imgString == null || _imgString!.isEmpty) return SizedBox();
    var kib = (_imgString!.length / 1000.0).ceil();
    return Text('$kib KiB');
  }

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: InputDecoration(labelText: 'Profile Image'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            paydbAccountImage(_imgString, _imgType),
            SizedBox(width: 25),
            IconButton(
                icon: Icon(Icons.folder_open),
                onPressed: () => _imgFromGallery(context)),
            IconButton(
                icon: Icon(Icons.camera),
                onPressed: () => _imgFromCamera(context)),
            _imageSizeWidget(),
          ]),
        ],
      ),
    );
  }
}

class AccountRegisterForm extends StatefulWidget {
  final AccountRegistration? registration;
  final String? instructions;
  final bool showName;
  final bool showMobileNumber;
  final bool showAddress;
  final bool showCurrentPassword;
  final bool showNewPassword;

  AccountRegisterForm(this.registration,
      {this.instructions,
      this.showName: true,
      this.showMobileNumber: false,
      this.showAddress: false,
      this.showCurrentPassword: false,
      this.showNewPassword: true})
      : super();

  @override
  AccountRegisterFormState createState() {
    return AccountRegisterFormState();
  }
}

class AccountRegisterFormState extends State<AccountRegisterForm> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _currentPasswordController =
      TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _passwordConfirmController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String? _dialCode;
  String? _countryCode;
  String? _imgString;
  String? _imgType;

  @protected
  @mustCallSuper
  void initState() {
    super.initState();

    if (widget.registration != null) {
      _firstNameController.text = widget.registration!.firstName;
      _lastNameController.text = widget.registration!.lastName;
      _emailController.text = widget.registration!.email;
      PhoneNumber.getRegionInfoFromPhoneNumber(
              widget.registration!.mobileNumber)
          .then((value) {
        setState(() {
          _dialCode = '+${value.dialCode}';
          _countryCode = value.isoCode;
        });
        if (value.phoneNumber != null)
          _mobileNumberController.text =
              value.phoneNumber!.replaceFirst('+${value.dialCode}', '');
      });
      _addressController.text = widget.registration!.address;
      _currentPasswordController.text = widget.registration!.currentPassword;
      _newPasswordController.text = widget.registration!.newPassword;
      _passwordConfirmController.text = widget.registration!.newPassword;
      _imgType = widget.registration!.photoType;
      _imgString = widget.registration!.photo;
    }
  }

  void searchAddr() async {
    final apiClient = createPlaceApi();
    if (apiClient != null) {
      final Suggestion? result = await showSearch<Suggestion?>(
        context: context,
        delegate: AddressSearch(apiClient),
      );
      if (result != null) _addressController.text = result.description;
    }
  }

  void manualAddr() async {
    var place = await Navigator.push<Place?>(
      context,
      MaterialPageRoute(builder: (context) => AddressForm()),
    );
    if (place != null) _addressController.text = place.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          child: Container(),
          preferredSize: Size(0, 0),
        ),
        body: SingleChildScrollView(
            child: Form(
                key: _formKey,
                child: Container(
                    padding: EdgeInsets.all(20),
                    child: Center(
                        child: Column(children: [
                      Text(widget.instructions == null
                          ? 'Enter your details to register'
                          : widget.instructions!),
                      Visibility(
                          visible: widget.showName,
                          child: TextFormField(
                              controller: _firstNameController,
                              decoration:
                                  InputDecoration(labelText: 'First Name'),
                              keyboardType: TextInputType.name,
                              validator: (value) {
                                if (value != null && value.isEmpty)
                                  return 'Please enter a first name';
                                return null;
                              })),
                      Visibility(
                          visible: widget.showName,
                          child: TextFormField(
                              controller: _lastNameController,
                              decoration:
                                  InputDecoration(labelText: 'Last Name'),
                              keyboardType: TextInputType.name,
                              validator: (value) {
                                if (value == null || value.isEmpty)
                                  return 'Please enter a last name';
                                return null;
                              })),
                      AccountImageUpdate(
                          _imgString,
                          _imgType,
                          (img, imgType) => setState(() {
                                _imgString = img;
                                _imgType = imgType;
                              })),
                      TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(labelText: 'Email'),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty)
                              return 'Please enter an email';
                            if (!EmailValidator.validate(value))
                              return 'Invalid email';
                            return null;
                          }),
                      Visibility(
                          visible: widget.showMobileNumber,
                          child: InternationalPhoneNumberInput(
                              textFieldController: _mobileNumberController,
                              initialValue: _countryCode != null
                                  ? PhoneNumber(isoCode: _countryCode)
                                  : InitialMobileCountry != null
                                      ? PhoneNumber(
                                          isoCode: InitialMobileCountry)
                                      : null,
                              onInputChanged: (number) =>
                                  _dialCode = number.dialCode,
                              selectorConfig: SelectorConfig(
                                  selectorType: PhoneInputSelectorType.DIALOG,
                                  countryComparator: PreferredMobileCountries !=
                                          null
                                      ? (a, b) {
                                          if (PreferredMobileCountries == null)
                                            return 0;
                                          if (PreferredMobileCountries!
                                              .contains(a.name)) {
                                            var aSlot =
                                                PreferredMobileCountries!
                                                    .indexOf(a.name!);
                                            if (PreferredMobileCountries!
                                                .contains(b.name)) {
                                              var bSlot =
                                                  PreferredMobileCountries!
                                                      .indexOf(b.name!);
                                              if (aSlot < bSlot)
                                                return -1;
                                              else
                                                return 1;
                                            } else
                                              return -1;
                                          }
                                          return 0;
                                        }
                                      : null))),
                      Visibility(
                          visible: widget.showAddress,
                          child: TextFormField(
                            controller: _addressController,
                            readOnly: true,
                            decoration: InputDecoration(
                                labelText: 'Address',
                                suffix: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      availablePlaceApi()
                                          ? IconButton(
                                              icon: Icon(Icons.search),
                                              onPressed: searchAddr)
                                          : SizedBox(),
                                      IconButton(
                                          icon: Icon(Icons.edit),
                                          onPressed: manualAddr),
                                    ])),
                          )),
                      Visibility(
                          visible: widget.showCurrentPassword,
                          child: TextFormField(
                              controller: _currentPasswordController,
                              obscureText: true,
                              decoration: InputDecoration(
                                  labelText: 'Current Password'),
                              validator: (value) {
                                if (value == null || value.isEmpty)
                                  return 'Please enter your current password';
                                return null;
                              })),
                      Visibility(
                          visible: widget.showNewPassword,
                          child: TextFormField(
                              controller: _newPasswordController,
                              obscureText: true,
                              decoration:
                                  InputDecoration(labelText: 'New Password'),
                              validator: (value) {
                                if (value == null || value.isEmpty)
                                  return 'Please enter a new password';
                                return null;
                              })),
                      Visibility(
                          visible: widget.showNewPassword,
                          child: TextFormField(
                              controller: _passwordConfirmController,
                              obscureText: true,
                              decoration: InputDecoration(
                                  labelText: 'Password Confirmation'),
                              validator: (value) {
                                if (value == null || value.isEmpty)
                                  return 'Please confirm your password';
                                if (value != _newPasswordController.text)
                                  return 'Password does not match';
                                return null;
                              })),
                      raisedButton(
                        child: Text("Ok"),
                        onPressed: () async {
                          if (_formKey.currentState == null) return;
                          if (_formKey.currentState!.validate()) {
                            var accountReg = AccountRegistration(
                                _firstNameController.text,
                                _lastNameController.text,
                                _emailController.text,
                                '$_dialCode ${_mobileNumberController.text}',
                                _addressController.text,
                                _currentPasswordController.text,
                                _newPasswordController.text,
                                _imgString,
                                _imgType);
                            Navigator.of(context).pop(accountReg);
                          }
                        },
                      ),
                      raisedButton(
                        child: Text("Cancel"),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ]))))));
  }
}

class AccountLoginForm extends StatefulWidget {
  final AccountLogin? login;
  final String? instructions;

  AccountLoginForm(this.login, {this.instructions}) : super();

  @override
  AccountLoginFormState createState() {
    return AccountLoginFormState();
  }
}

class AccountLoginFormState extends State<AccountLoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @protected
  @mustCallSuper
  void initState() {
    super.initState();

    if (widget.login != null) {
      _emailController.text = widget.login!.email;
      _passwordController.text = widget.login!.password;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          child: Container(),
          preferredSize: Size(0, 0),
        ),
        body: Form(
            key: _formKey,
            child: Container(
                padding: EdgeInsets.all(20),
                child: Center(
                    child: Column(
                  children: <Widget>[
                    Text(widget.instructions == null
                        ? "Enter your email and password to login"
                        : widget.instructions!),
                    TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(labelText: 'Email'),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty)
                            return 'Please enter an email';
                          if (!EmailValidator.validate(value))
                            return 'Invalid email';
                          return null;
                        }),
                    TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(labelText: 'Password'),
                        validator: (value) {
                          if (value == null || value.isEmpty)
                            return 'Please enter a password';
                          return null;
                        }),
                    raisedButton(
                      child: Text("Ok"),
                      onPressed: () {
                        if (_formKey.currentState == null) return;
                        if (_formKey.currentState!.validate()) {
                          var accountLogin = AccountLogin(
                              _emailController.text, _passwordController.text);
                          Navigator.of(context).pop(accountLogin);
                        }
                      },
                    ),
                    raisedButton(
                      child: Text("Cancel"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                )))));
  }
}

class AccountRequestApiKeyForm extends StatefulWidget {
  final String deviceName;
  final String? instructions;

  AccountRequestApiKeyForm(this.deviceName, {this.instructions}) : super();

  @override
  AccountRequestApiKeyFormState createState() {
    return AccountRequestApiKeyFormState();
  }
}

class AccountRequestApiKeyFormState extends State<AccountRequestApiKeyForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _deviceNameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @protected
  @mustCallSuper
  void initState() {
    super.initState();
    _deviceNameController.text = widget.deviceName;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          child: Container(),
          preferredSize: Size(0, 0),
        ),
        body: Form(
            key: _formKey,
            child: Container(
                padding: EdgeInsets.all(20),
                child: Center(
                    child: Column(
                  children: <Widget>[
                    Text(widget.instructions == null
                        ? "Enter your email and device name to login via email link"
                        : widget.instructions!),
                    TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(labelText: 'Email'),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty)
                            return 'Please enter an email';
                          if (!EmailValidator.validate(value))
                            return 'Invalid email';
                          return null;
                        }),
                    TextFormField(
                        controller: _deviceNameController,
                        decoration: InputDecoration(labelText: 'Device Name'),
                        validator: (value) {
                          if (value == null || value.isEmpty)
                            return 'Please enter a device name';
                          return null;
                        }),
                    raisedButton(
                      child: Text("Ok"),
                      onPressed: () {
                        if (_formKey.currentState == null) return;
                        if (_formKey.currentState!.validate()) {
                          var req = AccountRequestApiKey(_emailController.text,
                              _deviceNameController.text);
                          Navigator.of(context).pop(req);
                        }
                      },
                    ),
                    raisedButton(
                      child: Text("Cancel"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                )))));
  }
}
