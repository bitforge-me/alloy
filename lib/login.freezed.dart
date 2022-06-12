// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'login.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$LoginChoiceTearOff {
  const _$LoginChoiceTearOff();

  LCDoLogin doLogin() {
    return const LCDoLogin();
  }

  LCDoRegistration doRegistration() {
    return const LCDoRegistration();
  }

  LCDApiKeyRequest doApiKeyRequest() {
    return const LCDApiKeyRequest();
  }

  LCRegistration registration(AccountRegistration reg) {
    return LCRegistration(
      reg,
    );
  }

  LCLogin login(AccountLogin login) {
    return LCLogin(
      login,
    );
  }

  LCRequestApiKey apiKeyRequest(AccountRequestApiKey req) {
    return LCRequestApiKey(
      req,
    );
  }
}

/// @nodoc
const $LoginChoice = _$LoginChoiceTearOff();

/// @nodoc
mixin _$LoginChoice {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() doLogin,
    required TResult Function() doRegistration,
    required TResult Function() doApiKeyRequest,
    required TResult Function(AccountRegistration reg) registration,
    required TResult Function(AccountLogin login) login,
    required TResult Function(AccountRequestApiKey req) apiKeyRequest,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? doLogin,
    TResult Function()? doRegistration,
    TResult Function()? doApiKeyRequest,
    TResult Function(AccountRegistration reg)? registration,
    TResult Function(AccountLogin login)? login,
    TResult Function(AccountRequestApiKey req)? apiKeyRequest,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? doLogin,
    TResult Function()? doRegistration,
    TResult Function()? doApiKeyRequest,
    TResult Function(AccountRegistration reg)? registration,
    TResult Function(AccountLogin login)? login,
    TResult Function(AccountRequestApiKey req)? apiKeyRequest,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LCDoLogin value) doLogin,
    required TResult Function(LCDoRegistration value) doRegistration,
    required TResult Function(LCDApiKeyRequest value) doApiKeyRequest,
    required TResult Function(LCRegistration value) registration,
    required TResult Function(LCLogin value) login,
    required TResult Function(LCRequestApiKey value) apiKeyRequest,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LCDoLogin value)? doLogin,
    TResult Function(LCDoRegistration value)? doRegistration,
    TResult Function(LCDApiKeyRequest value)? doApiKeyRequest,
    TResult Function(LCRegistration value)? registration,
    TResult Function(LCLogin value)? login,
    TResult Function(LCRequestApiKey value)? apiKeyRequest,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LCDoLogin value)? doLogin,
    TResult Function(LCDoRegistration value)? doRegistration,
    TResult Function(LCDApiKeyRequest value)? doApiKeyRequest,
    TResult Function(LCRegistration value)? registration,
    TResult Function(LCLogin value)? login,
    TResult Function(LCRequestApiKey value)? apiKeyRequest,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginChoiceCopyWith<$Res> {
  factory $LoginChoiceCopyWith(
          LoginChoice value, $Res Function(LoginChoice) then) =
      _$LoginChoiceCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoginChoiceCopyWithImpl<$Res> implements $LoginChoiceCopyWith<$Res> {
  _$LoginChoiceCopyWithImpl(this._value, this._then);

  final LoginChoice _value;
  // ignore: unused_field
  final $Res Function(LoginChoice) _then;
}

/// @nodoc
abstract class $LCDoLoginCopyWith<$Res> {
  factory $LCDoLoginCopyWith(LCDoLogin value, $Res Function(LCDoLogin) then) =
      _$LCDoLoginCopyWithImpl<$Res>;
}

/// @nodoc
class _$LCDoLoginCopyWithImpl<$Res> extends _$LoginChoiceCopyWithImpl<$Res>
    implements $LCDoLoginCopyWith<$Res> {
  _$LCDoLoginCopyWithImpl(LCDoLogin _value, $Res Function(LCDoLogin) _then)
      : super(_value, (v) => _then(v as LCDoLogin));

  @override
  LCDoLogin get _value => super._value as LCDoLogin;
}

/// @nodoc

class _$LCDoLogin implements LCDoLogin {
  const _$LCDoLogin();

  @override
  String toString() {
    return 'LoginChoice.doLogin()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LCDoLogin);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() doLogin,
    required TResult Function() doRegistration,
    required TResult Function() doApiKeyRequest,
    required TResult Function(AccountRegistration reg) registration,
    required TResult Function(AccountLogin login) login,
    required TResult Function(AccountRequestApiKey req) apiKeyRequest,
  }) {
    return doLogin();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? doLogin,
    TResult Function()? doRegistration,
    TResult Function()? doApiKeyRequest,
    TResult Function(AccountRegistration reg)? registration,
    TResult Function(AccountLogin login)? login,
    TResult Function(AccountRequestApiKey req)? apiKeyRequest,
  }) {
    return doLogin?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? doLogin,
    TResult Function()? doRegistration,
    TResult Function()? doApiKeyRequest,
    TResult Function(AccountRegistration reg)? registration,
    TResult Function(AccountLogin login)? login,
    TResult Function(AccountRequestApiKey req)? apiKeyRequest,
    required TResult orElse(),
  }) {
    if (doLogin != null) {
      return doLogin();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LCDoLogin value) doLogin,
    required TResult Function(LCDoRegistration value) doRegistration,
    required TResult Function(LCDApiKeyRequest value) doApiKeyRequest,
    required TResult Function(LCRegistration value) registration,
    required TResult Function(LCLogin value) login,
    required TResult Function(LCRequestApiKey value) apiKeyRequest,
  }) {
    return doLogin(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LCDoLogin value)? doLogin,
    TResult Function(LCDoRegistration value)? doRegistration,
    TResult Function(LCDApiKeyRequest value)? doApiKeyRequest,
    TResult Function(LCRegistration value)? registration,
    TResult Function(LCLogin value)? login,
    TResult Function(LCRequestApiKey value)? apiKeyRequest,
  }) {
    return doLogin?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LCDoLogin value)? doLogin,
    TResult Function(LCDoRegistration value)? doRegistration,
    TResult Function(LCDApiKeyRequest value)? doApiKeyRequest,
    TResult Function(LCRegistration value)? registration,
    TResult Function(LCLogin value)? login,
    TResult Function(LCRequestApiKey value)? apiKeyRequest,
    required TResult orElse(),
  }) {
    if (doLogin != null) {
      return doLogin(this);
    }
    return orElse();
  }
}

abstract class LCDoLogin implements LoginChoice {
  const factory LCDoLogin() = _$LCDoLogin;
}

/// @nodoc
abstract class $LCDoRegistrationCopyWith<$Res> {
  factory $LCDoRegistrationCopyWith(
          LCDoRegistration value, $Res Function(LCDoRegistration) then) =
      _$LCDoRegistrationCopyWithImpl<$Res>;
}

/// @nodoc
class _$LCDoRegistrationCopyWithImpl<$Res>
    extends _$LoginChoiceCopyWithImpl<$Res>
    implements $LCDoRegistrationCopyWith<$Res> {
  _$LCDoRegistrationCopyWithImpl(
      LCDoRegistration _value, $Res Function(LCDoRegistration) _then)
      : super(_value, (v) => _then(v as LCDoRegistration));

  @override
  LCDoRegistration get _value => super._value as LCDoRegistration;
}

/// @nodoc

class _$LCDoRegistration implements LCDoRegistration {
  const _$LCDoRegistration();

  @override
  String toString() {
    return 'LoginChoice.doRegistration()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LCDoRegistration);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() doLogin,
    required TResult Function() doRegistration,
    required TResult Function() doApiKeyRequest,
    required TResult Function(AccountRegistration reg) registration,
    required TResult Function(AccountLogin login) login,
    required TResult Function(AccountRequestApiKey req) apiKeyRequest,
  }) {
    return doRegistration();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? doLogin,
    TResult Function()? doRegistration,
    TResult Function()? doApiKeyRequest,
    TResult Function(AccountRegistration reg)? registration,
    TResult Function(AccountLogin login)? login,
    TResult Function(AccountRequestApiKey req)? apiKeyRequest,
  }) {
    return doRegistration?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? doLogin,
    TResult Function()? doRegistration,
    TResult Function()? doApiKeyRequest,
    TResult Function(AccountRegistration reg)? registration,
    TResult Function(AccountLogin login)? login,
    TResult Function(AccountRequestApiKey req)? apiKeyRequest,
    required TResult orElse(),
  }) {
    if (doRegistration != null) {
      return doRegistration();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LCDoLogin value) doLogin,
    required TResult Function(LCDoRegistration value) doRegistration,
    required TResult Function(LCDApiKeyRequest value) doApiKeyRequest,
    required TResult Function(LCRegistration value) registration,
    required TResult Function(LCLogin value) login,
    required TResult Function(LCRequestApiKey value) apiKeyRequest,
  }) {
    return doRegistration(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LCDoLogin value)? doLogin,
    TResult Function(LCDoRegistration value)? doRegistration,
    TResult Function(LCDApiKeyRequest value)? doApiKeyRequest,
    TResult Function(LCRegistration value)? registration,
    TResult Function(LCLogin value)? login,
    TResult Function(LCRequestApiKey value)? apiKeyRequest,
  }) {
    return doRegistration?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LCDoLogin value)? doLogin,
    TResult Function(LCDoRegistration value)? doRegistration,
    TResult Function(LCDApiKeyRequest value)? doApiKeyRequest,
    TResult Function(LCRegistration value)? registration,
    TResult Function(LCLogin value)? login,
    TResult Function(LCRequestApiKey value)? apiKeyRequest,
    required TResult orElse(),
  }) {
    if (doRegistration != null) {
      return doRegistration(this);
    }
    return orElse();
  }
}

abstract class LCDoRegistration implements LoginChoice {
  const factory LCDoRegistration() = _$LCDoRegistration;
}

/// @nodoc
abstract class $LCDApiKeyRequestCopyWith<$Res> {
  factory $LCDApiKeyRequestCopyWith(
          LCDApiKeyRequest value, $Res Function(LCDApiKeyRequest) then) =
      _$LCDApiKeyRequestCopyWithImpl<$Res>;
}

/// @nodoc
class _$LCDApiKeyRequestCopyWithImpl<$Res>
    extends _$LoginChoiceCopyWithImpl<$Res>
    implements $LCDApiKeyRequestCopyWith<$Res> {
  _$LCDApiKeyRequestCopyWithImpl(
      LCDApiKeyRequest _value, $Res Function(LCDApiKeyRequest) _then)
      : super(_value, (v) => _then(v as LCDApiKeyRequest));

  @override
  LCDApiKeyRequest get _value => super._value as LCDApiKeyRequest;
}

/// @nodoc

class _$LCDApiKeyRequest implements LCDApiKeyRequest {
  const _$LCDApiKeyRequest();

  @override
  String toString() {
    return 'LoginChoice.doApiKeyRequest()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LCDApiKeyRequest);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() doLogin,
    required TResult Function() doRegistration,
    required TResult Function() doApiKeyRequest,
    required TResult Function(AccountRegistration reg) registration,
    required TResult Function(AccountLogin login) login,
    required TResult Function(AccountRequestApiKey req) apiKeyRequest,
  }) {
    return doApiKeyRequest();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? doLogin,
    TResult Function()? doRegistration,
    TResult Function()? doApiKeyRequest,
    TResult Function(AccountRegistration reg)? registration,
    TResult Function(AccountLogin login)? login,
    TResult Function(AccountRequestApiKey req)? apiKeyRequest,
  }) {
    return doApiKeyRequest?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? doLogin,
    TResult Function()? doRegistration,
    TResult Function()? doApiKeyRequest,
    TResult Function(AccountRegistration reg)? registration,
    TResult Function(AccountLogin login)? login,
    TResult Function(AccountRequestApiKey req)? apiKeyRequest,
    required TResult orElse(),
  }) {
    if (doApiKeyRequest != null) {
      return doApiKeyRequest();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LCDoLogin value) doLogin,
    required TResult Function(LCDoRegistration value) doRegistration,
    required TResult Function(LCDApiKeyRequest value) doApiKeyRequest,
    required TResult Function(LCRegistration value) registration,
    required TResult Function(LCLogin value) login,
    required TResult Function(LCRequestApiKey value) apiKeyRequest,
  }) {
    return doApiKeyRequest(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LCDoLogin value)? doLogin,
    TResult Function(LCDoRegistration value)? doRegistration,
    TResult Function(LCDApiKeyRequest value)? doApiKeyRequest,
    TResult Function(LCRegistration value)? registration,
    TResult Function(LCLogin value)? login,
    TResult Function(LCRequestApiKey value)? apiKeyRequest,
  }) {
    return doApiKeyRequest?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LCDoLogin value)? doLogin,
    TResult Function(LCDoRegistration value)? doRegistration,
    TResult Function(LCDApiKeyRequest value)? doApiKeyRequest,
    TResult Function(LCRegistration value)? registration,
    TResult Function(LCLogin value)? login,
    TResult Function(LCRequestApiKey value)? apiKeyRequest,
    required TResult orElse(),
  }) {
    if (doApiKeyRequest != null) {
      return doApiKeyRequest(this);
    }
    return orElse();
  }
}

abstract class LCDApiKeyRequest implements LoginChoice {
  const factory LCDApiKeyRequest() = _$LCDApiKeyRequest;
}

/// @nodoc
abstract class $LCRegistrationCopyWith<$Res> {
  factory $LCRegistrationCopyWith(
          LCRegistration value, $Res Function(LCRegistration) then) =
      _$LCRegistrationCopyWithImpl<$Res>;
  $Res call({AccountRegistration reg});
}

/// @nodoc
class _$LCRegistrationCopyWithImpl<$Res> extends _$LoginChoiceCopyWithImpl<$Res>
    implements $LCRegistrationCopyWith<$Res> {
  _$LCRegistrationCopyWithImpl(
      LCRegistration _value, $Res Function(LCRegistration) _then)
      : super(_value, (v) => _then(v as LCRegistration));

  @override
  LCRegistration get _value => super._value as LCRegistration;

  @override
  $Res call({
    Object? reg = freezed,
  }) {
    return _then(LCRegistration(
      reg == freezed
          ? _value.reg
          : reg // ignore: cast_nullable_to_non_nullable
              as AccountRegistration,
    ));
  }
}

/// @nodoc

class _$LCRegistration implements LCRegistration {
  const _$LCRegistration(this.reg);

  @override
  final AccountRegistration reg;

  @override
  String toString() {
    return 'LoginChoice.registration(reg: $reg)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LCRegistration &&
            (identical(other.reg, reg) || other.reg == reg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, reg);

  @JsonKey(ignore: true)
  @override
  $LCRegistrationCopyWith<LCRegistration> get copyWith =>
      _$LCRegistrationCopyWithImpl<LCRegistration>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() doLogin,
    required TResult Function() doRegistration,
    required TResult Function() doApiKeyRequest,
    required TResult Function(AccountRegistration reg) registration,
    required TResult Function(AccountLogin login) login,
    required TResult Function(AccountRequestApiKey req) apiKeyRequest,
  }) {
    return registration(reg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? doLogin,
    TResult Function()? doRegistration,
    TResult Function()? doApiKeyRequest,
    TResult Function(AccountRegistration reg)? registration,
    TResult Function(AccountLogin login)? login,
    TResult Function(AccountRequestApiKey req)? apiKeyRequest,
  }) {
    return registration?.call(reg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? doLogin,
    TResult Function()? doRegistration,
    TResult Function()? doApiKeyRequest,
    TResult Function(AccountRegistration reg)? registration,
    TResult Function(AccountLogin login)? login,
    TResult Function(AccountRequestApiKey req)? apiKeyRequest,
    required TResult orElse(),
  }) {
    if (registration != null) {
      return registration(reg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LCDoLogin value) doLogin,
    required TResult Function(LCDoRegistration value) doRegistration,
    required TResult Function(LCDApiKeyRequest value) doApiKeyRequest,
    required TResult Function(LCRegistration value) registration,
    required TResult Function(LCLogin value) login,
    required TResult Function(LCRequestApiKey value) apiKeyRequest,
  }) {
    return registration(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LCDoLogin value)? doLogin,
    TResult Function(LCDoRegistration value)? doRegistration,
    TResult Function(LCDApiKeyRequest value)? doApiKeyRequest,
    TResult Function(LCRegistration value)? registration,
    TResult Function(LCLogin value)? login,
    TResult Function(LCRequestApiKey value)? apiKeyRequest,
  }) {
    return registration?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LCDoLogin value)? doLogin,
    TResult Function(LCDoRegistration value)? doRegistration,
    TResult Function(LCDApiKeyRequest value)? doApiKeyRequest,
    TResult Function(LCRegistration value)? registration,
    TResult Function(LCLogin value)? login,
    TResult Function(LCRequestApiKey value)? apiKeyRequest,
    required TResult orElse(),
  }) {
    if (registration != null) {
      return registration(this);
    }
    return orElse();
  }
}

abstract class LCRegistration implements LoginChoice {
  const factory LCRegistration(AccountRegistration reg) = _$LCRegistration;

  AccountRegistration get reg;
  @JsonKey(ignore: true)
  $LCRegistrationCopyWith<LCRegistration> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LCLoginCopyWith<$Res> {
  factory $LCLoginCopyWith(LCLogin value, $Res Function(LCLogin) then) =
      _$LCLoginCopyWithImpl<$Res>;
  $Res call({AccountLogin login});
}

/// @nodoc
class _$LCLoginCopyWithImpl<$Res> extends _$LoginChoiceCopyWithImpl<$Res>
    implements $LCLoginCopyWith<$Res> {
  _$LCLoginCopyWithImpl(LCLogin _value, $Res Function(LCLogin) _then)
      : super(_value, (v) => _then(v as LCLogin));

  @override
  LCLogin get _value => super._value as LCLogin;

  @override
  $Res call({
    Object? login = freezed,
  }) {
    return _then(LCLogin(
      login == freezed
          ? _value.login
          : login // ignore: cast_nullable_to_non_nullable
              as AccountLogin,
    ));
  }
}

/// @nodoc

class _$LCLogin implements LCLogin {
  const _$LCLogin(this.login);

  @override
  final AccountLogin login;

  @override
  String toString() {
    return 'LoginChoice.login(login: $login)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LCLogin &&
            (identical(other.login, login) || other.login == login));
  }

  @override
  int get hashCode => Object.hash(runtimeType, login);

  @JsonKey(ignore: true)
  @override
  $LCLoginCopyWith<LCLogin> get copyWith =>
      _$LCLoginCopyWithImpl<LCLogin>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() doLogin,
    required TResult Function() doRegistration,
    required TResult Function() doApiKeyRequest,
    required TResult Function(AccountRegistration reg) registration,
    required TResult Function(AccountLogin login) login,
    required TResult Function(AccountRequestApiKey req) apiKeyRequest,
  }) {
    return login(this.login);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? doLogin,
    TResult Function()? doRegistration,
    TResult Function()? doApiKeyRequest,
    TResult Function(AccountRegistration reg)? registration,
    TResult Function(AccountLogin login)? login,
    TResult Function(AccountRequestApiKey req)? apiKeyRequest,
  }) {
    return login?.call(this.login);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? doLogin,
    TResult Function()? doRegistration,
    TResult Function()? doApiKeyRequest,
    TResult Function(AccountRegistration reg)? registration,
    TResult Function(AccountLogin login)? login,
    TResult Function(AccountRequestApiKey req)? apiKeyRequest,
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
    required TResult Function(LCDoLogin value) doLogin,
    required TResult Function(LCDoRegistration value) doRegistration,
    required TResult Function(LCDApiKeyRequest value) doApiKeyRequest,
    required TResult Function(LCRegistration value) registration,
    required TResult Function(LCLogin value) login,
    required TResult Function(LCRequestApiKey value) apiKeyRequest,
  }) {
    return login(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LCDoLogin value)? doLogin,
    TResult Function(LCDoRegistration value)? doRegistration,
    TResult Function(LCDApiKeyRequest value)? doApiKeyRequest,
    TResult Function(LCRegistration value)? registration,
    TResult Function(LCLogin value)? login,
    TResult Function(LCRequestApiKey value)? apiKeyRequest,
  }) {
    return login?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LCDoLogin value)? doLogin,
    TResult Function(LCDoRegistration value)? doRegistration,
    TResult Function(LCDApiKeyRequest value)? doApiKeyRequest,
    TResult Function(LCRegistration value)? registration,
    TResult Function(LCLogin value)? login,
    TResult Function(LCRequestApiKey value)? apiKeyRequest,
    required TResult orElse(),
  }) {
    if (login != null) {
      return login(this);
    }
    return orElse();
  }
}

abstract class LCLogin implements LoginChoice {
  const factory LCLogin(AccountLogin login) = _$LCLogin;

  AccountLogin get login;
  @JsonKey(ignore: true)
  $LCLoginCopyWith<LCLogin> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LCRequestApiKeyCopyWith<$Res> {
  factory $LCRequestApiKeyCopyWith(
          LCRequestApiKey value, $Res Function(LCRequestApiKey) then) =
      _$LCRequestApiKeyCopyWithImpl<$Res>;
  $Res call({AccountRequestApiKey req});
}

/// @nodoc
class _$LCRequestApiKeyCopyWithImpl<$Res>
    extends _$LoginChoiceCopyWithImpl<$Res>
    implements $LCRequestApiKeyCopyWith<$Res> {
  _$LCRequestApiKeyCopyWithImpl(
      LCRequestApiKey _value, $Res Function(LCRequestApiKey) _then)
      : super(_value, (v) => _then(v as LCRequestApiKey));

  @override
  LCRequestApiKey get _value => super._value as LCRequestApiKey;

  @override
  $Res call({
    Object? req = freezed,
  }) {
    return _then(LCRequestApiKey(
      req == freezed
          ? _value.req
          : req // ignore: cast_nullable_to_non_nullable
              as AccountRequestApiKey,
    ));
  }
}

/// @nodoc

class _$LCRequestApiKey implements LCRequestApiKey {
  const _$LCRequestApiKey(this.req);

  @override
  final AccountRequestApiKey req;

  @override
  String toString() {
    return 'LoginChoice.apiKeyRequest(req: $req)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LCRequestApiKey &&
            (identical(other.req, req) || other.req == req));
  }

  @override
  int get hashCode => Object.hash(runtimeType, req);

  @JsonKey(ignore: true)
  @override
  $LCRequestApiKeyCopyWith<LCRequestApiKey> get copyWith =>
      _$LCRequestApiKeyCopyWithImpl<LCRequestApiKey>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() doLogin,
    required TResult Function() doRegistration,
    required TResult Function() doApiKeyRequest,
    required TResult Function(AccountRegistration reg) registration,
    required TResult Function(AccountLogin login) login,
    required TResult Function(AccountRequestApiKey req) apiKeyRequest,
  }) {
    return apiKeyRequest(req);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? doLogin,
    TResult Function()? doRegistration,
    TResult Function()? doApiKeyRequest,
    TResult Function(AccountRegistration reg)? registration,
    TResult Function(AccountLogin login)? login,
    TResult Function(AccountRequestApiKey req)? apiKeyRequest,
  }) {
    return apiKeyRequest?.call(req);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? doLogin,
    TResult Function()? doRegistration,
    TResult Function()? doApiKeyRequest,
    TResult Function(AccountRegistration reg)? registration,
    TResult Function(AccountLogin login)? login,
    TResult Function(AccountRequestApiKey req)? apiKeyRequest,
    required TResult orElse(),
  }) {
    if (apiKeyRequest != null) {
      return apiKeyRequest(req);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LCDoLogin value) doLogin,
    required TResult Function(LCDoRegistration value) doRegistration,
    required TResult Function(LCDApiKeyRequest value) doApiKeyRequest,
    required TResult Function(LCRegistration value) registration,
    required TResult Function(LCLogin value) login,
    required TResult Function(LCRequestApiKey value) apiKeyRequest,
  }) {
    return apiKeyRequest(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LCDoLogin value)? doLogin,
    TResult Function(LCDoRegistration value)? doRegistration,
    TResult Function(LCDApiKeyRequest value)? doApiKeyRequest,
    TResult Function(LCRegistration value)? registration,
    TResult Function(LCLogin value)? login,
    TResult Function(LCRequestApiKey value)? apiKeyRequest,
  }) {
    return apiKeyRequest?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LCDoLogin value)? doLogin,
    TResult Function(LCDoRegistration value)? doRegistration,
    TResult Function(LCDApiKeyRequest value)? doApiKeyRequest,
    TResult Function(LCRegistration value)? registration,
    TResult Function(LCLogin value)? login,
    TResult Function(LCRequestApiKey value)? apiKeyRequest,
    required TResult orElse(),
  }) {
    if (apiKeyRequest != null) {
      return apiKeyRequest(this);
    }
    return orElse();
  }
}

abstract class LCRequestApiKey implements LoginChoice {
  const factory LCRequestApiKey(AccountRequestApiKey req) = _$LCRequestApiKey;

  AccountRequestApiKey get req;
  @JsonKey(ignore: true)
  $LCRequestApiKeyCopyWith<LCRequestApiKey> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$LoginResultTearOff {
  const _$LoginResultTearOff();

  LRAcct acct(Acct acct) {
    return LRAcct(
      acct,
    );
  }

  LRReset reset() {
    return const LRReset();
  }

  LRRetry retry() {
    return const LRRetry();
  }

  LRNothing nothing() {
    return const LRNothing();
  }
}

/// @nodoc
const $LoginResult = _$LoginResultTearOff();

/// @nodoc
mixin _$LoginResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Acct acct) acct,
    required TResult Function() reset,
    required TResult Function() retry,
    required TResult Function() nothing,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Acct acct)? acct,
    TResult Function()? reset,
    TResult Function()? retry,
    TResult Function()? nothing,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Acct acct)? acct,
    TResult Function()? reset,
    TResult Function()? retry,
    TResult Function()? nothing,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LRAcct value) acct,
    required TResult Function(LRReset value) reset,
    required TResult Function(LRRetry value) retry,
    required TResult Function(LRNothing value) nothing,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LRAcct value)? acct,
    TResult Function(LRReset value)? reset,
    TResult Function(LRRetry value)? retry,
    TResult Function(LRNothing value)? nothing,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LRAcct value)? acct,
    TResult Function(LRReset value)? reset,
    TResult Function(LRRetry value)? retry,
    TResult Function(LRNothing value)? nothing,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginResultCopyWith<$Res> {
  factory $LoginResultCopyWith(
          LoginResult value, $Res Function(LoginResult) then) =
      _$LoginResultCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoginResultCopyWithImpl<$Res> implements $LoginResultCopyWith<$Res> {
  _$LoginResultCopyWithImpl(this._value, this._then);

  final LoginResult _value;
  // ignore: unused_field
  final $Res Function(LoginResult) _then;
}

/// @nodoc
abstract class $LRAcctCopyWith<$Res> {
  factory $LRAcctCopyWith(LRAcct value, $Res Function(LRAcct) then) =
      _$LRAcctCopyWithImpl<$Res>;
  $Res call({Acct acct});
}

/// @nodoc
class _$LRAcctCopyWithImpl<$Res> extends _$LoginResultCopyWithImpl<$Res>
    implements $LRAcctCopyWith<$Res> {
  _$LRAcctCopyWithImpl(LRAcct _value, $Res Function(LRAcct) _then)
      : super(_value, (v) => _then(v as LRAcct));

  @override
  LRAcct get _value => super._value as LRAcct;

  @override
  $Res call({
    Object? acct = freezed,
  }) {
    return _then(LRAcct(
      acct == freezed
          ? _value.acct
          : acct // ignore: cast_nullable_to_non_nullable
              as Acct,
    ));
  }
}

/// @nodoc

class _$LRAcct implements LRAcct {
  const _$LRAcct(this.acct);

  @override
  final Acct acct;

  @override
  String toString() {
    return 'LoginResult.acct(acct: $acct)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LRAcct &&
            (identical(other.acct, acct) || other.acct == acct));
  }

  @override
  int get hashCode => Object.hash(runtimeType, acct);

  @JsonKey(ignore: true)
  @override
  $LRAcctCopyWith<LRAcct> get copyWith =>
      _$LRAcctCopyWithImpl<LRAcct>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Acct acct) acct,
    required TResult Function() reset,
    required TResult Function() retry,
    required TResult Function() nothing,
  }) {
    return acct(this.acct);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Acct acct)? acct,
    TResult Function()? reset,
    TResult Function()? retry,
    TResult Function()? nothing,
  }) {
    return acct?.call(this.acct);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Acct acct)? acct,
    TResult Function()? reset,
    TResult Function()? retry,
    TResult Function()? nothing,
    required TResult orElse(),
  }) {
    if (acct != null) {
      return acct(this.acct);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LRAcct value) acct,
    required TResult Function(LRReset value) reset,
    required TResult Function(LRRetry value) retry,
    required TResult Function(LRNothing value) nothing,
  }) {
    return acct(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LRAcct value)? acct,
    TResult Function(LRReset value)? reset,
    TResult Function(LRRetry value)? retry,
    TResult Function(LRNothing value)? nothing,
  }) {
    return acct?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LRAcct value)? acct,
    TResult Function(LRReset value)? reset,
    TResult Function(LRRetry value)? retry,
    TResult Function(LRNothing value)? nothing,
    required TResult orElse(),
  }) {
    if (acct != null) {
      return acct(this);
    }
    return orElse();
  }
}

abstract class LRAcct implements LoginResult {
  const factory LRAcct(Acct acct) = _$LRAcct;

  Acct get acct;
  @JsonKey(ignore: true)
  $LRAcctCopyWith<LRAcct> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LRResetCopyWith<$Res> {
  factory $LRResetCopyWith(LRReset value, $Res Function(LRReset) then) =
      _$LRResetCopyWithImpl<$Res>;
}

/// @nodoc
class _$LRResetCopyWithImpl<$Res> extends _$LoginResultCopyWithImpl<$Res>
    implements $LRResetCopyWith<$Res> {
  _$LRResetCopyWithImpl(LRReset _value, $Res Function(LRReset) _then)
      : super(_value, (v) => _then(v as LRReset));

  @override
  LRReset get _value => super._value as LRReset;
}

/// @nodoc

class _$LRReset implements LRReset {
  const _$LRReset();

  @override
  String toString() {
    return 'LoginResult.reset()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LRReset);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Acct acct) acct,
    required TResult Function() reset,
    required TResult Function() retry,
    required TResult Function() nothing,
  }) {
    return reset();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Acct acct)? acct,
    TResult Function()? reset,
    TResult Function()? retry,
    TResult Function()? nothing,
  }) {
    return reset?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Acct acct)? acct,
    TResult Function()? reset,
    TResult Function()? retry,
    TResult Function()? nothing,
    required TResult orElse(),
  }) {
    if (reset != null) {
      return reset();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LRAcct value) acct,
    required TResult Function(LRReset value) reset,
    required TResult Function(LRRetry value) retry,
    required TResult Function(LRNothing value) nothing,
  }) {
    return reset(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LRAcct value)? acct,
    TResult Function(LRReset value)? reset,
    TResult Function(LRRetry value)? retry,
    TResult Function(LRNothing value)? nothing,
  }) {
    return reset?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LRAcct value)? acct,
    TResult Function(LRReset value)? reset,
    TResult Function(LRRetry value)? retry,
    TResult Function(LRNothing value)? nothing,
    required TResult orElse(),
  }) {
    if (reset != null) {
      return reset(this);
    }
    return orElse();
  }
}

abstract class LRReset implements LoginResult {
  const factory LRReset() = _$LRReset;
}

/// @nodoc
abstract class $LRRetryCopyWith<$Res> {
  factory $LRRetryCopyWith(LRRetry value, $Res Function(LRRetry) then) =
      _$LRRetryCopyWithImpl<$Res>;
}

/// @nodoc
class _$LRRetryCopyWithImpl<$Res> extends _$LoginResultCopyWithImpl<$Res>
    implements $LRRetryCopyWith<$Res> {
  _$LRRetryCopyWithImpl(LRRetry _value, $Res Function(LRRetry) _then)
      : super(_value, (v) => _then(v as LRRetry));

  @override
  LRRetry get _value => super._value as LRRetry;
}

/// @nodoc

class _$LRRetry implements LRRetry {
  const _$LRRetry();

  @override
  String toString() {
    return 'LoginResult.retry()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LRRetry);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Acct acct) acct,
    required TResult Function() reset,
    required TResult Function() retry,
    required TResult Function() nothing,
  }) {
    return retry();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Acct acct)? acct,
    TResult Function()? reset,
    TResult Function()? retry,
    TResult Function()? nothing,
  }) {
    return retry?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Acct acct)? acct,
    TResult Function()? reset,
    TResult Function()? retry,
    TResult Function()? nothing,
    required TResult orElse(),
  }) {
    if (retry != null) {
      return retry();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LRAcct value) acct,
    required TResult Function(LRReset value) reset,
    required TResult Function(LRRetry value) retry,
    required TResult Function(LRNothing value) nothing,
  }) {
    return retry(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LRAcct value)? acct,
    TResult Function(LRReset value)? reset,
    TResult Function(LRRetry value)? retry,
    TResult Function(LRNothing value)? nothing,
  }) {
    return retry?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LRAcct value)? acct,
    TResult Function(LRReset value)? reset,
    TResult Function(LRRetry value)? retry,
    TResult Function(LRNothing value)? nothing,
    required TResult orElse(),
  }) {
    if (retry != null) {
      return retry(this);
    }
    return orElse();
  }
}

abstract class LRRetry implements LoginResult {
  const factory LRRetry() = _$LRRetry;
}

/// @nodoc
abstract class $LRNothingCopyWith<$Res> {
  factory $LRNothingCopyWith(LRNothing value, $Res Function(LRNothing) then) =
      _$LRNothingCopyWithImpl<$Res>;
}

/// @nodoc
class _$LRNothingCopyWithImpl<$Res> extends _$LoginResultCopyWithImpl<$Res>
    implements $LRNothingCopyWith<$Res> {
  _$LRNothingCopyWithImpl(LRNothing _value, $Res Function(LRNothing) _then)
      : super(_value, (v) => _then(v as LRNothing));

  @override
  LRNothing get _value => super._value as LRNothing;
}

/// @nodoc

class _$LRNothing implements LRNothing {
  const _$LRNothing();

  @override
  String toString() {
    return 'LoginResult.nothing()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LRNothing);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Acct acct) acct,
    required TResult Function() reset,
    required TResult Function() retry,
    required TResult Function() nothing,
  }) {
    return nothing();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Acct acct)? acct,
    TResult Function()? reset,
    TResult Function()? retry,
    TResult Function()? nothing,
  }) {
    return nothing?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Acct acct)? acct,
    TResult Function()? reset,
    TResult Function()? retry,
    TResult Function()? nothing,
    required TResult orElse(),
  }) {
    if (nothing != null) {
      return nothing();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LRAcct value) acct,
    required TResult Function(LRReset value) reset,
    required TResult Function(LRRetry value) retry,
    required TResult Function(LRNothing value) nothing,
  }) {
    return nothing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LRAcct value)? acct,
    TResult Function(LRReset value)? reset,
    TResult Function(LRRetry value)? retry,
    TResult Function(LRNothing value)? nothing,
  }) {
    return nothing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LRAcct value)? acct,
    TResult Function(LRReset value)? reset,
    TResult Function(LRRetry value)? retry,
    TResult Function(LRNothing value)? nothing,
    required TResult orElse(),
  }) {
    if (nothing != null) {
      return nothing(this);
    }
    return orElse();
  }
}

abstract class LRNothing implements LoginResult {
  const factory LRNothing() = _$LRNothing;
}
