import 'package:flutter/material.dart';

import 'package:zapdart/utils.dart';
import 'package:zapdart/widgets.dart';
import 'package:zapdart/account_forms.dart';

import 'beryllium.dart';
import 'utils.dart';
import 'websocket.dart';

class ProfileScreen extends StatefulWidget {
  final Websocket websocket;
  final UserInfo userInfo;

  ProfileScreen(this.websocket, this.userInfo);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState(userInfo);
}

class _ProfileScreenState extends State<ProfileScreen> {
  UserInfo _userInfo;

  _ProfileScreenState(this._userInfo);

  @override
  void initState() {
    super.initState();
    widget.websocket.wsEvent.subscribe(_websocketEvent);
  }

  @override
  void dispose() {
    super.dispose();
    widget.websocket.wsEvent.unsubscribe(_websocketEvent);
  }

  void _websocketEvent(WsEventArgs? args) {
    if (args == null) return;
    if (args.event == WebsocketEvent.userInfoUpdate) {
      var info = UserInfo.parse(args.msg);
      setState(() => _userInfo = info);
      flushbarMsg(context, 'user updated');
    }
  }

  AccountRegistration accountRegistration() {
    return AccountRegistration(
        vs(_userInfo.firstName),
        vs(_userInfo.lastName),
        _userInfo.email,
        vs(_userInfo.mobileNumber),
        vs(_userInfo.address),
        '',
        '',
        _userInfo.photo,
        _userInfo.photoType);
  }

  UserInfo userInfo(AccountRegistration reg) {
    return UserInfo(reg.firstName, reg.lastName, reg.mobileNumber, reg.address,
        reg.email, reg.photo, reg.photoType, [], [], false, null, false);
  }

  void _updateProfileImage() async {
    var reg = accountRegistration();
    var newReg = await Navigator.push<AccountRegistration>(
        context,
        MaterialPageRoute(
            builder: (context) => AccountRegisterForm(reg,
                instructions: 'Update Profile Image',
                showName: false,
                showEmail: false,
                showMobileNumber: false,
                showAddress: false,
                showCurrentPassword: false,
                showNewPassword: false)));
    if (newReg != null) {
      if (newReg.photo != reg.photo) {
        showAlertDialog(context, 'updating photo..');
        var result = await beUserUpdatePhoto(newReg.photo, newReg.photoType);
        Navigator.of(context).pop();
        if (result.type == ErrorType.None) {
          flushbarMsg(context, 'update photo completed');
          setState(() => _userInfo = userInfo(newReg));
        } else
          flushbarMsg(context, 'failed to update photo',
              category: MessageCategory.Warning);
      }
    }
  }

  void _updateEmail() async {
    var reg = accountRegistration();
    var newReg = await Navigator.push<AccountRegistration>(
        context,
        MaterialPageRoute(
            builder: (context) => AccountRegisterForm(reg,
                instructions: 'Update Email',
                showName: false,
                showImage: false,
                showMobileNumber: false,
                showAddress: false,
                showCurrentPassword: false,
                showNewPassword: false)));
    if (newReg != null) {
      if (newReg.email != reg.email) {
        showAlertDialog(context, 'sending update email request..');
        var result = await beUserUpdateEmail(newReg.email);
        Navigator.of(context).pop();
        if (result.type == ErrorType.None)
          flushbarMsg(context, 'update email request created');
        else {
          flushbarMsg(context, 'failed to create update email request',
              category: MessageCategory.Warning);
          return;
        }
      }
    }
  }

  void _updatePassword() async {
    var reg = accountRegistration();
    var newReg = await Navigator.push<AccountRegistration>(
        context,
        MaterialPageRoute(
            builder: (context) => AccountRegisterForm(reg,
                instructions: 'Update Password',
                showName: false,
                showImage: false,
                showEmail: false,
                showMobileNumber: false,
                showAddress: false,
                showCurrentPassword: true,
                showNewPassword: true)));
    if (newReg != null) {
      if (newReg.currentPassword.isNotEmpty && newReg.newPassword.isNotEmpty) {
        showAlertDialog(context, 'updating password..');
        var result = await beUserUpdatePassword(
            newReg.currentPassword, newReg.newPassword);
        Navigator.of(context).pop();
        if (result.type == ErrorType.None) {
          flushbarMsg(context, 'update password completed');
        } else
          flushbarMsg(context, 'failed to update password',
              category: MessageCategory.Warning);
      }
    }
  }

  Future<void> _resetPassword() async {
    if (!await askYesNo(
        context, 'Are you sure you want to reset your password?')) return;
    showAlertDialog(context, 'requesting password reset..');
    var result = await beUserResetPassword();
    Navigator.of(context).pop();
    if (result.type == ErrorType.None) {
      flushbarMsg(context, 'password reset request sent (check email)');
    } else
      flushbarMsg(context, 'failed to reset password',
          category: MessageCategory.Warning);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
        ),
        body: ListView(children: [
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            SizedBox(height: 5),
            accountImage(_userInfo.photo, _userInfo.photoType),
            SizedBox(height: 5),
            Text('${_userInfo.email}'),
            SizedBox(height: 5)
          ]),
          ListTile(
              leading: Icon(Icons.account_box),
              onTap: _updateProfileImage,
              title: Text('Update Profile Image')),
          ListTile(
              leading: Icon(Icons.email),
              onTap: _updateEmail,
              title: Text('Update Email')),
          ListTile(
              leading: Icon(Icons.password),
              onTap: _updatePassword,
              title: Text('Update Password')),
          ListTile(
              leading: Icon(Icons.restart_alt),
              onTap: _resetPassword,
              title: Text('Reset Password'))
        ]));
  }
}
