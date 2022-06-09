import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:extended_image/extended_image.dart';
import 'package:image/image.dart' as img;
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:intl_phone_number_input/src/utils/phone_number/phone_number_util.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:zapdart/addr_search.dart';
import 'package:zapdart/autocomplete_service.dart';
import 'package:zapdart/form_ui.dart';
import 'package:zapdart/account_forms.dart';
import 'package:zapdart/colors.dart';
import 'colors.dart';
import 'popupreturn.dart';
import 'widgets.dart';

FormFieldValidator deviceNameValidate = (value) {
  if (value == null || value.isEmpty) return 'Please enter a device name';
  return null;
};

FormFieldValidator emailValidate = (value) {
  value = value?.trim();
  if (value == null || value.isEmpty) return 'Please enter an email';
  if (!EmailValidator.validate(value)) return 'Invalid email';
  return null;
};

FormFieldValidator passwordValidate = (value) {
  if (value == null || value.isEmpty) return 'Please enter a password';
  return null;
};

FormFieldValidator firstNameValidate = (value) {
  if (value != null && value.isEmpty) return 'Please enter a first name';
  return null;
};

FormFieldValidator lastNameValidate = (value) {
  if (value == null || value.isEmpty) return 'Please enter a last name';
  return null;
};

FormFieldValidator newPasswordValidate = (value) {
  if (value == null || value.isEmpty) return 'Please enter a new password';
  return null;
};

class BronzeInputForm extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final FormFieldValidator<dynamic>? validator;
  final String? labelText;
  final bool? obscureText;
  final Icon? icon;
  BronzeInputForm(this.controller,
      {this.validator,
      this.keyboardType,
      this.obscureText,
      this.labelText,
      this.icon})
      : super();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        textAlign: TextAlign.center,
        controller: this.controller,
        decoration: InputDecoration(
          prefixIcon: this.icon == null
              ? null
              : Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: this.icon,
                ),
          contentPadding: const EdgeInsets.symmetric(vertical: 25.0),
          fillColor: Color(0xFFFFFFFF).withOpacity(0.1),
          filled: true,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          labelText: this.labelText ?? null,
          constraints: BoxConstraints(minWidth: 320, maxWidth: 320),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
        ),
        keyboardType: this.keyboardType ?? null,
        obscureText: this.obscureText ?? false,
        validator: this.validator ?? null);
  }
}

class BronzeRequestApiKeyForm extends StatefulWidget {
  final String deviceName;
  final String? instructions;

  BronzeRequestApiKeyForm(this.deviceName, {this.instructions}) : super();

  @override
  BronzeRequestApiKeyFormState createState() {
    return BronzeRequestApiKeyFormState();
  }
}

class BronzeRequestApiKeyFormState extends State<BronzeRequestApiKeyForm> {
  final TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @protected
  @mustCallSuper
  void initState() {
    super.initState();
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
                    Image.asset(
                      'new-logo.png',
                      height: 200,
                      fit: BoxFit.fitHeight,
                    ),
                    Text(
                      "Forgot Password",
                      style: TextStyle(
                          color: Color(0xFFFFFFFF).withOpacity(0.75),
                          fontSize: 20),
                    ),
                    SizedBox(height: 10),
                    Text(widget.instructions == null
                        ? "Enter your email and device name to login via email link"
                        : widget.instructions!),
                    SizedBox(height: 15),
                    BronzeInputForm(_emailController,
                        icon: Icon(Icons.email_outlined),
                        labelText: 'Email',
                        keyboardType: TextInputType.emailAddress,
                        validator: emailValidate),
                    SizedBox(height: 15),
                    BronzeRoundedButton(() {
                      if (_formKey.currentState == null) return;
                      if (_formKey.currentState!.validate()) {
                        PopUpReturn popUpReq = PopUpReturn.accountRequest(
                            AccountRequestApiKey(_emailController.text.trim(),
                                widget.deviceName));
                        Navigator.of(context).pop(popUpReq);
                      }
                    }, ZapOnSecondary, ZapSecondary, bronzeGradient, 'Continue',
                        holePunch: true, width: 320, height: 65),
                    SizedBox(height: 15),
                    BronzeRoundedButton(() {
                      Navigator.of(context).pop(PopUpReturn.optionOne());
                    }, ZapOnSecondary, ZapSecondary, bronzeCancelGradient,
                        'Login Instead',
                        holePunch: true, width: 320, height: 65),
                  ],
                )))));
  }
}

Widget bronzeaccountImage(String? imgString, String? imgType,
    {double size = 70,
    double borderRadius = 10,
    double dropShadowOffsetX = 0,
    double dropShadowOffsetY = 3,
    double dropShadowSpreadRadius = 5,
    double dropShadowBlurRadius = 7}) {
  if (imgString != null && imgString.isNotEmpty) {
    if (imgType == 'raster')
      // if image is raster then apply corner radius and drop shadow
      return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: dropShadowSpreadRadius,
                blurRadius: dropShadowBlurRadius,
                offset: Offset(dropShadowOffsetX, dropShadowOffsetY),
              )
            ],
          ),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(borderRadius),
              //TODO: BoxFit.cover should not be necesary if the crop aspect ratio is 1/1 (*shrug*)
              child: Image.memory(
                base64Decode(imgString),
                width: size,
                height: size,
                fit: BoxFit.cover,
              )));
    if (imgType == 'svg')
      return SvgPicture.string(imgString, width: size, height: size);
  }
  return SvgPicture.asset('assets/user.svg',
      package: 'zapdart', width: size, height: size);
}

class BronzeAccountImageUpdate extends StatelessWidget {
  final Function(String? img, String imgType) _imageUpdate;
  final String? _imgString;
  final String? _imgType;

  BronzeAccountImageUpdate(this._imgString, this._imgType, this._imageUpdate)
      : super();

  Future<String?> _imgDataEdited(BuildContext context, XFile file) async {
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
    var src = img.decodeImage(editorKeyState.rawImageData);
    if (src == null) return null;
    if (editAction != null && cropRect != null) {
      if (editAction.needCrop)
        src = img.copyCrop(src, cropRect.left.toInt(), cropRect.top.toInt(),
            cropRect.width.toInt(), cropRect.height.toInt());
      if (editAction.needFlip) {
        var mode = img.Flip.horizontal;
        if (editAction.flipY && editAction.flipX)
          mode = img.Flip.both;
        else if (editAction.flipY)
          mode = img.Flip.horizontal;
        else if (editAction.flipX) mode = img.Flip.vertical;
        src = img.flip(src, mode);
      }
      if (editAction.hasRotateAngle)
        src = img.copyRotate(src, editAction.rotateAngle);
    }
    src = img.copyResize(src, width: 200, height: 200);
    var jpgBytes = img.encodeJpg(src, quality: 50);
    return base64Encode(jpgBytes);
  }

  void _imgFromCamera(BuildContext context) async {
    var file = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 50);
    if (file == null) return;
    var imgString = await _imgDataEdited(context, file);
    _imageUpdate(imgString, 'raster');
  }

  void _imgFromGallery(BuildContext context) async {
    var file = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 50);
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
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            bronzeaccountImage(_imgString, _imgType),
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

class BronzeLoginForm extends StatefulWidget {
  final AccountLogin? login;
  final String? instructions;
  final bool showTwoFactorCode;

  BronzeLoginForm(this.login,
      {this.instructions, this.showTwoFactorCode = false})
      : super();

  @override
  BronzeLoginFormState createState() {
    return BronzeLoginFormState();
  }
}

class BronzeLoginFormState extends State<BronzeLoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _tfCodeController = TextEditingController();
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
                    Image.asset(
                      'new-logo.png',
                      height: 200,
                      fit: BoxFit.fitHeight,
                    ),
                    Text(
                      "Welcome back!",
                      style: TextStyle(
                          color: Color(0xFFFFFFFF).withOpacity(0.75),
                          fontSize: 20),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Please log in",
                      style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 34),
                    ),
                    SizedBox(height: 15),
                    BronzeInputForm(
                      _emailController,
                      validator: emailValidate,
                      icon: Icon(Icons.person_outline),
                      keyboardType: TextInputType.emailAddress,
                      labelText: 'Email',
                    ),
                    SizedBox(height: 8),
                    BronzeInputForm(_passwordController,
                        icon: Icon(Icons.key_outlined),
                        validator: passwordValidate,
                        labelText: 'Password',
                        obscureText: true),
                    SizedBox(height: 8),
                    Visibility(
                      visible: widget.showTwoFactorCode,
                      child: BronzeInputForm(_tfCodeController,
                          obscureText: true, labelText: "2FA Code"),
                    ),
                    BronzeRoundedButton(() {
                      if (_formKey.currentState == null) return;
                      if (_formKey.currentState!.validate()) {
                        PopUpReturn returnLogin = PopUpReturn.login(
                            AccountLogin(
                                _emailController.text.trim(),
                                _passwordController.text,
                                _tfCodeController.text));
                        Navigator.of(context).pop(returnLogin);
                      }
                    }, ZapOnSecondary, ZapSecondary, bronzeGradient, 'Continue',
                        holePunch: true, width: 320, height: 65),
                    BronzeRoundedButton(() {
                      Navigator.of(context).pop(PopUpReturn.optionOne());
                    }, ZapOnSecondary, ZapSecondary, bronzeCancelGradient,
                        'Create an Account',
                        holePunch: true, width: 320, height: 65),
                    BronzeRoundedButton(() {
                      Navigator.of(context).pop(PopUpReturn.optionTwo());
                    }, ZapOnSecondary, ZapSecondary, bronzeCancelGradient,
                        'Lost Password',
                        holePunch: true, width: 320, height: 65)
                  ],
                )))));
  }
}

class BronzeRegisterForm extends StatefulWidget {
  final AccountRegistration? registration;
  final String? instructions;
  final bool showName;
  final bool showImage;
  final bool showEmail;
  final bool showMobileNumber;
  final bool requireMobileNumber;
  final String? initialMobileCountry;
  final List<String>? preferredMobileCountries;
  final bool showAddress;
  final bool requireAddress;
  final String? googlePlaceApiKey;
  final String? locationIqApiKey;
  final bool showCurrentPassword;
  final bool showNewPassword;

  BronzeRegisterForm(this.registration,
      {this.instructions,
      this.showName: true,
      this.showImage: true,
      this.showEmail: true,
      this.showMobileNumber: false,
      this.requireMobileNumber: false,
      this.initialMobileCountry,
      this.preferredMobileCountries,
      this.showAddress: false,
      this.requireAddress: false,
      this.googlePlaceApiKey,
      this.locationIqApiKey,
      this.showCurrentPassword: false,
      this.showNewPassword: true})
      : super();

  @override
  BronzeRegisterFormState createState() {
    return BronzeRegisterFormState();
  }
}

class BronzeRegisterFormState extends State<BronzeRegisterForm> {
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
  String? _isoCode;
  bool _valid = false;
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
      if (widget.registration!.mobileNumber.isNotEmpty)
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
    final apiClient =
        createPlaceApi(widget.googlePlaceApiKey, widget.locationIqApiKey);
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

  Future<bool> isValidPhoneNumber(String phoneNumber, String? isoCode) async {
    if (phoneNumber.isNotEmpty && isoCode != null) {
      try {
        bool? isValidPhoneNumber = await PhoneNumberUtil.isValidNumber(
            phoneNumber: phoneNumber, isoCode: isoCode);
        if (isValidPhoneNumber == null) return false;
        return isValidPhoneNumber;
      } on Exception {
        return false;
      }
    }
    return false;
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
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                          Text(widget.instructions == null
                              ? 'Enter your details to register'
                              : widget.instructions!),
                          Visibility(
                              visible: widget.showImage,
                              child: BronzeAccountImageUpdate(
                                  _imgString,
                                  _imgType,
                                  (img, imgType) => setState(() {
                                        _imgString = img;
                                        _imgType = imgType;
                                      }))),
                          SizedBox(height: 15),
                          Visibility(
                            visible: widget.showName,
                            child: BronzeInputForm(_firstNameController,
                                validator: firstNameValidate,
                                icon: Icon(Icons.person_outline),
                                labelText: 'First Name',
                                keyboardType: TextInputType.name),
                          ),
                          SizedBox(height: 15),
                          Visibility(
                              visible: widget.showName,
                              child: BronzeInputForm(_lastNameController,
                                  validator: lastNameValidate,
                                  icon: Icon(Icons.person_outline),
                                  labelText: 'Last Name',
                                  keyboardType: TextInputType.name)),
                          SizedBox(height: 15),
                          Visibility(
                            visible: widget.showEmail,
                            child: BronzeInputForm(_emailController,
                                icon: Icon(Icons.email_outlined),
                                labelText: 'Email',
                                keyboardType: TextInputType.emailAddress,
                                validator: emailValidate),
                          ),
                          Visibility(
                              visible: widget.showMobileNumber,
                              child: phoneNumberInput(
                                  _mobileNumberController,
                                  (number) {
                                    _dialCode = number.dialCode;
                                    _isoCode = number.isoCode;
                                  },
                                  (valid) {
                                    if (valid != null) _valid = valid;
                                  },
                                  countryCode: _countryCode,
                                  initialCountry: widget.initialMobileCountry,
                                  preferredCountries:
                                      widget.preferredMobileCountries,
                                  validator: (val) {
                                    if (val == null || val.isEmpty) {
                                      if (widget.requireMobileNumber)
                                        return 'Invalid phone number';
                                      return null;
                                    }
                                    if (_isoCode == null || !_valid)
                                      return 'Invalid phone number';
                                    return null;
                                  })),
                          Visibility(
                            visible: widget.showAddress,
                            child: TextFormField(
                              textAlign: TextAlign.center,
                              controller: _addressController,
                              decoration: InputDecoration(
                                prefixIcon: Padding(
                                  padding: EdgeInsets.only(top: 5),
                                  child: Icon(Icons.home_outlined),
                                ),
                                fillColor: Color(0xFFFFFFFF).withOpacity(0.1),
                                filled: true,
                                labelText: 'Address',
                                suffix: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      availablePlaceApi(
                                              widget.googlePlaceApiKey,
                                              widget.locationIqApiKey)
                                          ? IconButton(
                                              icon: Icon(Icons.search),
                                              onPressed: searchAddr)
                                          : SizedBox(),
                                      IconButton(
                                          icon: Icon(Icons.edit),
                                          onPressed: manualAddr),
                                    ]),
                                constraints: BoxConstraints(
                                    minWidth: 320, maxWidth: 320),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
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
                            child: BronzeInputForm(
                              _newPasswordController,
                              icon: Icon(Icons.key_outlined),
                              obscureText: true,
                              labelText: 'New Password',
                              validator: newPasswordValidate,
                            ),
                          ),
                          SizedBox(height: 15),
                          Visibility(
                            visible: widget.showNewPassword,
                            child: TextFormField(
                                textAlign: TextAlign.center,
                                controller: _passwordConfirmController,
                                decoration: InputDecoration(
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.only(top: 5),
                                    child: Icon(Icons.key_outlined),
                                  ),
                                  fillColor: Color(0xFFFFFFFF).withOpacity(0.1),
                                  filled: true,
                                  labelText: 'Password Confirmation',
                                  constraints: BoxConstraints(
                                      minWidth: 320, maxWidth: 320),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                      width: 0,
                                      style: BorderStyle.none,
                                    ),
                                  ),
                                ),
                                obscureText: true,
                                validator: (value) {
                                  if (value == null || value.isEmpty)
                                    return 'Please confirm your password';
                                  if (value != _newPasswordController.text)
                                    return 'Password does not match';
                                  return null;
                                }),
                          ),
                          SizedBox(height: 15),
                          BronzeRoundedButton(() async {
                            if (_formKey.currentState == null) return;
                            if (_formKey.currentState!.validate()) {
                              PopUpReturn regPopUp = PopUpReturn.register(
                                  AccountRegistration(
                                      _firstNameController.text,
                                      _lastNameController.text,
                                      _emailController.text.trim(),
                                      '$_dialCode ${_mobileNumberController.text}',
                                      _addressController.text,
                                      _currentPasswordController.text,
                                      _newPasswordController.text,
                                      _imgString,
                                      _imgType));
                              Navigator.of(context).pop(regPopUp);
                            }
                          }, ZapOnSecondary, ZapSecondary, bronzeGradient,
                              'Continue',
                              holePunch: true, width: 320, height: 65),
                          SizedBox(height: 15),
                          BronzeRoundedButton(() {
                            Navigator.of(context).pop(PopUpReturn.optionOne());
                          }, ZapOnSecondary, ZapSecondary, bronzeCancelGradient,
                              'Login Instead',
                              holePunch: true, width: 320, height: 65)
                        ]))))));
  }
}
