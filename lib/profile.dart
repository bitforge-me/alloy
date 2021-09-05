import 'package:flutter/material.dart';

import 'package:zapdart/utils.dart';
import 'package:zapdart/widgets.dart';
import 'package:zapdart/account_forms.dart';

import 'beryllium.dart';
import 'utils.dart';

class ProfileScreen extends StatefulWidget {
  final UserInfo userInfo;

  ProfileScreen(this.userInfo);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState(userInfo);
}

class _ProfileScreenState extends State<ProfileScreen> {
  UserInfo _userInfo;

  _ProfileScreenState(this._userInfo);

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

  void _updateProfile() async {
    var reg = accountRegistration();
    var newReg = await Navigator.push<AccountRegistration>(
        context,
        MaterialPageRoute(
            builder: (context) => AccountRegisterForm(reg,
                instructions: 'Enter your details to update',
                showName: false,
                showMobileNumber: false,
                showAddress: false,
                showCurrentPassword: true,
                showNewPassword: true)));
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
      if (newReg.photo != reg.photo) {
        showAlertDialog(context, 'updating photo..');
        var result = await beUserUpdatePhoto(newReg.photo, newReg.photoType);
        Navigator.of(context).pop();
        if (result.type == ErrorType.None) {
          flushbarMsg(context, 'update photo completed');
        } else
          flushbarMsg(context, 'failed to update photo',
              category: MessageCategory.Warning);
      }
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
      //TODO
      //widget._ws.accountInfoUpdate();
    }
  }

  Future<void> _resetPassword() async {
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
              leading: Icon(Icons.account_circle),
              onTap: _updateProfile,
              title: Text('Update Profile')),
          ListTile(
              leading: Icon(Icons.lock),
              onTap: _resetPassword,
              title: Text('Reset Password'))
        ]));
  }
}
