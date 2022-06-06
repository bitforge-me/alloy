// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'popupreturn.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PopUpReturnTearOff {
  const _$PopUpReturnTearOff();

  Register register(AccountRegistration reg) {
    return Register(
      reg,
    );
  }

  Login login(AccountLogin login) {
    return Login(
      login,
    );
  }

  AccountRequest accountRequest(AccountRequestApiKey req) {
    return AccountRequest(
      req,
    );
  }

  OptionOne optionOne() {
    return const OptionOne();
  }

  OptionTwo optionTwo() {
    return const OptionTwo();
  }
}

/// @nodoc
const $PopUpReturn = _$PopUpReturnTearOff();

/// @nodoc
mixin _$PopUpReturn {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AccountRegistration reg) register,
    required TResult Function(AccountLogin login) login,
    required TResult Function(AccountRequestApiKey req) accountRequest,
    required TResult Function() optionOne,
    required TResult Function() optionTwo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(AccountRegistration reg)? register,
    TResult Function(AccountLogin login)? login,
    TResult Function(AccountRequestApiKey req)? accountRequest,
    TResult Function()? optionOne,
    TResult Function()? optionTwo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AccountRegistration reg)? register,
    TResult Function(AccountLogin login)? login,
    TResult Function(AccountRequestApiKey req)? accountRequest,
    TResult Function()? optionOne,
    TResult Function()? optionTwo,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Register value) register,
    required TResult Function(Login value) login,
    required TResult Function(AccountRequest value) accountRequest,
    required TResult Function(OptionOne value) optionOne,
    required TResult Function(OptionTwo value) optionTwo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Register value)? register,
    TResult Function(Login value)? login,
    TResult Function(AccountRequest value)? accountRequest,
    TResult Function(OptionOne value)? optionOne,
    TResult Function(OptionTwo value)? optionTwo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Register value)? register,
    TResult Function(Login value)? login,
    TResult Function(AccountRequest value)? accountRequest,
    TResult Function(OptionOne value)? optionOne,
    TResult Function(OptionTwo value)? optionTwo,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PopUpReturnCopyWith<$Res> {
  factory $PopUpReturnCopyWith(
          PopUpReturn value, $Res Function(PopUpReturn) then) =
      _$PopUpReturnCopyWithImpl<$Res>;
}

/// @nodoc
class _$PopUpReturnCopyWithImpl<$Res> implements $PopUpReturnCopyWith<$Res> {
  _$PopUpReturnCopyWithImpl(this._value, this._then);

  final PopUpReturn _value;
  // ignore: unused_field
  final $Res Function(PopUpReturn) _then;
}

/// @nodoc
abstract class $RegisterCopyWith<$Res> {
  factory $RegisterCopyWith(Register value, $Res Function(Register) then) =
      _$RegisterCopyWithImpl<$Res>;
  $Res call({AccountRegistration reg});
}

/// @nodoc
class _$RegisterCopyWithImpl<$Res> extends _$PopUpReturnCopyWithImpl<$Res>
    implements $RegisterCopyWith<$Res> {
  _$RegisterCopyWithImpl(Register _value, $Res Function(Register) _then)
      : super(_value, (v) => _then(v as Register));

  @override
  Register get _value => super._value as Register;

  @override
  $Res call({
    Object? reg = freezed,
  }) {
    return _then(Register(
      reg == freezed
          ? _value.reg
          : reg // ignore: cast_nullable_to_non_nullable
              as AccountRegistration,
    ));
  }
}

/// @nodoc

class _$Register with DiagnosticableTreeMixin implements Register {
  const _$Register(this.reg);

  @override
  final AccountRegistration reg;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PopUpReturn.register(reg: $reg)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PopUpReturn.register'))
      ..add(DiagnosticsProperty('reg', reg));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Register &&
            (identical(other.reg, reg) || other.reg == reg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, reg);

  @JsonKey(ignore: true)
  @override
  $RegisterCopyWith<Register> get copyWith =>
      _$RegisterCopyWithImpl<Register>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AccountRegistration reg) register,
    required TResult Function(AccountLogin login) login,
    required TResult Function(AccountRequestApiKey req) accountRequest,
    required TResult Function() optionOne,
    required TResult Function() optionTwo,
  }) {
    return register(reg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(AccountRegistration reg)? register,
    TResult Function(AccountLogin login)? login,
    TResult Function(AccountRequestApiKey req)? accountRequest,
    TResult Function()? optionOne,
    TResult Function()? optionTwo,
  }) {
    return register?.call(reg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AccountRegistration reg)? register,
    TResult Function(AccountLogin login)? login,
    TResult Function(AccountRequestApiKey req)? accountRequest,
    TResult Function()? optionOne,
    TResult Function()? optionTwo,
    required TResult orElse(),
  }) {
    if (register != null) {
      return register(reg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Register value) register,
    required TResult Function(Login value) login,
    required TResult Function(AccountRequest value) accountRequest,
    required TResult Function(OptionOne value) optionOne,
    required TResult Function(OptionTwo value) optionTwo,
  }) {
    return register(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Register value)? register,
    TResult Function(Login value)? login,
    TResult Function(AccountRequest value)? accountRequest,
    TResult Function(OptionOne value)? optionOne,
    TResult Function(OptionTwo value)? optionTwo,
  }) {
    return register?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Register value)? register,
    TResult Function(Login value)? login,
    TResult Function(AccountRequest value)? accountRequest,
    TResult Function(OptionOne value)? optionOne,
    TResult Function(OptionTwo value)? optionTwo,
    required TResult orElse(),
  }) {
    if (register != null) {
      return register(this);
    }
    return orElse();
  }
}

abstract class Register implements PopUpReturn {
  const factory Register(AccountRegistration reg) = _$Register;

  AccountRegistration get reg;
  @JsonKey(ignore: true)
  $RegisterCopyWith<Register> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginCopyWith<$Res> {
  factory $LoginCopyWith(Login value, $Res Function(Login) then) =
      _$LoginCopyWithImpl<$Res>;
  $Res call({AccountLogin login});
}

/// @nodoc
class _$LoginCopyWithImpl<$Res> extends _$PopUpReturnCopyWithImpl<$Res>
    implements $LoginCopyWith<$Res> {
  _$LoginCopyWithImpl(Login _value, $Res Function(Login) _then)
      : super(_value, (v) => _then(v as Login));

  @override
  Login get _value => super._value as Login;

  @override
  $Res call({
    Object? login = freezed,
  }) {
    return _then(Login(
      login == freezed
          ? _value.login
          : login // ignore: cast_nullable_to_non_nullable
              as AccountLogin,
    ));
  }
}

/// @nodoc

class _$Login with DiagnosticableTreeMixin implements Login {
  const _$Login(this.login);

  @override
  final AccountLogin login;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PopUpReturn.login(login: $login)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PopUpReturn.login'))
      ..add(DiagnosticsProperty('login', login));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Login &&
            (identical(other.login, login) || other.login == login));
  }

  @override
  int get hashCode => Object.hash(runtimeType, login);

  @JsonKey(ignore: true)
  @override
  $LoginCopyWith<Login> get copyWith =>
      _$LoginCopyWithImpl<Login>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AccountRegistration reg) register,
    required TResult Function(AccountLogin login) login,
    required TResult Function(AccountRequestApiKey req) accountRequest,
    required TResult Function() optionOne,
    required TResult Function() optionTwo,
  }) {
    return login(this.login);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(AccountRegistration reg)? register,
    TResult Function(AccountLogin login)? login,
    TResult Function(AccountRequestApiKey req)? accountRequest,
    TResult Function()? optionOne,
    TResult Function()? optionTwo,
  }) {
    return login?.call(this.login);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AccountRegistration reg)? register,
    TResult Function(AccountLogin login)? login,
    TResult Function(AccountRequestApiKey req)? accountRequest,
    TResult Function()? optionOne,
    TResult Function()? optionTwo,
    required TResult orElse(),
  }) {
    if (login != null) {
      return login(this.login);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Register value) register,
    required TResult Function(Login value) login,
    required TResult Function(AccountRequest value) accountRequest,
    required TResult Function(OptionOne value) optionOne,
    required TResult Function(OptionTwo value) optionTwo,
  }) {
    return login(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Register value)? register,
    TResult Function(Login value)? login,
    TResult Function(AccountRequest value)? accountRequest,
    TResult Function(OptionOne value)? optionOne,
    TResult Function(OptionTwo value)? optionTwo,
  }) {
    return login?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Register value)? register,
    TResult Function(Login value)? login,
    TResult Function(AccountRequest value)? accountRequest,
    TResult Function(OptionOne value)? optionOne,
    TResult Function(OptionTwo value)? optionTwo,
    required TResult orElse(),
  }) {
    if (login != null) {
      return login(this);
    }
    return orElse();
  }
}

abstract class Login implements PopUpReturn {
  const factory Login(AccountLogin login) = _$Login;

  AccountLogin get login;
  @JsonKey(ignore: true)
  $LoginCopyWith<Login> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountRequestCopyWith<$Res> {
  factory $AccountRequestCopyWith(
          AccountRequest value, $Res Function(AccountRequest) then) =
      _$AccountRequestCopyWithImpl<$Res>;
  $Res call({AccountRequestApiKey req});
}

/// @nodoc
class _$AccountRequestCopyWithImpl<$Res> extends _$PopUpReturnCopyWithImpl<$Res>
    implements $AccountRequestCopyWith<$Res> {
  _$AccountRequestCopyWithImpl(
      AccountRequest _value, $Res Function(AccountRequest) _then)
      : super(_value, (v) => _then(v as AccountRequest));

  @override
  AccountRequest get _value => super._value as AccountRequest;

  @override
  $Res call({
    Object? req = freezed,
  }) {
    return _then(AccountRequest(
      req == freezed
          ? _value.req
          : req // ignore: cast_nullable_to_non_nullable
              as AccountRequestApiKey,
    ));
  }
}

/// @nodoc

class _$AccountRequest with DiagnosticableTreeMixin implements AccountRequest {
  const _$AccountRequest(this.req);

  @override
  final AccountRequestApiKey req;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PopUpReturn.accountRequest(req: $req)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PopUpReturn.accountRequest'))
      ..add(DiagnosticsProperty('req', req));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AccountRequest &&
            (identical(other.req, req) || other.req == req));
  }

  @override
  int get hashCode => Object.hash(runtimeType, req);

  @JsonKey(ignore: true)
  @override
  $AccountRequestCopyWith<AccountRequest> get copyWith =>
      _$AccountRequestCopyWithImpl<AccountRequest>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AccountRegistration reg) register,
    required TResult Function(AccountLogin login) login,
    required TResult Function(AccountRequestApiKey req) accountRequest,
    required TResult Function() optionOne,
    required TResult Function() optionTwo,
  }) {
    return accountRequest(req);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(AccountRegistration reg)? register,
    TResult Function(AccountLogin login)? login,
    TResult Function(AccountRequestApiKey req)? accountRequest,
    TResult Function()? optionOne,
    TResult Function()? optionTwo,
  }) {
    return accountRequest?.call(req);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AccountRegistration reg)? register,
    TResult Function(AccountLogin login)? login,
    TResult Function(AccountRequestApiKey req)? accountRequest,
    TResult Function()? optionOne,
    TResult Function()? optionTwo,
    required TResult orElse(),
  }) {
    if (accountRequest != null) {
      return accountRequest(req);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Register value) register,
    required TResult Function(Login value) login,
    required TResult Function(AccountRequest value) accountRequest,
    required TResult Function(OptionOne value) optionOne,
    required TResult Function(OptionTwo value) optionTwo,
  }) {
    return accountRequest(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Register value)? register,
    TResult Function(Login value)? login,
    TResult Function(AccountRequest value)? accountRequest,
    TResult Function(OptionOne value)? optionOne,
    TResult Function(OptionTwo value)? optionTwo,
  }) {
    return accountRequest?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Register value)? register,
    TResult Function(Login value)? login,
    TResult Function(AccountRequest value)? accountRequest,
    TResult Function(OptionOne value)? optionOne,
    TResult Function(OptionTwo value)? optionTwo,
    required TResult orElse(),
  }) {
    if (accountRequest != null) {
      return accountRequest(this);
    }
    return orElse();
  }
}

abstract class AccountRequest implements PopUpReturn {
  const factory AccountRequest(AccountRequestApiKey req) = _$AccountRequest;

  AccountRequestApiKey get req;
  @JsonKey(ignore: true)
  $AccountRequestCopyWith<AccountRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OptionOneCopyWith<$Res> {
  factory $OptionOneCopyWith(OptionOne value, $Res Function(OptionOne) then) =
      _$OptionOneCopyWithImpl<$Res>;
}

/// @nodoc
class _$OptionOneCopyWithImpl<$Res> extends _$PopUpReturnCopyWithImpl<$Res>
    implements $OptionOneCopyWith<$Res> {
  _$OptionOneCopyWithImpl(OptionOne _value, $Res Function(OptionOne) _then)
      : super(_value, (v) => _then(v as OptionOne));

  @override
  OptionOne get _value => super._value as OptionOne;
}

/// @nodoc

class _$OptionOne with DiagnosticableTreeMixin implements OptionOne {
  const _$OptionOne();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PopUpReturn.optionOne()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'PopUpReturn.optionOne'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is OptionOne);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AccountRegistration reg) register,
    required TResult Function(AccountLogin login) login,
    required TResult Function(AccountRequestApiKey req) accountRequest,
    required TResult Function() optionOne,
    required TResult Function() optionTwo,
  }) {
    return optionOne();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(AccountRegistration reg)? register,
    TResult Function(AccountLogin login)? login,
    TResult Function(AccountRequestApiKey req)? accountRequest,
    TResult Function()? optionOne,
    TResult Function()? optionTwo,
  }) {
    return optionOne?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AccountRegistration reg)? register,
    TResult Function(AccountLogin login)? login,
    TResult Function(AccountRequestApiKey req)? accountRequest,
    TResult Function()? optionOne,
    TResult Function()? optionTwo,
    required TResult orElse(),
  }) {
    if (optionOne != null) {
      return optionOne();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Register value) register,
    required TResult Function(Login value) login,
    required TResult Function(AccountRequest value) accountRequest,
    required TResult Function(OptionOne value) optionOne,
    required TResult Function(OptionTwo value) optionTwo,
  }) {
    return optionOne(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Register value)? register,
    TResult Function(Login value)? login,
    TResult Function(AccountRequest value)? accountRequest,
    TResult Function(OptionOne value)? optionOne,
    TResult Function(OptionTwo value)? optionTwo,
  }) {
    return optionOne?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Register value)? register,
    TResult Function(Login value)? login,
    TResult Function(AccountRequest value)? accountRequest,
    TResult Function(OptionOne value)? optionOne,
    TResult Function(OptionTwo value)? optionTwo,
    required TResult orElse(),
  }) {
    if (optionOne != null) {
      return optionOne(this);
    }
    return orElse();
  }
}

abstract class OptionOne implements PopUpReturn {
  const factory OptionOne() = _$OptionOne;
}

/// @nodoc
abstract class $OptionTwoCopyWith<$Res> {
  factory $OptionTwoCopyWith(OptionTwo value, $Res Function(OptionTwo) then) =
      _$OptionTwoCopyWithImpl<$Res>;
}

/// @nodoc
class _$OptionTwoCopyWithImpl<$Res> extends _$PopUpReturnCopyWithImpl<$Res>
    implements $OptionTwoCopyWith<$Res> {
  _$OptionTwoCopyWithImpl(OptionTwo _value, $Res Function(OptionTwo) _then)
      : super(_value, (v) => _then(v as OptionTwo));

  @override
  OptionTwo get _value => super._value as OptionTwo;
}

/// @nodoc

class _$OptionTwo with DiagnosticableTreeMixin implements OptionTwo {
  const _$OptionTwo();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PopUpReturn.optionTwo()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'PopUpReturn.optionTwo'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is OptionTwo);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AccountRegistration reg) register,
    required TResult Function(AccountLogin login) login,
    required TResult Function(AccountRequestApiKey req) accountRequest,
    required TResult Function() optionOne,
    required TResult Function() optionTwo,
  }) {
    return optionTwo();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(AccountRegistration reg)? register,
    TResult Function(AccountLogin login)? login,
    TResult Function(AccountRequestApiKey req)? accountRequest,
    TResult Function()? optionOne,
    TResult Function()? optionTwo,
  }) {
    return optionTwo?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AccountRegistration reg)? register,
    TResult Function(AccountLogin login)? login,
    TResult Function(AccountRequestApiKey req)? accountRequest,
    TResult Function()? optionOne,
    TResult Function()? optionTwo,
    required TResult orElse(),
  }) {
    if (optionTwo != null) {
      return optionTwo();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Register value) register,
    required TResult Function(Login value) login,
    required TResult Function(AccountRequest value) accountRequest,
    required TResult Function(OptionOne value) optionOne,
    required TResult Function(OptionTwo value) optionTwo,
  }) {
    return optionTwo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Register value)? register,
    TResult Function(Login value)? login,
    TResult Function(AccountRequest value)? accountRequest,
    TResult Function(OptionOne value)? optionOne,
    TResult Function(OptionTwo value)? optionTwo,
  }) {
    return optionTwo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Register value)? register,
    TResult Function(Login value)? login,
    TResult Function(AccountRequest value)? accountRequest,
    TResult Function(OptionOne value)? optionOne,
    TResult Function(OptionTwo value)? optionTwo,
    required TResult orElse(),
  }) {
    if (optionTwo != null) {
      return optionTwo(this);
    }
    return orElse();
  }
}

abstract class OptionTwo implements PopUpReturn {
  const factory OptionTwo() = _$OptionTwo;
}
