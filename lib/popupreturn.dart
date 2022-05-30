import 'package:zapdart/account_forms.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'popupreturn.freezed.dart';

// This class will be returned by BronzeLoginForm, BronzeRegisterForm etc
// to prompt which container should be pushed to the stack next
@freezed
class PopUpReturn with _$PopUpReturn {
  const factory PopUpReturn.register(AccountRegistration reg) = Registered;
  const factory PopUpReturn.login(AccountLogin login) = LoggedIn;
  const factory PopUpReturn.accountRequest(AccountRequestApiKey req) = LostPass;
  const factory PopUpReturn.optionOne() = OptionOne;
  const factory PopUpReturn.optionTwo() = OptionTwo;
}
