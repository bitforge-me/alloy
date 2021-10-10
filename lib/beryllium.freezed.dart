// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'beryllium.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$BeError2TearOff {
  const _$BeError2TearOff();

  Network network() {
    return const Network();
  }

  Auth auth(String message) {
    return Auth(
      message,
    );
  }
}

/// @nodoc
const $BeError2 = _$BeError2TearOff();

/// @nodoc
mixin _$BeError2 {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() network,
    required TResult Function(String message) auth,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? network,
    TResult Function(String message)? auth,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? network,
    TResult Function(String message)? auth,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Network value) network,
    required TResult Function(Auth value) auth,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Network value)? network,
    TResult Function(Auth value)? auth,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Network value)? network,
    TResult Function(Auth value)? auth,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BeError2CopyWith<$Res> {
  factory $BeError2CopyWith(BeError2 value, $Res Function(BeError2) then) =
      _$BeError2CopyWithImpl<$Res>;
}

/// @nodoc
class _$BeError2CopyWithImpl<$Res> implements $BeError2CopyWith<$Res> {
  _$BeError2CopyWithImpl(this._value, this._then);

  final BeError2 _value;
  // ignore: unused_field
  final $Res Function(BeError2) _then;
}

/// @nodoc
abstract class $NetworkCopyWith<$Res> {
  factory $NetworkCopyWith(Network value, $Res Function(Network) then) =
      _$NetworkCopyWithImpl<$Res>;
}

/// @nodoc
class _$NetworkCopyWithImpl<$Res> extends _$BeError2CopyWithImpl<$Res>
    implements $NetworkCopyWith<$Res> {
  _$NetworkCopyWithImpl(Network _value, $Res Function(Network) _then)
      : super(_value, (v) => _then(v as Network));

  @override
  Network get _value => super._value as Network;
}

/// @nodoc

class _$Network with DiagnosticableTreeMixin implements Network {
  const _$Network();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BeError2.network()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'BeError2.network'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Network);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() network,
    required TResult Function(String message) auth,
  }) {
    return network();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? network,
    TResult Function(String message)? auth,
  }) {
    return network?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? network,
    TResult Function(String message)? auth,
    required TResult orElse(),
  }) {
    if (network != null) {
      return network();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Network value) network,
    required TResult Function(Auth value) auth,
  }) {
    return network(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Network value)? network,
    TResult Function(Auth value)? auth,
  }) {
    return network?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Network value)? network,
    TResult Function(Auth value)? auth,
    required TResult orElse(),
  }) {
    if (network != null) {
      return network(this);
    }
    return orElse();
  }
}

abstract class Network implements BeError2 {
  const factory Network() = _$Network;
}

/// @nodoc
abstract class $AuthCopyWith<$Res> {
  factory $AuthCopyWith(Auth value, $Res Function(Auth) then) =
      _$AuthCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class _$AuthCopyWithImpl<$Res> extends _$BeError2CopyWithImpl<$Res>
    implements $AuthCopyWith<$Res> {
  _$AuthCopyWithImpl(Auth _value, $Res Function(Auth) _then)
      : super(_value, (v) => _then(v as Auth));

  @override
  Auth get _value => super._value as Auth;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(Auth(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$Auth with DiagnosticableTreeMixin implements Auth {
  const _$Auth(this.message);

  @override
  final String message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BeError2.auth(message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BeError2.auth'))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Auth &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(message);

  @JsonKey(ignore: true)
  @override
  $AuthCopyWith<Auth> get copyWith =>
      _$AuthCopyWithImpl<Auth>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() network,
    required TResult Function(String message) auth,
  }) {
    return auth(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? network,
    TResult Function(String message)? auth,
  }) {
    return auth?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? network,
    TResult Function(String message)? auth,
    required TResult orElse(),
  }) {
    if (auth != null) {
      return auth(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Network value) network,
    required TResult Function(Auth value) auth,
  }) {
    return auth(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Network value)? network,
    TResult Function(Auth value)? auth,
  }) {
    return auth?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Network value)? network,
    TResult Function(Auth value)? auth,
    required TResult orElse(),
  }) {
    if (auth != null) {
      return auth(this);
    }
    return orElse();
  }
}

abstract class Auth implements BeError2 {
  const factory Auth(String message) = _$Auth;

  String get message => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthCopyWith<Auth> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
class _$ErrorResultTearOff {
  const _$ErrorResultTearOff();

  _ErrorResult call() {
    return const _ErrorResult();
  }

  _ErrorResultErr error(BeError2 err) {
    return _ErrorResultErr(
      err,
    );
  }
}

/// @nodoc
const $ErrorResult = _$ErrorResultTearOff();

/// @nodoc
mixin _$ErrorResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function() $default, {
    required TResult Function(BeError2 err) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function(BeError2 err)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function(BeError2 err)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ErrorResult value) $default, {
    required TResult Function(_ErrorResultErr value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_ErrorResult value)? $default, {
    TResult Function(_ErrorResultErr value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ErrorResult value)? $default, {
    TResult Function(_ErrorResultErr value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ErrorResultCopyWith<$Res> {
  factory $ErrorResultCopyWith(
          ErrorResult value, $Res Function(ErrorResult) then) =
      _$ErrorResultCopyWithImpl<$Res>;
}

/// @nodoc
class _$ErrorResultCopyWithImpl<$Res> implements $ErrorResultCopyWith<$Res> {
  _$ErrorResultCopyWithImpl(this._value, this._then);

  final ErrorResult _value;
  // ignore: unused_field
  final $Res Function(ErrorResult) _then;
}

/// @nodoc
abstract class _$ErrorResultCopyWith<$Res> {
  factory _$ErrorResultCopyWith(
          _ErrorResult value, $Res Function(_ErrorResult) then) =
      __$ErrorResultCopyWithImpl<$Res>;
}

/// @nodoc
class __$ErrorResultCopyWithImpl<$Res> extends _$ErrorResultCopyWithImpl<$Res>
    implements _$ErrorResultCopyWith<$Res> {
  __$ErrorResultCopyWithImpl(
      _ErrorResult _value, $Res Function(_ErrorResult) _then)
      : super(_value, (v) => _then(v as _ErrorResult));

  @override
  _ErrorResult get _value => super._value as _ErrorResult;
}

/// @nodoc

class _$_ErrorResult with DiagnosticableTreeMixin implements _ErrorResult {
  const _$_ErrorResult();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ErrorResult()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'ErrorResult'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _ErrorResult);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function() $default, {
    required TResult Function(BeError2 err) error,
  }) {
    return $default();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function(BeError2 err)? error,
  }) {
    return $default?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function(BeError2 err)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ErrorResult value) $default, {
    required TResult Function(_ErrorResultErr value) error,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_ErrorResult value)? $default, {
    TResult Function(_ErrorResultErr value)? error,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ErrorResult value)? $default, {
    TResult Function(_ErrorResultErr value)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _ErrorResult implements ErrorResult {
  const factory _ErrorResult() = _$_ErrorResult;
}

/// @nodoc
abstract class _$ErrorResultErrCopyWith<$Res> {
  factory _$ErrorResultErrCopyWith(
          _ErrorResultErr value, $Res Function(_ErrorResultErr) then) =
      __$ErrorResultErrCopyWithImpl<$Res>;
  $Res call({BeError2 err});

  $BeError2CopyWith<$Res> get err;
}

/// @nodoc
class __$ErrorResultErrCopyWithImpl<$Res>
    extends _$ErrorResultCopyWithImpl<$Res>
    implements _$ErrorResultErrCopyWith<$Res> {
  __$ErrorResultErrCopyWithImpl(
      _ErrorResultErr _value, $Res Function(_ErrorResultErr) _then)
      : super(_value, (v) => _then(v as _ErrorResultErr));

  @override
  _ErrorResultErr get _value => super._value as _ErrorResultErr;

  @override
  $Res call({
    Object? err = freezed,
  }) {
    return _then(_ErrorResultErr(
      err == freezed
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as BeError2,
    ));
  }

  @override
  $BeError2CopyWith<$Res> get err {
    return $BeError2CopyWith<$Res>(_value.err, (value) {
      return _then(_value.copyWith(err: value));
    });
  }
}

/// @nodoc

class _$_ErrorResultErr
    with DiagnosticableTreeMixin
    implements _ErrorResultErr {
  const _$_ErrorResultErr(this.err);

  @override
  final BeError2 err;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ErrorResult.error(err: $err)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ErrorResult.error'))
      ..add(DiagnosticsProperty('err', err));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ErrorResultErr &&
            (identical(other.err, err) ||
                const DeepCollectionEquality().equals(other.err, err)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(err);

  @JsonKey(ignore: true)
  @override
  _$ErrorResultErrCopyWith<_ErrorResultErr> get copyWith =>
      __$ErrorResultErrCopyWithImpl<_ErrorResultErr>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function() $default, {
    required TResult Function(BeError2 err) error,
  }) {
    return error(err);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function(BeError2 err)? error,
  }) {
    return error?.call(err);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function(BeError2 err)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(err);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ErrorResult value) $default, {
    required TResult Function(_ErrorResultErr value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_ErrorResult value)? $default, {
    TResult Function(_ErrorResultErr value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ErrorResult value)? $default, {
    TResult Function(_ErrorResultErr value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _ErrorResultErr implements ErrorResult {
  const factory _ErrorResultErr(BeError2 err) = _$_ErrorResultErr;

  BeError2 get err => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$ErrorResultErrCopyWith<_ErrorResultErr> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$UserInfoResultTearOff {
  const _$UserInfoResultTearOff();

  _UserInfo call(UserInfo info) {
    return _UserInfo(
      info,
    );
  }

  _UserInfoErr error(BeError2 err) {
    return _UserInfoErr(
      err,
    );
  }
}

/// @nodoc
const $UserInfoResult = _$UserInfoResultTearOff();

/// @nodoc
mixin _$UserInfoResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(UserInfo info) $default, {
    required TResult Function(BeError2 err) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(UserInfo info)? $default, {
    TResult Function(BeError2 err)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(UserInfo info)? $default, {
    TResult Function(BeError2 err)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_UserInfo value) $default, {
    required TResult Function(_UserInfoErr value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_UserInfo value)? $default, {
    TResult Function(_UserInfoErr value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_UserInfo value)? $default, {
    TResult Function(_UserInfoErr value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserInfoResultCopyWith<$Res> {
  factory $UserInfoResultCopyWith(
          UserInfoResult value, $Res Function(UserInfoResult) then) =
      _$UserInfoResultCopyWithImpl<$Res>;
}

/// @nodoc
class _$UserInfoResultCopyWithImpl<$Res>
    implements $UserInfoResultCopyWith<$Res> {
  _$UserInfoResultCopyWithImpl(this._value, this._then);

  final UserInfoResult _value;
  // ignore: unused_field
  final $Res Function(UserInfoResult) _then;
}

/// @nodoc
abstract class _$UserInfoCopyWith<$Res> {
  factory _$UserInfoCopyWith(_UserInfo value, $Res Function(_UserInfo) then) =
      __$UserInfoCopyWithImpl<$Res>;
  $Res call({UserInfo info});
}

/// @nodoc
class __$UserInfoCopyWithImpl<$Res> extends _$UserInfoResultCopyWithImpl<$Res>
    implements _$UserInfoCopyWith<$Res> {
  __$UserInfoCopyWithImpl(_UserInfo _value, $Res Function(_UserInfo) _then)
      : super(_value, (v) => _then(v as _UserInfo));

  @override
  _UserInfo get _value => super._value as _UserInfo;

  @override
  $Res call({
    Object? info = freezed,
  }) {
    return _then(_UserInfo(
      info == freezed
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as UserInfo,
    ));
  }
}

/// @nodoc

class _$_UserInfo with DiagnosticableTreeMixin implements _UserInfo {
  const _$_UserInfo(this.info);

  @override
  final UserInfo info;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserInfoResult(info: $info)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserInfoResult'))
      ..add(DiagnosticsProperty('info', info));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UserInfo &&
            (identical(other.info, info) ||
                const DeepCollectionEquality().equals(other.info, info)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(info);

  @JsonKey(ignore: true)
  @override
  _$UserInfoCopyWith<_UserInfo> get copyWith =>
      __$UserInfoCopyWithImpl<_UserInfo>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(UserInfo info) $default, {
    required TResult Function(BeError2 err) error,
  }) {
    return $default(info);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(UserInfo info)? $default, {
    TResult Function(BeError2 err)? error,
  }) {
    return $default?.call(info);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(UserInfo info)? $default, {
    TResult Function(BeError2 err)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(info);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_UserInfo value) $default, {
    required TResult Function(_UserInfoErr value) error,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_UserInfo value)? $default, {
    TResult Function(_UserInfoErr value)? error,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_UserInfo value)? $default, {
    TResult Function(_UserInfoErr value)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _UserInfo implements UserInfoResult {
  const factory _UserInfo(UserInfo info) = _$_UserInfo;

  UserInfo get info => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$UserInfoCopyWith<_UserInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$UserInfoErrCopyWith<$Res> {
  factory _$UserInfoErrCopyWith(
          _UserInfoErr value, $Res Function(_UserInfoErr) then) =
      __$UserInfoErrCopyWithImpl<$Res>;
  $Res call({BeError2 err});

  $BeError2CopyWith<$Res> get err;
}

/// @nodoc
class __$UserInfoErrCopyWithImpl<$Res>
    extends _$UserInfoResultCopyWithImpl<$Res>
    implements _$UserInfoErrCopyWith<$Res> {
  __$UserInfoErrCopyWithImpl(
      _UserInfoErr _value, $Res Function(_UserInfoErr) _then)
      : super(_value, (v) => _then(v as _UserInfoErr));

  @override
  _UserInfoErr get _value => super._value as _UserInfoErr;

  @override
  $Res call({
    Object? err = freezed,
  }) {
    return _then(_UserInfoErr(
      err == freezed
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as BeError2,
    ));
  }

  @override
  $BeError2CopyWith<$Res> get err {
    return $BeError2CopyWith<$Res>(_value.err, (value) {
      return _then(_value.copyWith(err: value));
    });
  }
}

/// @nodoc

class _$_UserInfoErr with DiagnosticableTreeMixin implements _UserInfoErr {
  const _$_UserInfoErr(this.err);

  @override
  final BeError2 err;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserInfoResult.error(err: $err)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserInfoResult.error'))
      ..add(DiagnosticsProperty('err', err));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UserInfoErr &&
            (identical(other.err, err) ||
                const DeepCollectionEquality().equals(other.err, err)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(err);

  @JsonKey(ignore: true)
  @override
  _$UserInfoErrCopyWith<_UserInfoErr> get copyWith =>
      __$UserInfoErrCopyWithImpl<_UserInfoErr>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(UserInfo info) $default, {
    required TResult Function(BeError2 err) error,
  }) {
    return error(err);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(UserInfo info)? $default, {
    TResult Function(BeError2 err)? error,
  }) {
    return error?.call(err);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(UserInfo info)? $default, {
    TResult Function(BeError2 err)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(err);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_UserInfo value) $default, {
    required TResult Function(_UserInfoErr value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_UserInfo value)? $default, {
    TResult Function(_UserInfoErr value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_UserInfo value)? $default, {
    TResult Function(_UserInfoErr value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _UserInfoErr implements UserInfoResult {
  const factory _UserInfoErr(BeError2 err) = _$_UserInfoErr;

  BeError2 get err => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$UserInfoErrCopyWith<_UserInfoErr> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$BeTwoFactorEnabledResultTearOff {
  const _$BeTwoFactorEnabledResultTearOff();

  _BeTwoFactorEnabledResult call(bool enabled) {
    return _BeTwoFactorEnabledResult(
      enabled,
    );
  }

  _BeTwoFactorEnabledResultErr error(BeError2 err) {
    return _BeTwoFactorEnabledResultErr(
      err,
    );
  }
}

/// @nodoc
const $BeTwoFactorEnabledResult = _$BeTwoFactorEnabledResultTearOff();

/// @nodoc
mixin _$BeTwoFactorEnabledResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(bool enabled) $default, {
    required TResult Function(BeError2 err) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(bool enabled)? $default, {
    TResult Function(BeError2 err)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(bool enabled)? $default, {
    TResult Function(BeError2 err)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_BeTwoFactorEnabledResult value) $default, {
    required TResult Function(_BeTwoFactorEnabledResultErr value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_BeTwoFactorEnabledResult value)? $default, {
    TResult Function(_BeTwoFactorEnabledResultErr value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BeTwoFactorEnabledResult value)? $default, {
    TResult Function(_BeTwoFactorEnabledResultErr value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BeTwoFactorEnabledResultCopyWith<$Res> {
  factory $BeTwoFactorEnabledResultCopyWith(BeTwoFactorEnabledResult value,
          $Res Function(BeTwoFactorEnabledResult) then) =
      _$BeTwoFactorEnabledResultCopyWithImpl<$Res>;
}

/// @nodoc
class _$BeTwoFactorEnabledResultCopyWithImpl<$Res>
    implements $BeTwoFactorEnabledResultCopyWith<$Res> {
  _$BeTwoFactorEnabledResultCopyWithImpl(this._value, this._then);

  final BeTwoFactorEnabledResult _value;
  // ignore: unused_field
  final $Res Function(BeTwoFactorEnabledResult) _then;
}

/// @nodoc
abstract class _$BeTwoFactorEnabledResultCopyWith<$Res> {
  factory _$BeTwoFactorEnabledResultCopyWith(_BeTwoFactorEnabledResult value,
          $Res Function(_BeTwoFactorEnabledResult) then) =
      __$BeTwoFactorEnabledResultCopyWithImpl<$Res>;
  $Res call({bool enabled});
}

/// @nodoc
class __$BeTwoFactorEnabledResultCopyWithImpl<$Res>
    extends _$BeTwoFactorEnabledResultCopyWithImpl<$Res>
    implements _$BeTwoFactorEnabledResultCopyWith<$Res> {
  __$BeTwoFactorEnabledResultCopyWithImpl(_BeTwoFactorEnabledResult _value,
      $Res Function(_BeTwoFactorEnabledResult) _then)
      : super(_value, (v) => _then(v as _BeTwoFactorEnabledResult));

  @override
  _BeTwoFactorEnabledResult get _value =>
      super._value as _BeTwoFactorEnabledResult;

  @override
  $Res call({
    Object? enabled = freezed,
  }) {
    return _then(_BeTwoFactorEnabledResult(
      enabled == freezed
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_BeTwoFactorEnabledResult
    with DiagnosticableTreeMixin
    implements _BeTwoFactorEnabledResult {
  const _$_BeTwoFactorEnabledResult(this.enabled);

  @override
  final bool enabled;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BeTwoFactorEnabledResult(enabled: $enabled)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BeTwoFactorEnabledResult'))
      ..add(DiagnosticsProperty('enabled', enabled));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BeTwoFactorEnabledResult &&
            (identical(other.enabled, enabled) ||
                const DeepCollectionEquality().equals(other.enabled, enabled)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(enabled);

  @JsonKey(ignore: true)
  @override
  _$BeTwoFactorEnabledResultCopyWith<_BeTwoFactorEnabledResult> get copyWith =>
      __$BeTwoFactorEnabledResultCopyWithImpl<_BeTwoFactorEnabledResult>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(bool enabled) $default, {
    required TResult Function(BeError2 err) error,
  }) {
    return $default(enabled);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(bool enabled)? $default, {
    TResult Function(BeError2 err)? error,
  }) {
    return $default?.call(enabled);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(bool enabled)? $default, {
    TResult Function(BeError2 err)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(enabled);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_BeTwoFactorEnabledResult value) $default, {
    required TResult Function(_BeTwoFactorEnabledResultErr value) error,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_BeTwoFactorEnabledResult value)? $default, {
    TResult Function(_BeTwoFactorEnabledResultErr value)? error,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BeTwoFactorEnabledResult value)? $default, {
    TResult Function(_BeTwoFactorEnabledResultErr value)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _BeTwoFactorEnabledResult implements BeTwoFactorEnabledResult {
  const factory _BeTwoFactorEnabledResult(bool enabled) =
      _$_BeTwoFactorEnabledResult;

  bool get enabled => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$BeTwoFactorEnabledResultCopyWith<_BeTwoFactorEnabledResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$BeTwoFactorEnabledResultErrCopyWith<$Res> {
  factory _$BeTwoFactorEnabledResultErrCopyWith(
          _BeTwoFactorEnabledResultErr value,
          $Res Function(_BeTwoFactorEnabledResultErr) then) =
      __$BeTwoFactorEnabledResultErrCopyWithImpl<$Res>;
  $Res call({BeError2 err});

  $BeError2CopyWith<$Res> get err;
}

/// @nodoc
class __$BeTwoFactorEnabledResultErrCopyWithImpl<$Res>
    extends _$BeTwoFactorEnabledResultCopyWithImpl<$Res>
    implements _$BeTwoFactorEnabledResultErrCopyWith<$Res> {
  __$BeTwoFactorEnabledResultErrCopyWithImpl(
      _BeTwoFactorEnabledResultErr _value,
      $Res Function(_BeTwoFactorEnabledResultErr) _then)
      : super(_value, (v) => _then(v as _BeTwoFactorEnabledResultErr));

  @override
  _BeTwoFactorEnabledResultErr get _value =>
      super._value as _BeTwoFactorEnabledResultErr;

  @override
  $Res call({
    Object? err = freezed,
  }) {
    return _then(_BeTwoFactorEnabledResultErr(
      err == freezed
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as BeError2,
    ));
  }

  @override
  $BeError2CopyWith<$Res> get err {
    return $BeError2CopyWith<$Res>(_value.err, (value) {
      return _then(_value.copyWith(err: value));
    });
  }
}

/// @nodoc

class _$_BeTwoFactorEnabledResultErr
    with DiagnosticableTreeMixin
    implements _BeTwoFactorEnabledResultErr {
  const _$_BeTwoFactorEnabledResultErr(this.err);

  @override
  final BeError2 err;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BeTwoFactorEnabledResult.error(err: $err)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BeTwoFactorEnabledResult.error'))
      ..add(DiagnosticsProperty('err', err));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BeTwoFactorEnabledResultErr &&
            (identical(other.err, err) ||
                const DeepCollectionEquality().equals(other.err, err)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(err);

  @JsonKey(ignore: true)
  @override
  _$BeTwoFactorEnabledResultErrCopyWith<_BeTwoFactorEnabledResultErr>
      get copyWith => __$BeTwoFactorEnabledResultErrCopyWithImpl<
          _BeTwoFactorEnabledResultErr>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(bool enabled) $default, {
    required TResult Function(BeError2 err) error,
  }) {
    return error(err);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(bool enabled)? $default, {
    TResult Function(BeError2 err)? error,
  }) {
    return error?.call(err);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(bool enabled)? $default, {
    TResult Function(BeError2 err)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(err);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_BeTwoFactorEnabledResult value) $default, {
    required TResult Function(_BeTwoFactorEnabledResultErr value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_BeTwoFactorEnabledResult value)? $default, {
    TResult Function(_BeTwoFactorEnabledResultErr value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BeTwoFactorEnabledResult value)? $default, {
    TResult Function(_BeTwoFactorEnabledResultErr value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _BeTwoFactorEnabledResultErr
    implements BeTwoFactorEnabledResult {
  const factory _BeTwoFactorEnabledResultErr(BeError2 err) =
      _$_BeTwoFactorEnabledResultErr;

  BeError2 get err => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$BeTwoFactorEnabledResultErrCopyWith<_BeTwoFactorEnabledResultErr>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
class _$BeApiKeyResultTearOff {
  const _$BeApiKeyResultTearOff();

  _BeApiKeyResult call(BeApiKey apikey) {
    return _BeApiKeyResult(
      apikey,
    );
  }

  _BeApiKeyResultErr error(BeError2 err) {
    return _BeApiKeyResultErr(
      err,
    );
  }
}

/// @nodoc
const $BeApiKeyResult = _$BeApiKeyResultTearOff();

/// @nodoc
mixin _$BeApiKeyResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(BeApiKey apikey) $default, {
    required TResult Function(BeError2 err) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(BeApiKey apikey)? $default, {
    TResult Function(BeError2 err)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(BeApiKey apikey)? $default, {
    TResult Function(BeError2 err)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_BeApiKeyResult value) $default, {
    required TResult Function(_BeApiKeyResultErr value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_BeApiKeyResult value)? $default, {
    TResult Function(_BeApiKeyResultErr value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BeApiKeyResult value)? $default, {
    TResult Function(_BeApiKeyResultErr value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BeApiKeyResultCopyWith<$Res> {
  factory $BeApiKeyResultCopyWith(
          BeApiKeyResult value, $Res Function(BeApiKeyResult) then) =
      _$BeApiKeyResultCopyWithImpl<$Res>;
}

/// @nodoc
class _$BeApiKeyResultCopyWithImpl<$Res>
    implements $BeApiKeyResultCopyWith<$Res> {
  _$BeApiKeyResultCopyWithImpl(this._value, this._then);

  final BeApiKeyResult _value;
  // ignore: unused_field
  final $Res Function(BeApiKeyResult) _then;
}

/// @nodoc
abstract class _$BeApiKeyResultCopyWith<$Res> {
  factory _$BeApiKeyResultCopyWith(
          _BeApiKeyResult value, $Res Function(_BeApiKeyResult) then) =
      __$BeApiKeyResultCopyWithImpl<$Res>;
  $Res call({BeApiKey apikey});
}

/// @nodoc
class __$BeApiKeyResultCopyWithImpl<$Res>
    extends _$BeApiKeyResultCopyWithImpl<$Res>
    implements _$BeApiKeyResultCopyWith<$Res> {
  __$BeApiKeyResultCopyWithImpl(
      _BeApiKeyResult _value, $Res Function(_BeApiKeyResult) _then)
      : super(_value, (v) => _then(v as _BeApiKeyResult));

  @override
  _BeApiKeyResult get _value => super._value as _BeApiKeyResult;

  @override
  $Res call({
    Object? apikey = freezed,
  }) {
    return _then(_BeApiKeyResult(
      apikey == freezed
          ? _value.apikey
          : apikey // ignore: cast_nullable_to_non_nullable
              as BeApiKey,
    ));
  }
}

/// @nodoc

class _$_BeApiKeyResult
    with DiagnosticableTreeMixin
    implements _BeApiKeyResult {
  const _$_BeApiKeyResult(this.apikey);

  @override
  final BeApiKey apikey;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BeApiKeyResult(apikey: $apikey)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BeApiKeyResult'))
      ..add(DiagnosticsProperty('apikey', apikey));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BeApiKeyResult &&
            (identical(other.apikey, apikey) ||
                const DeepCollectionEquality().equals(other.apikey, apikey)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(apikey);

  @JsonKey(ignore: true)
  @override
  _$BeApiKeyResultCopyWith<_BeApiKeyResult> get copyWith =>
      __$BeApiKeyResultCopyWithImpl<_BeApiKeyResult>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(BeApiKey apikey) $default, {
    required TResult Function(BeError2 err) error,
  }) {
    return $default(apikey);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(BeApiKey apikey)? $default, {
    TResult Function(BeError2 err)? error,
  }) {
    return $default?.call(apikey);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(BeApiKey apikey)? $default, {
    TResult Function(BeError2 err)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(apikey);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_BeApiKeyResult value) $default, {
    required TResult Function(_BeApiKeyResultErr value) error,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_BeApiKeyResult value)? $default, {
    TResult Function(_BeApiKeyResultErr value)? error,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BeApiKeyResult value)? $default, {
    TResult Function(_BeApiKeyResultErr value)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _BeApiKeyResult implements BeApiKeyResult {
  const factory _BeApiKeyResult(BeApiKey apikey) = _$_BeApiKeyResult;

  BeApiKey get apikey => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$BeApiKeyResultCopyWith<_BeApiKeyResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$BeApiKeyResultErrCopyWith<$Res> {
  factory _$BeApiKeyResultErrCopyWith(
          _BeApiKeyResultErr value, $Res Function(_BeApiKeyResultErr) then) =
      __$BeApiKeyResultErrCopyWithImpl<$Res>;
  $Res call({BeError2 err});

  $BeError2CopyWith<$Res> get err;
}

/// @nodoc
class __$BeApiKeyResultErrCopyWithImpl<$Res>
    extends _$BeApiKeyResultCopyWithImpl<$Res>
    implements _$BeApiKeyResultErrCopyWith<$Res> {
  __$BeApiKeyResultErrCopyWithImpl(
      _BeApiKeyResultErr _value, $Res Function(_BeApiKeyResultErr) _then)
      : super(_value, (v) => _then(v as _BeApiKeyResultErr));

  @override
  _BeApiKeyResultErr get _value => super._value as _BeApiKeyResultErr;

  @override
  $Res call({
    Object? err = freezed,
  }) {
    return _then(_BeApiKeyResultErr(
      err == freezed
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as BeError2,
    ));
  }

  @override
  $BeError2CopyWith<$Res> get err {
    return $BeError2CopyWith<$Res>(_value.err, (value) {
      return _then(_value.copyWith(err: value));
    });
  }
}

/// @nodoc

class _$_BeApiKeyResultErr
    with DiagnosticableTreeMixin
    implements _BeApiKeyResultErr {
  const _$_BeApiKeyResultErr(this.err);

  @override
  final BeError2 err;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BeApiKeyResult.error(err: $err)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BeApiKeyResult.error'))
      ..add(DiagnosticsProperty('err', err));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BeApiKeyResultErr &&
            (identical(other.err, err) ||
                const DeepCollectionEquality().equals(other.err, err)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(err);

  @JsonKey(ignore: true)
  @override
  _$BeApiKeyResultErrCopyWith<_BeApiKeyResultErr> get copyWith =>
      __$BeApiKeyResultErrCopyWithImpl<_BeApiKeyResultErr>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(BeApiKey apikey) $default, {
    required TResult Function(BeError2 err) error,
  }) {
    return error(err);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(BeApiKey apikey)? $default, {
    TResult Function(BeError2 err)? error,
  }) {
    return error?.call(err);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(BeApiKey apikey)? $default, {
    TResult Function(BeError2 err)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(err);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_BeApiKeyResult value) $default, {
    required TResult Function(_BeApiKeyResultErr value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_BeApiKeyResult value)? $default, {
    TResult Function(_BeApiKeyResultErr value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BeApiKeyResult value)? $default, {
    TResult Function(_BeApiKeyResultErr value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _BeApiKeyResultErr implements BeApiKeyResult {
  const factory _BeApiKeyResultErr(BeError2 err) = _$_BeApiKeyResultErr;

  BeError2 get err => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$BeApiKeyResultErrCopyWith<_BeApiKeyResultErr> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$BeApiKeyRequestResultTearOff {
  const _$BeApiKeyRequestResultTearOff();

  _BeApiKeyRequestResult call(String token) {
    return _BeApiKeyRequestResult(
      token,
    );
  }

  _BeApiKeyRequestResulttErr error(BeError2 err) {
    return _BeApiKeyRequestResulttErr(
      err,
    );
  }
}

/// @nodoc
const $BeApiKeyRequestResult = _$BeApiKeyRequestResultTearOff();

/// @nodoc
mixin _$BeApiKeyRequestResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String token) $default, {
    required TResult Function(BeError2 err) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(String token)? $default, {
    TResult Function(BeError2 err)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String token)? $default, {
    TResult Function(BeError2 err)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_BeApiKeyRequestResult value) $default, {
    required TResult Function(_BeApiKeyRequestResulttErr value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_BeApiKeyRequestResult value)? $default, {
    TResult Function(_BeApiKeyRequestResulttErr value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BeApiKeyRequestResult value)? $default, {
    TResult Function(_BeApiKeyRequestResulttErr value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BeApiKeyRequestResultCopyWith<$Res> {
  factory $BeApiKeyRequestResultCopyWith(BeApiKeyRequestResult value,
          $Res Function(BeApiKeyRequestResult) then) =
      _$BeApiKeyRequestResultCopyWithImpl<$Res>;
}

/// @nodoc
class _$BeApiKeyRequestResultCopyWithImpl<$Res>
    implements $BeApiKeyRequestResultCopyWith<$Res> {
  _$BeApiKeyRequestResultCopyWithImpl(this._value, this._then);

  final BeApiKeyRequestResult _value;
  // ignore: unused_field
  final $Res Function(BeApiKeyRequestResult) _then;
}

/// @nodoc
abstract class _$BeApiKeyRequestResultCopyWith<$Res> {
  factory _$BeApiKeyRequestResultCopyWith(_BeApiKeyRequestResult value,
          $Res Function(_BeApiKeyRequestResult) then) =
      __$BeApiKeyRequestResultCopyWithImpl<$Res>;
  $Res call({String token});
}

/// @nodoc
class __$BeApiKeyRequestResultCopyWithImpl<$Res>
    extends _$BeApiKeyRequestResultCopyWithImpl<$Res>
    implements _$BeApiKeyRequestResultCopyWith<$Res> {
  __$BeApiKeyRequestResultCopyWithImpl(_BeApiKeyRequestResult _value,
      $Res Function(_BeApiKeyRequestResult) _then)
      : super(_value, (v) => _then(v as _BeApiKeyRequestResult));

  @override
  _BeApiKeyRequestResult get _value => super._value as _BeApiKeyRequestResult;

  @override
  $Res call({
    Object? token = freezed,
  }) {
    return _then(_BeApiKeyRequestResult(
      token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_BeApiKeyRequestResult
    with DiagnosticableTreeMixin
    implements _BeApiKeyRequestResult {
  const _$_BeApiKeyRequestResult(this.token);

  @override
  final String token;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BeApiKeyRequestResult(token: $token)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BeApiKeyRequestResult'))
      ..add(DiagnosticsProperty('token', token));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BeApiKeyRequestResult &&
            (identical(other.token, token) ||
                const DeepCollectionEquality().equals(other.token, token)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(token);

  @JsonKey(ignore: true)
  @override
  _$BeApiKeyRequestResultCopyWith<_BeApiKeyRequestResult> get copyWith =>
      __$BeApiKeyRequestResultCopyWithImpl<_BeApiKeyRequestResult>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String token) $default, {
    required TResult Function(BeError2 err) error,
  }) {
    return $default(token);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(String token)? $default, {
    TResult Function(BeError2 err)? error,
  }) {
    return $default?.call(token);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String token)? $default, {
    TResult Function(BeError2 err)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(token);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_BeApiKeyRequestResult value) $default, {
    required TResult Function(_BeApiKeyRequestResulttErr value) error,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_BeApiKeyRequestResult value)? $default, {
    TResult Function(_BeApiKeyRequestResulttErr value)? error,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BeApiKeyRequestResult value)? $default, {
    TResult Function(_BeApiKeyRequestResulttErr value)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _BeApiKeyRequestResult implements BeApiKeyRequestResult {
  const factory _BeApiKeyRequestResult(String token) = _$_BeApiKeyRequestResult;

  String get token => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$BeApiKeyRequestResultCopyWith<_BeApiKeyRequestResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$BeApiKeyRequestResulttErrCopyWith<$Res> {
  factory _$BeApiKeyRequestResulttErrCopyWith(_BeApiKeyRequestResulttErr value,
          $Res Function(_BeApiKeyRequestResulttErr) then) =
      __$BeApiKeyRequestResulttErrCopyWithImpl<$Res>;
  $Res call({BeError2 err});

  $BeError2CopyWith<$Res> get err;
}

/// @nodoc
class __$BeApiKeyRequestResulttErrCopyWithImpl<$Res>
    extends _$BeApiKeyRequestResultCopyWithImpl<$Res>
    implements _$BeApiKeyRequestResulttErrCopyWith<$Res> {
  __$BeApiKeyRequestResulttErrCopyWithImpl(_BeApiKeyRequestResulttErr _value,
      $Res Function(_BeApiKeyRequestResulttErr) _then)
      : super(_value, (v) => _then(v as _BeApiKeyRequestResulttErr));

  @override
  _BeApiKeyRequestResulttErr get _value =>
      super._value as _BeApiKeyRequestResulttErr;

  @override
  $Res call({
    Object? err = freezed,
  }) {
    return _then(_BeApiKeyRequestResulttErr(
      err == freezed
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as BeError2,
    ));
  }

  @override
  $BeError2CopyWith<$Res> get err {
    return $BeError2CopyWith<$Res>(_value.err, (value) {
      return _then(_value.copyWith(err: value));
    });
  }
}

/// @nodoc

class _$_BeApiKeyRequestResulttErr
    with DiagnosticableTreeMixin
    implements _BeApiKeyRequestResulttErr {
  const _$_BeApiKeyRequestResulttErr(this.err);

  @override
  final BeError2 err;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BeApiKeyRequestResult.error(err: $err)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BeApiKeyRequestResult.error'))
      ..add(DiagnosticsProperty('err', err));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BeApiKeyRequestResulttErr &&
            (identical(other.err, err) ||
                const DeepCollectionEquality().equals(other.err, err)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(err);

  @JsonKey(ignore: true)
  @override
  _$BeApiKeyRequestResulttErrCopyWith<_BeApiKeyRequestResulttErr>
      get copyWith =>
          __$BeApiKeyRequestResulttErrCopyWithImpl<_BeApiKeyRequestResulttErr>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String token) $default, {
    required TResult Function(BeError2 err) error,
  }) {
    return error(err);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(String token)? $default, {
    TResult Function(BeError2 err)? error,
  }) {
    return error?.call(err);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String token)? $default, {
    TResult Function(BeError2 err)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(err);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_BeApiKeyRequestResult value) $default, {
    required TResult Function(_BeApiKeyRequestResulttErr value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_BeApiKeyRequestResult value)? $default, {
    TResult Function(_BeApiKeyRequestResulttErr value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BeApiKeyRequestResult value)? $default, {
    TResult Function(_BeApiKeyRequestResulttErr value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _BeApiKeyRequestResulttErr implements BeApiKeyRequestResult {
  const factory _BeApiKeyRequestResulttErr(BeError2 err) =
      _$_BeApiKeyRequestResulttErr;

  BeError2 get err => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$BeApiKeyRequestResulttErrCopyWith<_BeApiKeyRequestResulttErr>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
class _$BeKycRequestCreateResultTearOff {
  const _$BeKycRequestCreateResultTearOff();

  _BeKycRequestCreateResult call(String kycUrl) {
    return _BeKycRequestCreateResult(
      kycUrl,
    );
  }

  _BeKycRequestCreateResultErr error(BeError2 err) {
    return _BeKycRequestCreateResultErr(
      err,
    );
  }
}

/// @nodoc
const $BeKycRequestCreateResult = _$BeKycRequestCreateResultTearOff();

/// @nodoc
mixin _$BeKycRequestCreateResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String kycUrl) $default, {
    required TResult Function(BeError2 err) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(String kycUrl)? $default, {
    TResult Function(BeError2 err)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String kycUrl)? $default, {
    TResult Function(BeError2 err)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_BeKycRequestCreateResult value) $default, {
    required TResult Function(_BeKycRequestCreateResultErr value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_BeKycRequestCreateResult value)? $default, {
    TResult Function(_BeKycRequestCreateResultErr value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BeKycRequestCreateResult value)? $default, {
    TResult Function(_BeKycRequestCreateResultErr value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BeKycRequestCreateResultCopyWith<$Res> {
  factory $BeKycRequestCreateResultCopyWith(BeKycRequestCreateResult value,
          $Res Function(BeKycRequestCreateResult) then) =
      _$BeKycRequestCreateResultCopyWithImpl<$Res>;
}

/// @nodoc
class _$BeKycRequestCreateResultCopyWithImpl<$Res>
    implements $BeKycRequestCreateResultCopyWith<$Res> {
  _$BeKycRequestCreateResultCopyWithImpl(this._value, this._then);

  final BeKycRequestCreateResult _value;
  // ignore: unused_field
  final $Res Function(BeKycRequestCreateResult) _then;
}

/// @nodoc
abstract class _$BeKycRequestCreateResultCopyWith<$Res> {
  factory _$BeKycRequestCreateResultCopyWith(_BeKycRequestCreateResult value,
          $Res Function(_BeKycRequestCreateResult) then) =
      __$BeKycRequestCreateResultCopyWithImpl<$Res>;
  $Res call({String kycUrl});
}

/// @nodoc
class __$BeKycRequestCreateResultCopyWithImpl<$Res>
    extends _$BeKycRequestCreateResultCopyWithImpl<$Res>
    implements _$BeKycRequestCreateResultCopyWith<$Res> {
  __$BeKycRequestCreateResultCopyWithImpl(_BeKycRequestCreateResult _value,
      $Res Function(_BeKycRequestCreateResult) _then)
      : super(_value, (v) => _then(v as _BeKycRequestCreateResult));

  @override
  _BeKycRequestCreateResult get _value =>
      super._value as _BeKycRequestCreateResult;

  @override
  $Res call({
    Object? kycUrl = freezed,
  }) {
    return _then(_BeKycRequestCreateResult(
      kycUrl == freezed
          ? _value.kycUrl
          : kycUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_BeKycRequestCreateResult
    with DiagnosticableTreeMixin
    implements _BeKycRequestCreateResult {
  const _$_BeKycRequestCreateResult(this.kycUrl);

  @override
  final String kycUrl;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BeKycRequestCreateResult(kycUrl: $kycUrl)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BeKycRequestCreateResult'))
      ..add(DiagnosticsProperty('kycUrl', kycUrl));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BeKycRequestCreateResult &&
            (identical(other.kycUrl, kycUrl) ||
                const DeepCollectionEquality().equals(other.kycUrl, kycUrl)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(kycUrl);

  @JsonKey(ignore: true)
  @override
  _$BeKycRequestCreateResultCopyWith<_BeKycRequestCreateResult> get copyWith =>
      __$BeKycRequestCreateResultCopyWithImpl<_BeKycRequestCreateResult>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String kycUrl) $default, {
    required TResult Function(BeError2 err) error,
  }) {
    return $default(kycUrl);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(String kycUrl)? $default, {
    TResult Function(BeError2 err)? error,
  }) {
    return $default?.call(kycUrl);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String kycUrl)? $default, {
    TResult Function(BeError2 err)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(kycUrl);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_BeKycRequestCreateResult value) $default, {
    required TResult Function(_BeKycRequestCreateResultErr value) error,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_BeKycRequestCreateResult value)? $default, {
    TResult Function(_BeKycRequestCreateResultErr value)? error,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BeKycRequestCreateResult value)? $default, {
    TResult Function(_BeKycRequestCreateResultErr value)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _BeKycRequestCreateResult implements BeKycRequestCreateResult {
  const factory _BeKycRequestCreateResult(String kycUrl) =
      _$_BeKycRequestCreateResult;

  String get kycUrl => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$BeKycRequestCreateResultCopyWith<_BeKycRequestCreateResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$BeKycRequestCreateResultErrCopyWith<$Res> {
  factory _$BeKycRequestCreateResultErrCopyWith(
          _BeKycRequestCreateResultErr value,
          $Res Function(_BeKycRequestCreateResultErr) then) =
      __$BeKycRequestCreateResultErrCopyWithImpl<$Res>;
  $Res call({BeError2 err});

  $BeError2CopyWith<$Res> get err;
}

/// @nodoc
class __$BeKycRequestCreateResultErrCopyWithImpl<$Res>
    extends _$BeKycRequestCreateResultCopyWithImpl<$Res>
    implements _$BeKycRequestCreateResultErrCopyWith<$Res> {
  __$BeKycRequestCreateResultErrCopyWithImpl(
      _BeKycRequestCreateResultErr _value,
      $Res Function(_BeKycRequestCreateResultErr) _then)
      : super(_value, (v) => _then(v as _BeKycRequestCreateResultErr));

  @override
  _BeKycRequestCreateResultErr get _value =>
      super._value as _BeKycRequestCreateResultErr;

  @override
  $Res call({
    Object? err = freezed,
  }) {
    return _then(_BeKycRequestCreateResultErr(
      err == freezed
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as BeError2,
    ));
  }

  @override
  $BeError2CopyWith<$Res> get err {
    return $BeError2CopyWith<$Res>(_value.err, (value) {
      return _then(_value.copyWith(err: value));
    });
  }
}

/// @nodoc

class _$_BeKycRequestCreateResultErr
    with DiagnosticableTreeMixin
    implements _BeKycRequestCreateResultErr {
  const _$_BeKycRequestCreateResultErr(this.err);

  @override
  final BeError2 err;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BeKycRequestCreateResult.error(err: $err)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BeKycRequestCreateResult.error'))
      ..add(DiagnosticsProperty('err', err));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BeKycRequestCreateResultErr &&
            (identical(other.err, err) ||
                const DeepCollectionEquality().equals(other.err, err)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(err);

  @JsonKey(ignore: true)
  @override
  _$BeKycRequestCreateResultErrCopyWith<_BeKycRequestCreateResultErr>
      get copyWith => __$BeKycRequestCreateResultErrCopyWithImpl<
          _BeKycRequestCreateResultErr>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String kycUrl) $default, {
    required TResult Function(BeError2 err) error,
  }) {
    return error(err);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(String kycUrl)? $default, {
    TResult Function(BeError2 err)? error,
  }) {
    return error?.call(err);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String kycUrl)? $default, {
    TResult Function(BeError2 err)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(err);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_BeKycRequestCreateResult value) $default, {
    required TResult Function(_BeKycRequestCreateResultErr value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_BeKycRequestCreateResult value)? $default, {
    TResult Function(_BeKycRequestCreateResultErr value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BeKycRequestCreateResult value)? $default, {
    TResult Function(_BeKycRequestCreateResultErr value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _BeKycRequestCreateResultErr
    implements BeKycRequestCreateResult {
  const factory _BeKycRequestCreateResultErr(BeError2 err) =
      _$_BeKycRequestCreateResultErr;

  BeError2 get err => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$BeKycRequestCreateResultErrCopyWith<_BeKycRequestCreateResultErr>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
class _$BeTwoFactorResultTearOff {
  const _$BeTwoFactorResultTearOff();

  _BeTwoFactorResult call(BeTwoFactor twoFactor) {
    return _BeTwoFactorResult(
      twoFactor,
    );
  }

  _BeTwoFactorResultErr error(BeError2 err) {
    return _BeTwoFactorResultErr(
      err,
    );
  }
}

/// @nodoc
const $BeTwoFactorResult = _$BeTwoFactorResultTearOff();

/// @nodoc
mixin _$BeTwoFactorResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(BeTwoFactor twoFactor) $default, {
    required TResult Function(BeError2 err) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(BeTwoFactor twoFactor)? $default, {
    TResult Function(BeError2 err)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(BeTwoFactor twoFactor)? $default, {
    TResult Function(BeError2 err)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_BeTwoFactorResult value) $default, {
    required TResult Function(_BeTwoFactorResultErr value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_BeTwoFactorResult value)? $default, {
    TResult Function(_BeTwoFactorResultErr value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BeTwoFactorResult value)? $default, {
    TResult Function(_BeTwoFactorResultErr value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BeTwoFactorResultCopyWith<$Res> {
  factory $BeTwoFactorResultCopyWith(
          BeTwoFactorResult value, $Res Function(BeTwoFactorResult) then) =
      _$BeTwoFactorResultCopyWithImpl<$Res>;
}

/// @nodoc
class _$BeTwoFactorResultCopyWithImpl<$Res>
    implements $BeTwoFactorResultCopyWith<$Res> {
  _$BeTwoFactorResultCopyWithImpl(this._value, this._then);

  final BeTwoFactorResult _value;
  // ignore: unused_field
  final $Res Function(BeTwoFactorResult) _then;
}

/// @nodoc
abstract class _$BeTwoFactorResultCopyWith<$Res> {
  factory _$BeTwoFactorResultCopyWith(
          _BeTwoFactorResult value, $Res Function(_BeTwoFactorResult) then) =
      __$BeTwoFactorResultCopyWithImpl<$Res>;
  $Res call({BeTwoFactor twoFactor});
}

/// @nodoc
class __$BeTwoFactorResultCopyWithImpl<$Res>
    extends _$BeTwoFactorResultCopyWithImpl<$Res>
    implements _$BeTwoFactorResultCopyWith<$Res> {
  __$BeTwoFactorResultCopyWithImpl(
      _BeTwoFactorResult _value, $Res Function(_BeTwoFactorResult) _then)
      : super(_value, (v) => _then(v as _BeTwoFactorResult));

  @override
  _BeTwoFactorResult get _value => super._value as _BeTwoFactorResult;

  @override
  $Res call({
    Object? twoFactor = freezed,
  }) {
    return _then(_BeTwoFactorResult(
      twoFactor == freezed
          ? _value.twoFactor
          : twoFactor // ignore: cast_nullable_to_non_nullable
              as BeTwoFactor,
    ));
  }
}

/// @nodoc

class _$_BeTwoFactorResult
    with DiagnosticableTreeMixin
    implements _BeTwoFactorResult {
  const _$_BeTwoFactorResult(this.twoFactor);

  @override
  final BeTwoFactor twoFactor;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BeTwoFactorResult(twoFactor: $twoFactor)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BeTwoFactorResult'))
      ..add(DiagnosticsProperty('twoFactor', twoFactor));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BeTwoFactorResult &&
            (identical(other.twoFactor, twoFactor) ||
                const DeepCollectionEquality()
                    .equals(other.twoFactor, twoFactor)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(twoFactor);

  @JsonKey(ignore: true)
  @override
  _$BeTwoFactorResultCopyWith<_BeTwoFactorResult> get copyWith =>
      __$BeTwoFactorResultCopyWithImpl<_BeTwoFactorResult>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(BeTwoFactor twoFactor) $default, {
    required TResult Function(BeError2 err) error,
  }) {
    return $default(twoFactor);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(BeTwoFactor twoFactor)? $default, {
    TResult Function(BeError2 err)? error,
  }) {
    return $default?.call(twoFactor);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(BeTwoFactor twoFactor)? $default, {
    TResult Function(BeError2 err)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(twoFactor);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_BeTwoFactorResult value) $default, {
    required TResult Function(_BeTwoFactorResultErr value) error,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_BeTwoFactorResult value)? $default, {
    TResult Function(_BeTwoFactorResultErr value)? error,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BeTwoFactorResult value)? $default, {
    TResult Function(_BeTwoFactorResultErr value)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _BeTwoFactorResult implements BeTwoFactorResult {
  const factory _BeTwoFactorResult(BeTwoFactor twoFactor) =
      _$_BeTwoFactorResult;

  BeTwoFactor get twoFactor => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$BeTwoFactorResultCopyWith<_BeTwoFactorResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$BeTwoFactorResultErrCopyWith<$Res> {
  factory _$BeTwoFactorResultErrCopyWith(_BeTwoFactorResultErr value,
          $Res Function(_BeTwoFactorResultErr) then) =
      __$BeTwoFactorResultErrCopyWithImpl<$Res>;
  $Res call({BeError2 err});

  $BeError2CopyWith<$Res> get err;
}

/// @nodoc
class __$BeTwoFactorResultErrCopyWithImpl<$Res>
    extends _$BeTwoFactorResultCopyWithImpl<$Res>
    implements _$BeTwoFactorResultErrCopyWith<$Res> {
  __$BeTwoFactorResultErrCopyWithImpl(
      _BeTwoFactorResultErr _value, $Res Function(_BeTwoFactorResultErr) _then)
      : super(_value, (v) => _then(v as _BeTwoFactorResultErr));

  @override
  _BeTwoFactorResultErr get _value => super._value as _BeTwoFactorResultErr;

  @override
  $Res call({
    Object? err = freezed,
  }) {
    return _then(_BeTwoFactorResultErr(
      err == freezed
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as BeError2,
    ));
  }

  @override
  $BeError2CopyWith<$Res> get err {
    return $BeError2CopyWith<$Res>(_value.err, (value) {
      return _then(_value.copyWith(err: value));
    });
  }
}

/// @nodoc

class _$_BeTwoFactorResultErr
    with DiagnosticableTreeMixin
    implements _BeTwoFactorResultErr {
  const _$_BeTwoFactorResultErr(this.err);

  @override
  final BeError2 err;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BeTwoFactorResult.error(err: $err)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BeTwoFactorResult.error'))
      ..add(DiagnosticsProperty('err', err));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BeTwoFactorResultErr &&
            (identical(other.err, err) ||
                const DeepCollectionEquality().equals(other.err, err)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(err);

  @JsonKey(ignore: true)
  @override
  _$BeTwoFactorResultErrCopyWith<_BeTwoFactorResultErr> get copyWith =>
      __$BeTwoFactorResultErrCopyWithImpl<_BeTwoFactorResultErr>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(BeTwoFactor twoFactor) $default, {
    required TResult Function(BeError2 err) error,
  }) {
    return error(err);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(BeTwoFactor twoFactor)? $default, {
    TResult Function(BeError2 err)? error,
  }) {
    return error?.call(err);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(BeTwoFactor twoFactor)? $default, {
    TResult Function(BeError2 err)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(err);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_BeTwoFactorResult value) $default, {
    required TResult Function(_BeTwoFactorResultErr value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_BeTwoFactorResult value)? $default, {
    TResult Function(_BeTwoFactorResultErr value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BeTwoFactorResult value)? $default, {
    TResult Function(_BeTwoFactorResultErr value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _BeTwoFactorResultErr implements BeTwoFactorResult {
  const factory _BeTwoFactorResultErr(BeError2 err) = _$_BeTwoFactorResultErr;

  BeError2 get err => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$BeTwoFactorResultErrCopyWith<_BeTwoFactorResultErr> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$BeAssetResultTearOff {
  const _$BeAssetResultTearOff();

  _BeAssetResult call(List<BeAsset> assets) {
    return _BeAssetResult(
      assets,
    );
  }

  _BeAssetResultErr error(BeError2 err) {
    return _BeAssetResultErr(
      err,
    );
  }
}

/// @nodoc
const $BeAssetResult = _$BeAssetResultTearOff();

/// @nodoc
mixin _$BeAssetResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<BeAsset> assets) $default, {
    required TResult Function(BeError2 err) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(List<BeAsset> assets)? $default, {
    TResult Function(BeError2 err)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<BeAsset> assets)? $default, {
    TResult Function(BeError2 err)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_BeAssetResult value) $default, {
    required TResult Function(_BeAssetResultErr value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_BeAssetResult value)? $default, {
    TResult Function(_BeAssetResultErr value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BeAssetResult value)? $default, {
    TResult Function(_BeAssetResultErr value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BeAssetResultCopyWith<$Res> {
  factory $BeAssetResultCopyWith(
          BeAssetResult value, $Res Function(BeAssetResult) then) =
      _$BeAssetResultCopyWithImpl<$Res>;
}

/// @nodoc
class _$BeAssetResultCopyWithImpl<$Res>
    implements $BeAssetResultCopyWith<$Res> {
  _$BeAssetResultCopyWithImpl(this._value, this._then);

  final BeAssetResult _value;
  // ignore: unused_field
  final $Res Function(BeAssetResult) _then;
}

/// @nodoc
abstract class _$BeAssetResultCopyWith<$Res> {
  factory _$BeAssetResultCopyWith(
          _BeAssetResult value, $Res Function(_BeAssetResult) then) =
      __$BeAssetResultCopyWithImpl<$Res>;
  $Res call({List<BeAsset> assets});
}

/// @nodoc
class __$BeAssetResultCopyWithImpl<$Res>
    extends _$BeAssetResultCopyWithImpl<$Res>
    implements _$BeAssetResultCopyWith<$Res> {
  __$BeAssetResultCopyWithImpl(
      _BeAssetResult _value, $Res Function(_BeAssetResult) _then)
      : super(_value, (v) => _then(v as _BeAssetResult));

  @override
  _BeAssetResult get _value => super._value as _BeAssetResult;

  @override
  $Res call({
    Object? assets = freezed,
  }) {
    return _then(_BeAssetResult(
      assets == freezed
          ? _value.assets
          : assets // ignore: cast_nullable_to_non_nullable
              as List<BeAsset>,
    ));
  }
}

/// @nodoc

class _$_BeAssetResult with DiagnosticableTreeMixin implements _BeAssetResult {
  const _$_BeAssetResult(this.assets);

  @override
  final List<BeAsset> assets;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BeAssetResult(assets: $assets)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BeAssetResult'))
      ..add(DiagnosticsProperty('assets', assets));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BeAssetResult &&
            (identical(other.assets, assets) ||
                const DeepCollectionEquality().equals(other.assets, assets)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(assets);

  @JsonKey(ignore: true)
  @override
  _$BeAssetResultCopyWith<_BeAssetResult> get copyWith =>
      __$BeAssetResultCopyWithImpl<_BeAssetResult>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<BeAsset> assets) $default, {
    required TResult Function(BeError2 err) error,
  }) {
    return $default(assets);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(List<BeAsset> assets)? $default, {
    TResult Function(BeError2 err)? error,
  }) {
    return $default?.call(assets);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<BeAsset> assets)? $default, {
    TResult Function(BeError2 err)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(assets);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_BeAssetResult value) $default, {
    required TResult Function(_BeAssetResultErr value) error,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_BeAssetResult value)? $default, {
    TResult Function(_BeAssetResultErr value)? error,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BeAssetResult value)? $default, {
    TResult Function(_BeAssetResultErr value)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _BeAssetResult implements BeAssetResult {
  const factory _BeAssetResult(List<BeAsset> assets) = _$_BeAssetResult;

  List<BeAsset> get assets => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$BeAssetResultCopyWith<_BeAssetResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$BeAssetResultErrCopyWith<$Res> {
  factory _$BeAssetResultErrCopyWith(
          _BeAssetResultErr value, $Res Function(_BeAssetResultErr) then) =
      __$BeAssetResultErrCopyWithImpl<$Res>;
  $Res call({BeError2 err});

  $BeError2CopyWith<$Res> get err;
}

/// @nodoc
class __$BeAssetResultErrCopyWithImpl<$Res>
    extends _$BeAssetResultCopyWithImpl<$Res>
    implements _$BeAssetResultErrCopyWith<$Res> {
  __$BeAssetResultErrCopyWithImpl(
      _BeAssetResultErr _value, $Res Function(_BeAssetResultErr) _then)
      : super(_value, (v) => _then(v as _BeAssetResultErr));

  @override
  _BeAssetResultErr get _value => super._value as _BeAssetResultErr;

  @override
  $Res call({
    Object? err = freezed,
  }) {
    return _then(_BeAssetResultErr(
      err == freezed
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as BeError2,
    ));
  }

  @override
  $BeError2CopyWith<$Res> get err {
    return $BeError2CopyWith<$Res>(_value.err, (value) {
      return _then(_value.copyWith(err: value));
    });
  }
}

/// @nodoc

class _$_BeAssetResultErr
    with DiagnosticableTreeMixin
    implements _BeAssetResultErr {
  const _$_BeAssetResultErr(this.err);

  @override
  final BeError2 err;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BeAssetResult.error(err: $err)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BeAssetResult.error'))
      ..add(DiagnosticsProperty('err', err));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BeAssetResultErr &&
            (identical(other.err, err) ||
                const DeepCollectionEquality().equals(other.err, err)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(err);

  @JsonKey(ignore: true)
  @override
  _$BeAssetResultErrCopyWith<_BeAssetResultErr> get copyWith =>
      __$BeAssetResultErrCopyWithImpl<_BeAssetResultErr>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<BeAsset> assets) $default, {
    required TResult Function(BeError2 err) error,
  }) {
    return error(err);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(List<BeAsset> assets)? $default, {
    TResult Function(BeError2 err)? error,
  }) {
    return error?.call(err);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<BeAsset> assets)? $default, {
    TResult Function(BeError2 err)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(err);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_BeAssetResult value) $default, {
    required TResult Function(_BeAssetResultErr value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_BeAssetResult value)? $default, {
    TResult Function(_BeAssetResultErr value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BeAssetResult value)? $default, {
    TResult Function(_BeAssetResultErr value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _BeAssetResultErr implements BeAssetResult {
  const factory _BeAssetResultErr(BeError2 err) = _$_BeAssetResultErr;

  BeError2 get err => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$BeAssetResultErrCopyWith<_BeAssetResultErr> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$BeMarketResultTearOff {
  const _$BeMarketResultTearOff();

  _BeMarketResult call(List<BeMarket> markets) {
    return _BeMarketResult(
      markets,
    );
  }

  _BeMarketResultErr error(BeError2 err) {
    return _BeMarketResultErr(
      err,
    );
  }
}

/// @nodoc
const $BeMarketResult = _$BeMarketResultTearOff();

/// @nodoc
mixin _$BeMarketResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<BeMarket> markets) $default, {
    required TResult Function(BeError2 err) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(List<BeMarket> markets)? $default, {
    TResult Function(BeError2 err)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<BeMarket> markets)? $default, {
    TResult Function(BeError2 err)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_BeMarketResult value) $default, {
    required TResult Function(_BeMarketResultErr value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_BeMarketResult value)? $default, {
    TResult Function(_BeMarketResultErr value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BeMarketResult value)? $default, {
    TResult Function(_BeMarketResultErr value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BeMarketResultCopyWith<$Res> {
  factory $BeMarketResultCopyWith(
          BeMarketResult value, $Res Function(BeMarketResult) then) =
      _$BeMarketResultCopyWithImpl<$Res>;
}

/// @nodoc
class _$BeMarketResultCopyWithImpl<$Res>
    implements $BeMarketResultCopyWith<$Res> {
  _$BeMarketResultCopyWithImpl(this._value, this._then);

  final BeMarketResult _value;
  // ignore: unused_field
  final $Res Function(BeMarketResult) _then;
}

/// @nodoc
abstract class _$BeMarketResultCopyWith<$Res> {
  factory _$BeMarketResultCopyWith(
          _BeMarketResult value, $Res Function(_BeMarketResult) then) =
      __$BeMarketResultCopyWithImpl<$Res>;
  $Res call({List<BeMarket> markets});
}

/// @nodoc
class __$BeMarketResultCopyWithImpl<$Res>
    extends _$BeMarketResultCopyWithImpl<$Res>
    implements _$BeMarketResultCopyWith<$Res> {
  __$BeMarketResultCopyWithImpl(
      _BeMarketResult _value, $Res Function(_BeMarketResult) _then)
      : super(_value, (v) => _then(v as _BeMarketResult));

  @override
  _BeMarketResult get _value => super._value as _BeMarketResult;

  @override
  $Res call({
    Object? markets = freezed,
  }) {
    return _then(_BeMarketResult(
      markets == freezed
          ? _value.markets
          : markets // ignore: cast_nullable_to_non_nullable
              as List<BeMarket>,
    ));
  }
}

/// @nodoc

class _$_BeMarketResult
    with DiagnosticableTreeMixin
    implements _BeMarketResult {
  const _$_BeMarketResult(this.markets);

  @override
  final List<BeMarket> markets;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BeMarketResult(markets: $markets)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BeMarketResult'))
      ..add(DiagnosticsProperty('markets', markets));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BeMarketResult &&
            (identical(other.markets, markets) ||
                const DeepCollectionEquality().equals(other.markets, markets)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(markets);

  @JsonKey(ignore: true)
  @override
  _$BeMarketResultCopyWith<_BeMarketResult> get copyWith =>
      __$BeMarketResultCopyWithImpl<_BeMarketResult>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<BeMarket> markets) $default, {
    required TResult Function(BeError2 err) error,
  }) {
    return $default(markets);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(List<BeMarket> markets)? $default, {
    TResult Function(BeError2 err)? error,
  }) {
    return $default?.call(markets);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<BeMarket> markets)? $default, {
    TResult Function(BeError2 err)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(markets);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_BeMarketResult value) $default, {
    required TResult Function(_BeMarketResultErr value) error,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_BeMarketResult value)? $default, {
    TResult Function(_BeMarketResultErr value)? error,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BeMarketResult value)? $default, {
    TResult Function(_BeMarketResultErr value)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _BeMarketResult implements BeMarketResult {
  const factory _BeMarketResult(List<BeMarket> markets) = _$_BeMarketResult;

  List<BeMarket> get markets => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$BeMarketResultCopyWith<_BeMarketResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$BeMarketResultErrCopyWith<$Res> {
  factory _$BeMarketResultErrCopyWith(
          _BeMarketResultErr value, $Res Function(_BeMarketResultErr) then) =
      __$BeMarketResultErrCopyWithImpl<$Res>;
  $Res call({BeError2 err});

  $BeError2CopyWith<$Res> get err;
}

/// @nodoc
class __$BeMarketResultErrCopyWithImpl<$Res>
    extends _$BeMarketResultCopyWithImpl<$Res>
    implements _$BeMarketResultErrCopyWith<$Res> {
  __$BeMarketResultErrCopyWithImpl(
      _BeMarketResultErr _value, $Res Function(_BeMarketResultErr) _then)
      : super(_value, (v) => _then(v as _BeMarketResultErr));

  @override
  _BeMarketResultErr get _value => super._value as _BeMarketResultErr;

  @override
  $Res call({
    Object? err = freezed,
  }) {
    return _then(_BeMarketResultErr(
      err == freezed
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as BeError2,
    ));
  }

  @override
  $BeError2CopyWith<$Res> get err {
    return $BeError2CopyWith<$Res>(_value.err, (value) {
      return _then(_value.copyWith(err: value));
    });
  }
}

/// @nodoc

class _$_BeMarketResultErr
    with DiagnosticableTreeMixin
    implements _BeMarketResultErr {
  const _$_BeMarketResultErr(this.err);

  @override
  final BeError2 err;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BeMarketResult.error(err: $err)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BeMarketResult.error'))
      ..add(DiagnosticsProperty('err', err));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BeMarketResultErr &&
            (identical(other.err, err) ||
                const DeepCollectionEquality().equals(other.err, err)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(err);

  @JsonKey(ignore: true)
  @override
  _$BeMarketResultErrCopyWith<_BeMarketResultErr> get copyWith =>
      __$BeMarketResultErrCopyWithImpl<_BeMarketResultErr>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<BeMarket> markets) $default, {
    required TResult Function(BeError2 err) error,
  }) {
    return error(err);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(List<BeMarket> markets)? $default, {
    TResult Function(BeError2 err)? error,
  }) {
    return error?.call(err);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<BeMarket> markets)? $default, {
    TResult Function(BeError2 err)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(err);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_BeMarketResult value) $default, {
    required TResult Function(_BeMarketResultErr value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_BeMarketResult value)? $default, {
    TResult Function(_BeMarketResultErr value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BeMarketResult value)? $default, {
    TResult Function(_BeMarketResultErr value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _BeMarketResultErr implements BeMarketResult {
  const factory _BeMarketResultErr(BeError2 err) = _$_BeMarketResultErr;

  BeError2 get err => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$BeMarketResultErrCopyWith<_BeMarketResultErr> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$BeOrderbookResultTearOff {
  const _$BeOrderbookResultTearOff();

  _BeOrderbookResult call(BeOrderbook orderbook) {
    return _BeOrderbookResult(
      orderbook,
    );
  }

  _BeOrderbookResultErr error(BeError2 err) {
    return _BeOrderbookResultErr(
      err,
    );
  }
}

/// @nodoc
const $BeOrderbookResult = _$BeOrderbookResultTearOff();

/// @nodoc
mixin _$BeOrderbookResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(BeOrderbook orderbook) $default, {
    required TResult Function(BeError2 err) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(BeOrderbook orderbook)? $default, {
    TResult Function(BeError2 err)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(BeOrderbook orderbook)? $default, {
    TResult Function(BeError2 err)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_BeOrderbookResult value) $default, {
    required TResult Function(_BeOrderbookResultErr value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_BeOrderbookResult value)? $default, {
    TResult Function(_BeOrderbookResultErr value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BeOrderbookResult value)? $default, {
    TResult Function(_BeOrderbookResultErr value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BeOrderbookResultCopyWith<$Res> {
  factory $BeOrderbookResultCopyWith(
          BeOrderbookResult value, $Res Function(BeOrderbookResult) then) =
      _$BeOrderbookResultCopyWithImpl<$Res>;
}

/// @nodoc
class _$BeOrderbookResultCopyWithImpl<$Res>
    implements $BeOrderbookResultCopyWith<$Res> {
  _$BeOrderbookResultCopyWithImpl(this._value, this._then);

  final BeOrderbookResult _value;
  // ignore: unused_field
  final $Res Function(BeOrderbookResult) _then;
}

/// @nodoc
abstract class _$BeOrderbookResultCopyWith<$Res> {
  factory _$BeOrderbookResultCopyWith(
          _BeOrderbookResult value, $Res Function(_BeOrderbookResult) then) =
      __$BeOrderbookResultCopyWithImpl<$Res>;
  $Res call({BeOrderbook orderbook});
}

/// @nodoc
class __$BeOrderbookResultCopyWithImpl<$Res>
    extends _$BeOrderbookResultCopyWithImpl<$Res>
    implements _$BeOrderbookResultCopyWith<$Res> {
  __$BeOrderbookResultCopyWithImpl(
      _BeOrderbookResult _value, $Res Function(_BeOrderbookResult) _then)
      : super(_value, (v) => _then(v as _BeOrderbookResult));

  @override
  _BeOrderbookResult get _value => super._value as _BeOrderbookResult;

  @override
  $Res call({
    Object? orderbook = freezed,
  }) {
    return _then(_BeOrderbookResult(
      orderbook == freezed
          ? _value.orderbook
          : orderbook // ignore: cast_nullable_to_non_nullable
              as BeOrderbook,
    ));
  }
}

/// @nodoc

class _$_BeOrderbookResult
    with DiagnosticableTreeMixin
    implements _BeOrderbookResult {
  const _$_BeOrderbookResult(this.orderbook);

  @override
  final BeOrderbook orderbook;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BeOrderbookResult(orderbook: $orderbook)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BeOrderbookResult'))
      ..add(DiagnosticsProperty('orderbook', orderbook));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BeOrderbookResult &&
            (identical(other.orderbook, orderbook) ||
                const DeepCollectionEquality()
                    .equals(other.orderbook, orderbook)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(orderbook);

  @JsonKey(ignore: true)
  @override
  _$BeOrderbookResultCopyWith<_BeOrderbookResult> get copyWith =>
      __$BeOrderbookResultCopyWithImpl<_BeOrderbookResult>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(BeOrderbook orderbook) $default, {
    required TResult Function(BeError2 err) error,
  }) {
    return $default(orderbook);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(BeOrderbook orderbook)? $default, {
    TResult Function(BeError2 err)? error,
  }) {
    return $default?.call(orderbook);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(BeOrderbook orderbook)? $default, {
    TResult Function(BeError2 err)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(orderbook);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_BeOrderbookResult value) $default, {
    required TResult Function(_BeOrderbookResultErr value) error,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_BeOrderbookResult value)? $default, {
    TResult Function(_BeOrderbookResultErr value)? error,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BeOrderbookResult value)? $default, {
    TResult Function(_BeOrderbookResultErr value)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _BeOrderbookResult implements BeOrderbookResult {
  const factory _BeOrderbookResult(BeOrderbook orderbook) =
      _$_BeOrderbookResult;

  BeOrderbook get orderbook => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$BeOrderbookResultCopyWith<_BeOrderbookResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$BeOrderbookResultErrCopyWith<$Res> {
  factory _$BeOrderbookResultErrCopyWith(_BeOrderbookResultErr value,
          $Res Function(_BeOrderbookResultErr) then) =
      __$BeOrderbookResultErrCopyWithImpl<$Res>;
  $Res call({BeError2 err});

  $BeError2CopyWith<$Res> get err;
}

/// @nodoc
class __$BeOrderbookResultErrCopyWithImpl<$Res>
    extends _$BeOrderbookResultCopyWithImpl<$Res>
    implements _$BeOrderbookResultErrCopyWith<$Res> {
  __$BeOrderbookResultErrCopyWithImpl(
      _BeOrderbookResultErr _value, $Res Function(_BeOrderbookResultErr) _then)
      : super(_value, (v) => _then(v as _BeOrderbookResultErr));

  @override
  _BeOrderbookResultErr get _value => super._value as _BeOrderbookResultErr;

  @override
  $Res call({
    Object? err = freezed,
  }) {
    return _then(_BeOrderbookResultErr(
      err == freezed
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as BeError2,
    ));
  }

  @override
  $BeError2CopyWith<$Res> get err {
    return $BeError2CopyWith<$Res>(_value.err, (value) {
      return _then(_value.copyWith(err: value));
    });
  }
}

/// @nodoc

class _$_BeOrderbookResultErr
    with DiagnosticableTreeMixin
    implements _BeOrderbookResultErr {
  const _$_BeOrderbookResultErr(this.err);

  @override
  final BeError2 err;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BeOrderbookResult.error(err: $err)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BeOrderbookResult.error'))
      ..add(DiagnosticsProperty('err', err));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BeOrderbookResultErr &&
            (identical(other.err, err) ||
                const DeepCollectionEquality().equals(other.err, err)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(err);

  @JsonKey(ignore: true)
  @override
  _$BeOrderbookResultErrCopyWith<_BeOrderbookResultErr> get copyWith =>
      __$BeOrderbookResultErrCopyWithImpl<_BeOrderbookResultErr>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(BeOrderbook orderbook) $default, {
    required TResult Function(BeError2 err) error,
  }) {
    return error(err);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(BeOrderbook orderbook)? $default, {
    TResult Function(BeError2 err)? error,
  }) {
    return error?.call(err);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(BeOrderbook orderbook)? $default, {
    TResult Function(BeError2 err)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(err);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_BeOrderbookResult value) $default, {
    required TResult Function(_BeOrderbookResultErr value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_BeOrderbookResult value)? $default, {
    TResult Function(_BeOrderbookResultErr value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BeOrderbookResult value)? $default, {
    TResult Function(_BeOrderbookResultErr value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _BeOrderbookResultErr implements BeOrderbookResult {
  const factory _BeOrderbookResultErr(BeError2 err) = _$_BeOrderbookResultErr;

  BeError2 get err => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$BeOrderbookResultErrCopyWith<_BeOrderbookResultErr> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$BeBalancesResultTearOff {
  const _$BeBalancesResultTearOff();

  _BeBalancesResult call(List<BeBalance> balances) {
    return _BeBalancesResult(
      balances,
    );
  }

  _BeBalancesResultErr error(BeError2 err) {
    return _BeBalancesResultErr(
      err,
    );
  }
}

/// @nodoc
const $BeBalancesResult = _$BeBalancesResultTearOff();

/// @nodoc
mixin _$BeBalancesResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<BeBalance> balances) $default, {
    required TResult Function(BeError2 err) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(List<BeBalance> balances)? $default, {
    TResult Function(BeError2 err)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<BeBalance> balances)? $default, {
    TResult Function(BeError2 err)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_BeBalancesResult value) $default, {
    required TResult Function(_BeBalancesResultErr value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_BeBalancesResult value)? $default, {
    TResult Function(_BeBalancesResultErr value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BeBalancesResult value)? $default, {
    TResult Function(_BeBalancesResultErr value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BeBalancesResultCopyWith<$Res> {
  factory $BeBalancesResultCopyWith(
          BeBalancesResult value, $Res Function(BeBalancesResult) then) =
      _$BeBalancesResultCopyWithImpl<$Res>;
}

/// @nodoc
class _$BeBalancesResultCopyWithImpl<$Res>
    implements $BeBalancesResultCopyWith<$Res> {
  _$BeBalancesResultCopyWithImpl(this._value, this._then);

  final BeBalancesResult _value;
  // ignore: unused_field
  final $Res Function(BeBalancesResult) _then;
}

/// @nodoc
abstract class _$BeBalancesResultCopyWith<$Res> {
  factory _$BeBalancesResultCopyWith(
          _BeBalancesResult value, $Res Function(_BeBalancesResult) then) =
      __$BeBalancesResultCopyWithImpl<$Res>;
  $Res call({List<BeBalance> balances});
}

/// @nodoc
class __$BeBalancesResultCopyWithImpl<$Res>
    extends _$BeBalancesResultCopyWithImpl<$Res>
    implements _$BeBalancesResultCopyWith<$Res> {
  __$BeBalancesResultCopyWithImpl(
      _BeBalancesResult _value, $Res Function(_BeBalancesResult) _then)
      : super(_value, (v) => _then(v as _BeBalancesResult));

  @override
  _BeBalancesResult get _value => super._value as _BeBalancesResult;

  @override
  $Res call({
    Object? balances = freezed,
  }) {
    return _then(_BeBalancesResult(
      balances == freezed
          ? _value.balances
          : balances // ignore: cast_nullable_to_non_nullable
              as List<BeBalance>,
    ));
  }
}

/// @nodoc

class _$_BeBalancesResult
    with DiagnosticableTreeMixin
    implements _BeBalancesResult {
  const _$_BeBalancesResult(this.balances);

  @override
  final List<BeBalance> balances;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BeBalancesResult(balances: $balances)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BeBalancesResult'))
      ..add(DiagnosticsProperty('balances', balances));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BeBalancesResult &&
            (identical(other.balances, balances) ||
                const DeepCollectionEquality()
                    .equals(other.balances, balances)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(balances);

  @JsonKey(ignore: true)
  @override
  _$BeBalancesResultCopyWith<_BeBalancesResult> get copyWith =>
      __$BeBalancesResultCopyWithImpl<_BeBalancesResult>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<BeBalance> balances) $default, {
    required TResult Function(BeError2 err) error,
  }) {
    return $default(balances);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(List<BeBalance> balances)? $default, {
    TResult Function(BeError2 err)? error,
  }) {
    return $default?.call(balances);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<BeBalance> balances)? $default, {
    TResult Function(BeError2 err)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(balances);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_BeBalancesResult value) $default, {
    required TResult Function(_BeBalancesResultErr value) error,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_BeBalancesResult value)? $default, {
    TResult Function(_BeBalancesResultErr value)? error,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BeBalancesResult value)? $default, {
    TResult Function(_BeBalancesResultErr value)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _BeBalancesResult implements BeBalancesResult {
  const factory _BeBalancesResult(List<BeBalance> balances) =
      _$_BeBalancesResult;

  List<BeBalance> get balances => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$BeBalancesResultCopyWith<_BeBalancesResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$BeBalancesResultErrCopyWith<$Res> {
  factory _$BeBalancesResultErrCopyWith(_BeBalancesResultErr value,
          $Res Function(_BeBalancesResultErr) then) =
      __$BeBalancesResultErrCopyWithImpl<$Res>;
  $Res call({BeError2 err});

  $BeError2CopyWith<$Res> get err;
}

/// @nodoc
class __$BeBalancesResultErrCopyWithImpl<$Res>
    extends _$BeBalancesResultCopyWithImpl<$Res>
    implements _$BeBalancesResultErrCopyWith<$Res> {
  __$BeBalancesResultErrCopyWithImpl(
      _BeBalancesResultErr _value, $Res Function(_BeBalancesResultErr) _then)
      : super(_value, (v) => _then(v as _BeBalancesResultErr));

  @override
  _BeBalancesResultErr get _value => super._value as _BeBalancesResultErr;

  @override
  $Res call({
    Object? err = freezed,
  }) {
    return _then(_BeBalancesResultErr(
      err == freezed
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as BeError2,
    ));
  }

  @override
  $BeError2CopyWith<$Res> get err {
    return $BeError2CopyWith<$Res>(_value.err, (value) {
      return _then(_value.copyWith(err: value));
    });
  }
}

/// @nodoc

class _$_BeBalancesResultErr
    with DiagnosticableTreeMixin
    implements _BeBalancesResultErr {
  const _$_BeBalancesResultErr(this.err);

  @override
  final BeError2 err;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BeBalancesResult.error(err: $err)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BeBalancesResult.error'))
      ..add(DiagnosticsProperty('err', err));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BeBalancesResultErr &&
            (identical(other.err, err) ||
                const DeepCollectionEquality().equals(other.err, err)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(err);

  @JsonKey(ignore: true)
  @override
  _$BeBalancesResultErrCopyWith<_BeBalancesResultErr> get copyWith =>
      __$BeBalancesResultErrCopyWithImpl<_BeBalancesResultErr>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<BeBalance> balances) $default, {
    required TResult Function(BeError2 err) error,
  }) {
    return error(err);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(List<BeBalance> balances)? $default, {
    TResult Function(BeError2 err)? error,
  }) {
    return error?.call(err);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<BeBalance> balances)? $default, {
    TResult Function(BeError2 err)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(err);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_BeBalancesResult value) $default, {
    required TResult Function(_BeBalancesResultErr value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_BeBalancesResult value)? $default, {
    TResult Function(_BeBalancesResultErr value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BeBalancesResult value)? $default, {
    TResult Function(_BeBalancesResultErr value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _BeBalancesResultErr implements BeBalancesResult {
  const factory _BeBalancesResultErr(BeError2 err) = _$_BeBalancesResultErr;

  BeError2 get err => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$BeBalancesResultErrCopyWith<_BeBalancesResultErr> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$BeCryptoDepositAddressResultTearOff {
  const _$BeCryptoDepositAddressResultTearOff();

  _BeCryptoDepositAddressResult call(String address) {
    return _BeCryptoDepositAddressResult(
      address,
    );
  }

  _BeCryptoDepositAddressResultErr error(BeError2 err) {
    return _BeCryptoDepositAddressResultErr(
      err,
    );
  }
}

/// @nodoc
const $BeCryptoDepositAddressResult = _$BeCryptoDepositAddressResultTearOff();

/// @nodoc
mixin _$BeCryptoDepositAddressResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String address) $default, {
    required TResult Function(BeError2 err) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(String address)? $default, {
    TResult Function(BeError2 err)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String address)? $default, {
    TResult Function(BeError2 err)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_BeCryptoDepositAddressResult value) $default, {
    required TResult Function(_BeCryptoDepositAddressResultErr value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_BeCryptoDepositAddressResult value)? $default, {
    TResult Function(_BeCryptoDepositAddressResultErr value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BeCryptoDepositAddressResult value)? $default, {
    TResult Function(_BeCryptoDepositAddressResultErr value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BeCryptoDepositAddressResultCopyWith<$Res> {
  factory $BeCryptoDepositAddressResultCopyWith(
          BeCryptoDepositAddressResult value,
          $Res Function(BeCryptoDepositAddressResult) then) =
      _$BeCryptoDepositAddressResultCopyWithImpl<$Res>;
}

/// @nodoc
class _$BeCryptoDepositAddressResultCopyWithImpl<$Res>
    implements $BeCryptoDepositAddressResultCopyWith<$Res> {
  _$BeCryptoDepositAddressResultCopyWithImpl(this._value, this._then);

  final BeCryptoDepositAddressResult _value;
  // ignore: unused_field
  final $Res Function(BeCryptoDepositAddressResult) _then;
}

/// @nodoc
abstract class _$BeCryptoDepositAddressResultCopyWith<$Res> {
  factory _$BeCryptoDepositAddressResultCopyWith(
          _BeCryptoDepositAddressResult value,
          $Res Function(_BeCryptoDepositAddressResult) then) =
      __$BeCryptoDepositAddressResultCopyWithImpl<$Res>;
  $Res call({String address});
}

/// @nodoc
class __$BeCryptoDepositAddressResultCopyWithImpl<$Res>
    extends _$BeCryptoDepositAddressResultCopyWithImpl<$Res>
    implements _$BeCryptoDepositAddressResultCopyWith<$Res> {
  __$BeCryptoDepositAddressResultCopyWithImpl(
      _BeCryptoDepositAddressResult _value,
      $Res Function(_BeCryptoDepositAddressResult) _then)
      : super(_value, (v) => _then(v as _BeCryptoDepositAddressResult));

  @override
  _BeCryptoDepositAddressResult get _value =>
      super._value as _BeCryptoDepositAddressResult;

  @override
  $Res call({
    Object? address = freezed,
  }) {
    return _then(_BeCryptoDepositAddressResult(
      address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_BeCryptoDepositAddressResult
    with DiagnosticableTreeMixin
    implements _BeCryptoDepositAddressResult {
  const _$_BeCryptoDepositAddressResult(this.address);

  @override
  final String address;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BeCryptoDepositAddressResult(address: $address)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BeCryptoDepositAddressResult'))
      ..add(DiagnosticsProperty('address', address));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BeCryptoDepositAddressResult &&
            (identical(other.address, address) ||
                const DeepCollectionEquality().equals(other.address, address)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(address);

  @JsonKey(ignore: true)
  @override
  _$BeCryptoDepositAddressResultCopyWith<_BeCryptoDepositAddressResult>
      get copyWith => __$BeCryptoDepositAddressResultCopyWithImpl<
          _BeCryptoDepositAddressResult>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String address) $default, {
    required TResult Function(BeError2 err) error,
  }) {
    return $default(address);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(String address)? $default, {
    TResult Function(BeError2 err)? error,
  }) {
    return $default?.call(address);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String address)? $default, {
    TResult Function(BeError2 err)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(address);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_BeCryptoDepositAddressResult value) $default, {
    required TResult Function(_BeCryptoDepositAddressResultErr value) error,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_BeCryptoDepositAddressResult value)? $default, {
    TResult Function(_BeCryptoDepositAddressResultErr value)? error,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BeCryptoDepositAddressResult value)? $default, {
    TResult Function(_BeCryptoDepositAddressResultErr value)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _BeCryptoDepositAddressResult
    implements BeCryptoDepositAddressResult {
  const factory _BeCryptoDepositAddressResult(String address) =
      _$_BeCryptoDepositAddressResult;

  String get address => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$BeCryptoDepositAddressResultCopyWith<_BeCryptoDepositAddressResult>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$BeCryptoDepositAddressResultErrCopyWith<$Res> {
  factory _$BeCryptoDepositAddressResultErrCopyWith(
          _BeCryptoDepositAddressResultErr value,
          $Res Function(_BeCryptoDepositAddressResultErr) then) =
      __$BeCryptoDepositAddressResultErrCopyWithImpl<$Res>;
  $Res call({BeError2 err});

  $BeError2CopyWith<$Res> get err;
}

/// @nodoc
class __$BeCryptoDepositAddressResultErrCopyWithImpl<$Res>
    extends _$BeCryptoDepositAddressResultCopyWithImpl<$Res>
    implements _$BeCryptoDepositAddressResultErrCopyWith<$Res> {
  __$BeCryptoDepositAddressResultErrCopyWithImpl(
      _BeCryptoDepositAddressResultErr _value,
      $Res Function(_BeCryptoDepositAddressResultErr) _then)
      : super(_value, (v) => _then(v as _BeCryptoDepositAddressResultErr));

  @override
  _BeCryptoDepositAddressResultErr get _value =>
      super._value as _BeCryptoDepositAddressResultErr;

  @override
  $Res call({
    Object? err = freezed,
  }) {
    return _then(_BeCryptoDepositAddressResultErr(
      err == freezed
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as BeError2,
    ));
  }

  @override
  $BeError2CopyWith<$Res> get err {
    return $BeError2CopyWith<$Res>(_value.err, (value) {
      return _then(_value.copyWith(err: value));
    });
  }
}

/// @nodoc

class _$_BeCryptoDepositAddressResultErr
    with DiagnosticableTreeMixin
    implements _BeCryptoDepositAddressResultErr {
  const _$_BeCryptoDepositAddressResultErr(this.err);

  @override
  final BeError2 err;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BeCryptoDepositAddressResult.error(err: $err)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BeCryptoDepositAddressResult.error'))
      ..add(DiagnosticsProperty('err', err));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BeCryptoDepositAddressResultErr &&
            (identical(other.err, err) ||
                const DeepCollectionEquality().equals(other.err, err)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(err);

  @JsonKey(ignore: true)
  @override
  _$BeCryptoDepositAddressResultErrCopyWith<_BeCryptoDepositAddressResultErr>
      get copyWith => __$BeCryptoDepositAddressResultErrCopyWithImpl<
          _BeCryptoDepositAddressResultErr>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String address) $default, {
    required TResult Function(BeError2 err) error,
  }) {
    return error(err);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(String address)? $default, {
    TResult Function(BeError2 err)? error,
  }) {
    return error?.call(err);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String address)? $default, {
    TResult Function(BeError2 err)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(err);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_BeCryptoDepositAddressResult value) $default, {
    required TResult Function(_BeCryptoDepositAddressResultErr value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_BeCryptoDepositAddressResult value)? $default, {
    TResult Function(_BeCryptoDepositAddressResultErr value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BeCryptoDepositAddressResult value)? $default, {
    TResult Function(_BeCryptoDepositAddressResultErr value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _BeCryptoDepositAddressResultErr
    implements BeCryptoDepositAddressResult {
  const factory _BeCryptoDepositAddressResultErr(BeError2 err) =
      _$_BeCryptoDepositAddressResultErr;

  BeError2 get err => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$BeCryptoDepositAddressResultErrCopyWith<_BeCryptoDepositAddressResultErr>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
class _$BeCryptoDepositsResultTearOff {
  const _$BeCryptoDepositsResultTearOff();

  _BeCryptoDepositsResult call(
      List<BeCryptoDeposit> deposits, int offset, int limit, int total) {
    return _BeCryptoDepositsResult(
      deposits,
      offset,
      limit,
      total,
    );
  }

  _BeCryptoDepositsResultErr error(BeError2 err) {
    return _BeCryptoDepositsResultErr(
      err,
    );
  }
}

/// @nodoc
const $BeCryptoDepositsResult = _$BeCryptoDepositsResultTearOff();

/// @nodoc
mixin _$BeCryptoDepositsResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            List<BeCryptoDeposit> deposits, int offset, int limit, int total)
        $default, {
    required TResult Function(BeError2 err) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(
            List<BeCryptoDeposit> deposits, int offset, int limit, int total)?
        $default, {
    TResult Function(BeError2 err)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            List<BeCryptoDeposit> deposits, int offset, int limit, int total)?
        $default, {
    TResult Function(BeError2 err)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_BeCryptoDepositsResult value) $default, {
    required TResult Function(_BeCryptoDepositsResultErr value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_BeCryptoDepositsResult value)? $default, {
    TResult Function(_BeCryptoDepositsResultErr value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BeCryptoDepositsResult value)? $default, {
    TResult Function(_BeCryptoDepositsResultErr value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BeCryptoDepositsResultCopyWith<$Res> {
  factory $BeCryptoDepositsResultCopyWith(BeCryptoDepositsResult value,
          $Res Function(BeCryptoDepositsResult) then) =
      _$BeCryptoDepositsResultCopyWithImpl<$Res>;
}

/// @nodoc
class _$BeCryptoDepositsResultCopyWithImpl<$Res>
    implements $BeCryptoDepositsResultCopyWith<$Res> {
  _$BeCryptoDepositsResultCopyWithImpl(this._value, this._then);

  final BeCryptoDepositsResult _value;
  // ignore: unused_field
  final $Res Function(BeCryptoDepositsResult) _then;
}

/// @nodoc
abstract class _$BeCryptoDepositsResultCopyWith<$Res> {
  factory _$BeCryptoDepositsResultCopyWith(_BeCryptoDepositsResult value,
          $Res Function(_BeCryptoDepositsResult) then) =
      __$BeCryptoDepositsResultCopyWithImpl<$Res>;
  $Res call({List<BeCryptoDeposit> deposits, int offset, int limit, int total});
}

/// @nodoc
class __$BeCryptoDepositsResultCopyWithImpl<$Res>
    extends _$BeCryptoDepositsResultCopyWithImpl<$Res>
    implements _$BeCryptoDepositsResultCopyWith<$Res> {
  __$BeCryptoDepositsResultCopyWithImpl(_BeCryptoDepositsResult _value,
      $Res Function(_BeCryptoDepositsResult) _then)
      : super(_value, (v) => _then(v as _BeCryptoDepositsResult));

  @override
  _BeCryptoDepositsResult get _value => super._value as _BeCryptoDepositsResult;

  @override
  $Res call({
    Object? deposits = freezed,
    Object? offset = freezed,
    Object? limit = freezed,
    Object? total = freezed,
  }) {
    return _then(_BeCryptoDepositsResult(
      deposits == freezed
          ? _value.deposits
          : deposits // ignore: cast_nullable_to_non_nullable
              as List<BeCryptoDeposit>,
      offset == freezed
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int,
      limit == freezed
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      total == freezed
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_BeCryptoDepositsResult
    with DiagnosticableTreeMixin
    implements _BeCryptoDepositsResult {
  const _$_BeCryptoDepositsResult(
      this.deposits, this.offset, this.limit, this.total);

  @override
  final List<BeCryptoDeposit> deposits;
  @override
  final int offset;
  @override
  final int limit;
  @override
  final int total;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BeCryptoDepositsResult(deposits: $deposits, offset: $offset, limit: $limit, total: $total)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BeCryptoDepositsResult'))
      ..add(DiagnosticsProperty('deposits', deposits))
      ..add(DiagnosticsProperty('offset', offset))
      ..add(DiagnosticsProperty('limit', limit))
      ..add(DiagnosticsProperty('total', total));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BeCryptoDepositsResult &&
            (identical(other.deposits, deposits) ||
                const DeepCollectionEquality()
                    .equals(other.deposits, deposits)) &&
            (identical(other.offset, offset) ||
                const DeepCollectionEquality().equals(other.offset, offset)) &&
            (identical(other.limit, limit) ||
                const DeepCollectionEquality().equals(other.limit, limit)) &&
            (identical(other.total, total) ||
                const DeepCollectionEquality().equals(other.total, total)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(deposits) ^
      const DeepCollectionEquality().hash(offset) ^
      const DeepCollectionEquality().hash(limit) ^
      const DeepCollectionEquality().hash(total);

  @JsonKey(ignore: true)
  @override
  _$BeCryptoDepositsResultCopyWith<_BeCryptoDepositsResult> get copyWith =>
      __$BeCryptoDepositsResultCopyWithImpl<_BeCryptoDepositsResult>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            List<BeCryptoDeposit> deposits, int offset, int limit, int total)
        $default, {
    required TResult Function(BeError2 err) error,
  }) {
    return $default(deposits, offset, limit, total);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(
            List<BeCryptoDeposit> deposits, int offset, int limit, int total)?
        $default, {
    TResult Function(BeError2 err)? error,
  }) {
    return $default?.call(deposits, offset, limit, total);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            List<BeCryptoDeposit> deposits, int offset, int limit, int total)?
        $default, {
    TResult Function(BeError2 err)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(deposits, offset, limit, total);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_BeCryptoDepositsResult value) $default, {
    required TResult Function(_BeCryptoDepositsResultErr value) error,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_BeCryptoDepositsResult value)? $default, {
    TResult Function(_BeCryptoDepositsResultErr value)? error,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BeCryptoDepositsResult value)? $default, {
    TResult Function(_BeCryptoDepositsResultErr value)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _BeCryptoDepositsResult implements BeCryptoDepositsResult {
  const factory _BeCryptoDepositsResult(
          List<BeCryptoDeposit> deposits, int offset, int limit, int total) =
      _$_BeCryptoDepositsResult;

  List<BeCryptoDeposit> get deposits => throw _privateConstructorUsedError;
  int get offset => throw _privateConstructorUsedError;
  int get limit => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$BeCryptoDepositsResultCopyWith<_BeCryptoDepositsResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$BeCryptoDepositsResultErrCopyWith<$Res> {
  factory _$BeCryptoDepositsResultErrCopyWith(_BeCryptoDepositsResultErr value,
          $Res Function(_BeCryptoDepositsResultErr) then) =
      __$BeCryptoDepositsResultErrCopyWithImpl<$Res>;
  $Res call({BeError2 err});

  $BeError2CopyWith<$Res> get err;
}

/// @nodoc
class __$BeCryptoDepositsResultErrCopyWithImpl<$Res>
    extends _$BeCryptoDepositsResultCopyWithImpl<$Res>
    implements _$BeCryptoDepositsResultErrCopyWith<$Res> {
  __$BeCryptoDepositsResultErrCopyWithImpl(_BeCryptoDepositsResultErr _value,
      $Res Function(_BeCryptoDepositsResultErr) _then)
      : super(_value, (v) => _then(v as _BeCryptoDepositsResultErr));

  @override
  _BeCryptoDepositsResultErr get _value =>
      super._value as _BeCryptoDepositsResultErr;

  @override
  $Res call({
    Object? err = freezed,
  }) {
    return _then(_BeCryptoDepositsResultErr(
      err == freezed
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as BeError2,
    ));
  }

  @override
  $BeError2CopyWith<$Res> get err {
    return $BeError2CopyWith<$Res>(_value.err, (value) {
      return _then(_value.copyWith(err: value));
    });
  }
}

/// @nodoc

class _$_BeCryptoDepositsResultErr
    with DiagnosticableTreeMixin
    implements _BeCryptoDepositsResultErr {
  const _$_BeCryptoDepositsResultErr(this.err);

  @override
  final BeError2 err;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BeCryptoDepositsResult.error(err: $err)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BeCryptoDepositsResult.error'))
      ..add(DiagnosticsProperty('err', err));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BeCryptoDepositsResultErr &&
            (identical(other.err, err) ||
                const DeepCollectionEquality().equals(other.err, err)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(err);

  @JsonKey(ignore: true)
  @override
  _$BeCryptoDepositsResultErrCopyWith<_BeCryptoDepositsResultErr>
      get copyWith =>
          __$BeCryptoDepositsResultErrCopyWithImpl<_BeCryptoDepositsResultErr>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            List<BeCryptoDeposit> deposits, int offset, int limit, int total)
        $default, {
    required TResult Function(BeError2 err) error,
  }) {
    return error(err);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(
            List<BeCryptoDeposit> deposits, int offset, int limit, int total)?
        $default, {
    TResult Function(BeError2 err)? error,
  }) {
    return error?.call(err);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            List<BeCryptoDeposit> deposits, int offset, int limit, int total)?
        $default, {
    TResult Function(BeError2 err)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(err);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_BeCryptoDepositsResult value) $default, {
    required TResult Function(_BeCryptoDepositsResultErr value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_BeCryptoDepositsResult value)? $default, {
    TResult Function(_BeCryptoDepositsResultErr value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BeCryptoDepositsResult value)? $default, {
    TResult Function(_BeCryptoDepositsResultErr value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _BeCryptoDepositsResultErr implements BeCryptoDepositsResult {
  const factory _BeCryptoDepositsResultErr(BeError2 err) =
      _$_BeCryptoDepositsResultErr;

  BeError2 get err => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$BeCryptoDepositsResultErrCopyWith<_BeCryptoDepositsResultErr>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
class _$BeCryptoWithdrawalResultTearOff {
  const _$BeCryptoWithdrawalResultTearOff();

  _BeCryptoWithdrawalResult call(BeCryptoWithdrawal withdrawal) {
    return _BeCryptoWithdrawalResult(
      withdrawal,
    );
  }

  _BeCryptoWithdrawalResultErr error(BeError2 err) {
    return _BeCryptoWithdrawalResultErr(
      err,
    );
  }
}

/// @nodoc
const $BeCryptoWithdrawalResult = _$BeCryptoWithdrawalResultTearOff();

/// @nodoc
mixin _$BeCryptoWithdrawalResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(BeCryptoWithdrawal withdrawal) $default, {
    required TResult Function(BeError2 err) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(BeCryptoWithdrawal withdrawal)? $default, {
    TResult Function(BeError2 err)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(BeCryptoWithdrawal withdrawal)? $default, {
    TResult Function(BeError2 err)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_BeCryptoWithdrawalResult value) $default, {
    required TResult Function(_BeCryptoWithdrawalResultErr value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_BeCryptoWithdrawalResult value)? $default, {
    TResult Function(_BeCryptoWithdrawalResultErr value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BeCryptoWithdrawalResult value)? $default, {
    TResult Function(_BeCryptoWithdrawalResultErr value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BeCryptoWithdrawalResultCopyWith<$Res> {
  factory $BeCryptoWithdrawalResultCopyWith(BeCryptoWithdrawalResult value,
          $Res Function(BeCryptoWithdrawalResult) then) =
      _$BeCryptoWithdrawalResultCopyWithImpl<$Res>;
}

/// @nodoc
class _$BeCryptoWithdrawalResultCopyWithImpl<$Res>
    implements $BeCryptoWithdrawalResultCopyWith<$Res> {
  _$BeCryptoWithdrawalResultCopyWithImpl(this._value, this._then);

  final BeCryptoWithdrawalResult _value;
  // ignore: unused_field
  final $Res Function(BeCryptoWithdrawalResult) _then;
}

/// @nodoc
abstract class _$BeCryptoWithdrawalResultCopyWith<$Res> {
  factory _$BeCryptoWithdrawalResultCopyWith(_BeCryptoWithdrawalResult value,
          $Res Function(_BeCryptoWithdrawalResult) then) =
      __$BeCryptoWithdrawalResultCopyWithImpl<$Res>;
  $Res call({BeCryptoWithdrawal withdrawal});
}

/// @nodoc
class __$BeCryptoWithdrawalResultCopyWithImpl<$Res>
    extends _$BeCryptoWithdrawalResultCopyWithImpl<$Res>
    implements _$BeCryptoWithdrawalResultCopyWith<$Res> {
  __$BeCryptoWithdrawalResultCopyWithImpl(_BeCryptoWithdrawalResult _value,
      $Res Function(_BeCryptoWithdrawalResult) _then)
      : super(_value, (v) => _then(v as _BeCryptoWithdrawalResult));

  @override
  _BeCryptoWithdrawalResult get _value =>
      super._value as _BeCryptoWithdrawalResult;

  @override
  $Res call({
    Object? withdrawal = freezed,
  }) {
    return _then(_BeCryptoWithdrawalResult(
      withdrawal == freezed
          ? _value.withdrawal
          : withdrawal // ignore: cast_nullable_to_non_nullable
              as BeCryptoWithdrawal,
    ));
  }
}

/// @nodoc

class _$_BeCryptoWithdrawalResult
    with DiagnosticableTreeMixin
    implements _BeCryptoWithdrawalResult {
  const _$_BeCryptoWithdrawalResult(this.withdrawal);

  @override
  final BeCryptoWithdrawal withdrawal;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BeCryptoWithdrawalResult(withdrawal: $withdrawal)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BeCryptoWithdrawalResult'))
      ..add(DiagnosticsProperty('withdrawal', withdrawal));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BeCryptoWithdrawalResult &&
            (identical(other.withdrawal, withdrawal) ||
                const DeepCollectionEquality()
                    .equals(other.withdrawal, withdrawal)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(withdrawal);

  @JsonKey(ignore: true)
  @override
  _$BeCryptoWithdrawalResultCopyWith<_BeCryptoWithdrawalResult> get copyWith =>
      __$BeCryptoWithdrawalResultCopyWithImpl<_BeCryptoWithdrawalResult>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(BeCryptoWithdrawal withdrawal) $default, {
    required TResult Function(BeError2 err) error,
  }) {
    return $default(withdrawal);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(BeCryptoWithdrawal withdrawal)? $default, {
    TResult Function(BeError2 err)? error,
  }) {
    return $default?.call(withdrawal);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(BeCryptoWithdrawal withdrawal)? $default, {
    TResult Function(BeError2 err)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(withdrawal);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_BeCryptoWithdrawalResult value) $default, {
    required TResult Function(_BeCryptoWithdrawalResultErr value) error,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_BeCryptoWithdrawalResult value)? $default, {
    TResult Function(_BeCryptoWithdrawalResultErr value)? error,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BeCryptoWithdrawalResult value)? $default, {
    TResult Function(_BeCryptoWithdrawalResultErr value)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _BeCryptoWithdrawalResult implements BeCryptoWithdrawalResult {
  const factory _BeCryptoWithdrawalResult(BeCryptoWithdrawal withdrawal) =
      _$_BeCryptoWithdrawalResult;

  BeCryptoWithdrawal get withdrawal => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$BeCryptoWithdrawalResultCopyWith<_BeCryptoWithdrawalResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$BeCryptoWithdrawalResultErrCopyWith<$Res> {
  factory _$BeCryptoWithdrawalResultErrCopyWith(
          _BeCryptoWithdrawalResultErr value,
          $Res Function(_BeCryptoWithdrawalResultErr) then) =
      __$BeCryptoWithdrawalResultErrCopyWithImpl<$Res>;
  $Res call({BeError2 err});

  $BeError2CopyWith<$Res> get err;
}

/// @nodoc
class __$BeCryptoWithdrawalResultErrCopyWithImpl<$Res>
    extends _$BeCryptoWithdrawalResultCopyWithImpl<$Res>
    implements _$BeCryptoWithdrawalResultErrCopyWith<$Res> {
  __$BeCryptoWithdrawalResultErrCopyWithImpl(
      _BeCryptoWithdrawalResultErr _value,
      $Res Function(_BeCryptoWithdrawalResultErr) _then)
      : super(_value, (v) => _then(v as _BeCryptoWithdrawalResultErr));

  @override
  _BeCryptoWithdrawalResultErr get _value =>
      super._value as _BeCryptoWithdrawalResultErr;

  @override
  $Res call({
    Object? err = freezed,
  }) {
    return _then(_BeCryptoWithdrawalResultErr(
      err == freezed
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as BeError2,
    ));
  }

  @override
  $BeError2CopyWith<$Res> get err {
    return $BeError2CopyWith<$Res>(_value.err, (value) {
      return _then(_value.copyWith(err: value));
    });
  }
}

/// @nodoc

class _$_BeCryptoWithdrawalResultErr
    with DiagnosticableTreeMixin
    implements _BeCryptoWithdrawalResultErr {
  const _$_BeCryptoWithdrawalResultErr(this.err);

  @override
  final BeError2 err;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BeCryptoWithdrawalResult.error(err: $err)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BeCryptoWithdrawalResult.error'))
      ..add(DiagnosticsProperty('err', err));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BeCryptoWithdrawalResultErr &&
            (identical(other.err, err) ||
                const DeepCollectionEquality().equals(other.err, err)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(err);

  @JsonKey(ignore: true)
  @override
  _$BeCryptoWithdrawalResultErrCopyWith<_BeCryptoWithdrawalResultErr>
      get copyWith => __$BeCryptoWithdrawalResultErrCopyWithImpl<
          _BeCryptoWithdrawalResultErr>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(BeCryptoWithdrawal withdrawal) $default, {
    required TResult Function(BeError2 err) error,
  }) {
    return error(err);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(BeCryptoWithdrawal withdrawal)? $default, {
    TResult Function(BeError2 err)? error,
  }) {
    return error?.call(err);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(BeCryptoWithdrawal withdrawal)? $default, {
    TResult Function(BeError2 err)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(err);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_BeCryptoWithdrawalResult value) $default, {
    required TResult Function(_BeCryptoWithdrawalResultErr value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_BeCryptoWithdrawalResult value)? $default, {
    TResult Function(_BeCryptoWithdrawalResultErr value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BeCryptoWithdrawalResult value)? $default, {
    TResult Function(_BeCryptoWithdrawalResultErr value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _BeCryptoWithdrawalResultErr
    implements BeCryptoWithdrawalResult {
  const factory _BeCryptoWithdrawalResultErr(BeError2 err) =
      _$_BeCryptoWithdrawalResultErr;

  BeError2 get err => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$BeCryptoWithdrawalResultErrCopyWith<_BeCryptoWithdrawalResultErr>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
class _$BeCryptoWithdrawalsResultTearOff {
  const _$BeCryptoWithdrawalsResultTearOff();

  _BeCryptoWithdrawalsResult call(
      List<BeCryptoWithdrawal> withdrawals, int offset, int limit, int total) {
    return _BeCryptoWithdrawalsResult(
      withdrawals,
      offset,
      limit,
      total,
    );
  }

  _BeCryptoWithdrawalsResultErr error(BeError2 err) {
    return _BeCryptoWithdrawalsResultErr(
      err,
    );
  }
}

/// @nodoc
const $BeCryptoWithdrawalsResult = _$BeCryptoWithdrawalsResultTearOff();

/// @nodoc
mixin _$BeCryptoWithdrawalsResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<BeCryptoWithdrawal> withdrawals, int offset,
            int limit, int total)
        $default, {
    required TResult Function(BeError2 err) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(List<BeCryptoWithdrawal> withdrawals, int offset,
            int limit, int total)?
        $default, {
    TResult Function(BeError2 err)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<BeCryptoWithdrawal> withdrawals, int offset,
            int limit, int total)?
        $default, {
    TResult Function(BeError2 err)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_BeCryptoWithdrawalsResult value) $default, {
    required TResult Function(_BeCryptoWithdrawalsResultErr value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_BeCryptoWithdrawalsResult value)? $default, {
    TResult Function(_BeCryptoWithdrawalsResultErr value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BeCryptoWithdrawalsResult value)? $default, {
    TResult Function(_BeCryptoWithdrawalsResultErr value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BeCryptoWithdrawalsResultCopyWith<$Res> {
  factory $BeCryptoWithdrawalsResultCopyWith(BeCryptoWithdrawalsResult value,
          $Res Function(BeCryptoWithdrawalsResult) then) =
      _$BeCryptoWithdrawalsResultCopyWithImpl<$Res>;
}

/// @nodoc
class _$BeCryptoWithdrawalsResultCopyWithImpl<$Res>
    implements $BeCryptoWithdrawalsResultCopyWith<$Res> {
  _$BeCryptoWithdrawalsResultCopyWithImpl(this._value, this._then);

  final BeCryptoWithdrawalsResult _value;
  // ignore: unused_field
  final $Res Function(BeCryptoWithdrawalsResult) _then;
}

/// @nodoc
abstract class _$BeCryptoWithdrawalsResultCopyWith<$Res> {
  factory _$BeCryptoWithdrawalsResultCopyWith(_BeCryptoWithdrawalsResult value,
          $Res Function(_BeCryptoWithdrawalsResult) then) =
      __$BeCryptoWithdrawalsResultCopyWithImpl<$Res>;
  $Res call(
      {List<BeCryptoWithdrawal> withdrawals, int offset, int limit, int total});
}

/// @nodoc
class __$BeCryptoWithdrawalsResultCopyWithImpl<$Res>
    extends _$BeCryptoWithdrawalsResultCopyWithImpl<$Res>
    implements _$BeCryptoWithdrawalsResultCopyWith<$Res> {
  __$BeCryptoWithdrawalsResultCopyWithImpl(_BeCryptoWithdrawalsResult _value,
      $Res Function(_BeCryptoWithdrawalsResult) _then)
      : super(_value, (v) => _then(v as _BeCryptoWithdrawalsResult));

  @override
  _BeCryptoWithdrawalsResult get _value =>
      super._value as _BeCryptoWithdrawalsResult;

  @override
  $Res call({
    Object? withdrawals = freezed,
    Object? offset = freezed,
    Object? limit = freezed,
    Object? total = freezed,
  }) {
    return _then(_BeCryptoWithdrawalsResult(
      withdrawals == freezed
          ? _value.withdrawals
          : withdrawals // ignore: cast_nullable_to_non_nullable
              as List<BeCryptoWithdrawal>,
      offset == freezed
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int,
      limit == freezed
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      total == freezed
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_BeCryptoWithdrawalsResult
    with DiagnosticableTreeMixin
    implements _BeCryptoWithdrawalsResult {
  const _$_BeCryptoWithdrawalsResult(
      this.withdrawals, this.offset, this.limit, this.total);

  @override
  final List<BeCryptoWithdrawal> withdrawals;
  @override
  final int offset;
  @override
  final int limit;
  @override
  final int total;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BeCryptoWithdrawalsResult(withdrawals: $withdrawals, offset: $offset, limit: $limit, total: $total)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BeCryptoWithdrawalsResult'))
      ..add(DiagnosticsProperty('withdrawals', withdrawals))
      ..add(DiagnosticsProperty('offset', offset))
      ..add(DiagnosticsProperty('limit', limit))
      ..add(DiagnosticsProperty('total', total));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BeCryptoWithdrawalsResult &&
            (identical(other.withdrawals, withdrawals) ||
                const DeepCollectionEquality()
                    .equals(other.withdrawals, withdrawals)) &&
            (identical(other.offset, offset) ||
                const DeepCollectionEquality().equals(other.offset, offset)) &&
            (identical(other.limit, limit) ||
                const DeepCollectionEquality().equals(other.limit, limit)) &&
            (identical(other.total, total) ||
                const DeepCollectionEquality().equals(other.total, total)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(withdrawals) ^
      const DeepCollectionEquality().hash(offset) ^
      const DeepCollectionEquality().hash(limit) ^
      const DeepCollectionEquality().hash(total);

  @JsonKey(ignore: true)
  @override
  _$BeCryptoWithdrawalsResultCopyWith<_BeCryptoWithdrawalsResult>
      get copyWith =>
          __$BeCryptoWithdrawalsResultCopyWithImpl<_BeCryptoWithdrawalsResult>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<BeCryptoWithdrawal> withdrawals, int offset,
            int limit, int total)
        $default, {
    required TResult Function(BeError2 err) error,
  }) {
    return $default(withdrawals, offset, limit, total);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(List<BeCryptoWithdrawal> withdrawals, int offset,
            int limit, int total)?
        $default, {
    TResult Function(BeError2 err)? error,
  }) {
    return $default?.call(withdrawals, offset, limit, total);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<BeCryptoWithdrawal> withdrawals, int offset,
            int limit, int total)?
        $default, {
    TResult Function(BeError2 err)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(withdrawals, offset, limit, total);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_BeCryptoWithdrawalsResult value) $default, {
    required TResult Function(_BeCryptoWithdrawalsResultErr value) error,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_BeCryptoWithdrawalsResult value)? $default, {
    TResult Function(_BeCryptoWithdrawalsResultErr value)? error,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BeCryptoWithdrawalsResult value)? $default, {
    TResult Function(_BeCryptoWithdrawalsResultErr value)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _BeCryptoWithdrawalsResult implements BeCryptoWithdrawalsResult {
  const factory _BeCryptoWithdrawalsResult(List<BeCryptoWithdrawal> withdrawals,
      int offset, int limit, int total) = _$_BeCryptoWithdrawalsResult;

  List<BeCryptoWithdrawal> get withdrawals =>
      throw _privateConstructorUsedError;
  int get offset => throw _privateConstructorUsedError;
  int get limit => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$BeCryptoWithdrawalsResultCopyWith<_BeCryptoWithdrawalsResult>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$BeCryptoWithdrawalsResultErrCopyWith<$Res> {
  factory _$BeCryptoWithdrawalsResultErrCopyWith(
          _BeCryptoWithdrawalsResultErr value,
          $Res Function(_BeCryptoWithdrawalsResultErr) then) =
      __$BeCryptoWithdrawalsResultErrCopyWithImpl<$Res>;
  $Res call({BeError2 err});

  $BeError2CopyWith<$Res> get err;
}

/// @nodoc
class __$BeCryptoWithdrawalsResultErrCopyWithImpl<$Res>
    extends _$BeCryptoWithdrawalsResultCopyWithImpl<$Res>
    implements _$BeCryptoWithdrawalsResultErrCopyWith<$Res> {
  __$BeCryptoWithdrawalsResultErrCopyWithImpl(
      _BeCryptoWithdrawalsResultErr _value,
      $Res Function(_BeCryptoWithdrawalsResultErr) _then)
      : super(_value, (v) => _then(v as _BeCryptoWithdrawalsResultErr));

  @override
  _BeCryptoWithdrawalsResultErr get _value =>
      super._value as _BeCryptoWithdrawalsResultErr;

  @override
  $Res call({
    Object? err = freezed,
  }) {
    return _then(_BeCryptoWithdrawalsResultErr(
      err == freezed
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as BeError2,
    ));
  }

  @override
  $BeError2CopyWith<$Res> get err {
    return $BeError2CopyWith<$Res>(_value.err, (value) {
      return _then(_value.copyWith(err: value));
    });
  }
}

/// @nodoc

class _$_BeCryptoWithdrawalsResultErr
    with DiagnosticableTreeMixin
    implements _BeCryptoWithdrawalsResultErr {
  const _$_BeCryptoWithdrawalsResultErr(this.err);

  @override
  final BeError2 err;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BeCryptoWithdrawalsResult.error(err: $err)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BeCryptoWithdrawalsResult.error'))
      ..add(DiagnosticsProperty('err', err));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BeCryptoWithdrawalsResultErr &&
            (identical(other.err, err) ||
                const DeepCollectionEquality().equals(other.err, err)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(err);

  @JsonKey(ignore: true)
  @override
  _$BeCryptoWithdrawalsResultErrCopyWith<_BeCryptoWithdrawalsResultErr>
      get copyWith => __$BeCryptoWithdrawalsResultErrCopyWithImpl<
          _BeCryptoWithdrawalsResultErr>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<BeCryptoWithdrawal> withdrawals, int offset,
            int limit, int total)
        $default, {
    required TResult Function(BeError2 err) error,
  }) {
    return error(err);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(List<BeCryptoWithdrawal> withdrawals, int offset,
            int limit, int total)?
        $default, {
    TResult Function(BeError2 err)? error,
  }) {
    return error?.call(err);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<BeCryptoWithdrawal> withdrawals, int offset,
            int limit, int total)?
        $default, {
    TResult Function(BeError2 err)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(err);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_BeCryptoWithdrawalsResult value) $default, {
    required TResult Function(_BeCryptoWithdrawalsResultErr value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_BeCryptoWithdrawalsResult value)? $default, {
    TResult Function(_BeCryptoWithdrawalsResultErr value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BeCryptoWithdrawalsResult value)? $default, {
    TResult Function(_BeCryptoWithdrawalsResultErr value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _BeCryptoWithdrawalsResultErr
    implements BeCryptoWithdrawalsResult {
  const factory _BeCryptoWithdrawalsResultErr(BeError2 err) =
      _$_BeCryptoWithdrawalsResultErr;

  BeError2 get err => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$BeCryptoWithdrawalsResultErrCopyWith<_BeCryptoWithdrawalsResultErr>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
class _$BeFiatDepositResultTearOff {
  const _$BeFiatDepositResultTearOff();

  _BeFiatDepositResult call(BeFiatDeposit deposit) {
    return _BeFiatDepositResult(
      deposit,
    );
  }

  _BeFiatDepositResultErr error(BeError2 err) {
    return _BeFiatDepositResultErr(
      err,
    );
  }
}

/// @nodoc
const $BeFiatDepositResult = _$BeFiatDepositResultTearOff();

/// @nodoc
mixin _$BeFiatDepositResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(BeFiatDeposit deposit) $default, {
    required TResult Function(BeError2 err) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(BeFiatDeposit deposit)? $default, {
    TResult Function(BeError2 err)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(BeFiatDeposit deposit)? $default, {
    TResult Function(BeError2 err)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_BeFiatDepositResult value) $default, {
    required TResult Function(_BeFiatDepositResultErr value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_BeFiatDepositResult value)? $default, {
    TResult Function(_BeFiatDepositResultErr value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BeFiatDepositResult value)? $default, {
    TResult Function(_BeFiatDepositResultErr value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BeFiatDepositResultCopyWith<$Res> {
  factory $BeFiatDepositResultCopyWith(
          BeFiatDepositResult value, $Res Function(BeFiatDepositResult) then) =
      _$BeFiatDepositResultCopyWithImpl<$Res>;
}

/// @nodoc
class _$BeFiatDepositResultCopyWithImpl<$Res>
    implements $BeFiatDepositResultCopyWith<$Res> {
  _$BeFiatDepositResultCopyWithImpl(this._value, this._then);

  final BeFiatDepositResult _value;
  // ignore: unused_field
  final $Res Function(BeFiatDepositResult) _then;
}

/// @nodoc
abstract class _$BeFiatDepositResultCopyWith<$Res> {
  factory _$BeFiatDepositResultCopyWith(_BeFiatDepositResult value,
          $Res Function(_BeFiatDepositResult) then) =
      __$BeFiatDepositResultCopyWithImpl<$Res>;
  $Res call({BeFiatDeposit deposit});
}

/// @nodoc
class __$BeFiatDepositResultCopyWithImpl<$Res>
    extends _$BeFiatDepositResultCopyWithImpl<$Res>
    implements _$BeFiatDepositResultCopyWith<$Res> {
  __$BeFiatDepositResultCopyWithImpl(
      _BeFiatDepositResult _value, $Res Function(_BeFiatDepositResult) _then)
      : super(_value, (v) => _then(v as _BeFiatDepositResult));

  @override
  _BeFiatDepositResult get _value => super._value as _BeFiatDepositResult;

  @override
  $Res call({
    Object? deposit = freezed,
  }) {
    return _then(_BeFiatDepositResult(
      deposit == freezed
          ? _value.deposit
          : deposit // ignore: cast_nullable_to_non_nullable
              as BeFiatDeposit,
    ));
  }
}

/// @nodoc

class _$_BeFiatDepositResult
    with DiagnosticableTreeMixin
    implements _BeFiatDepositResult {
  const _$_BeFiatDepositResult(this.deposit);

  @override
  final BeFiatDeposit deposit;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BeFiatDepositResult(deposit: $deposit)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BeFiatDepositResult'))
      ..add(DiagnosticsProperty('deposit', deposit));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BeFiatDepositResult &&
            (identical(other.deposit, deposit) ||
                const DeepCollectionEquality().equals(other.deposit, deposit)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(deposit);

  @JsonKey(ignore: true)
  @override
  _$BeFiatDepositResultCopyWith<_BeFiatDepositResult> get copyWith =>
      __$BeFiatDepositResultCopyWithImpl<_BeFiatDepositResult>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(BeFiatDeposit deposit) $default, {
    required TResult Function(BeError2 err) error,
  }) {
    return $default(deposit);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(BeFiatDeposit deposit)? $default, {
    TResult Function(BeError2 err)? error,
  }) {
    return $default?.call(deposit);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(BeFiatDeposit deposit)? $default, {
    TResult Function(BeError2 err)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(deposit);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_BeFiatDepositResult value) $default, {
    required TResult Function(_BeFiatDepositResultErr value) error,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_BeFiatDepositResult value)? $default, {
    TResult Function(_BeFiatDepositResultErr value)? error,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BeFiatDepositResult value)? $default, {
    TResult Function(_BeFiatDepositResultErr value)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _BeFiatDepositResult implements BeFiatDepositResult {
  const factory _BeFiatDepositResult(BeFiatDeposit deposit) =
      _$_BeFiatDepositResult;

  BeFiatDeposit get deposit => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$BeFiatDepositResultCopyWith<_BeFiatDepositResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$BeFiatDepositResultErrCopyWith<$Res> {
  factory _$BeFiatDepositResultErrCopyWith(_BeFiatDepositResultErr value,
          $Res Function(_BeFiatDepositResultErr) then) =
      __$BeFiatDepositResultErrCopyWithImpl<$Res>;
  $Res call({BeError2 err});

  $BeError2CopyWith<$Res> get err;
}

/// @nodoc
class __$BeFiatDepositResultErrCopyWithImpl<$Res>
    extends _$BeFiatDepositResultCopyWithImpl<$Res>
    implements _$BeFiatDepositResultErrCopyWith<$Res> {
  __$BeFiatDepositResultErrCopyWithImpl(_BeFiatDepositResultErr _value,
      $Res Function(_BeFiatDepositResultErr) _then)
      : super(_value, (v) => _then(v as _BeFiatDepositResultErr));

  @override
  _BeFiatDepositResultErr get _value => super._value as _BeFiatDepositResultErr;

  @override
  $Res call({
    Object? err = freezed,
  }) {
    return _then(_BeFiatDepositResultErr(
      err == freezed
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as BeError2,
    ));
  }

  @override
  $BeError2CopyWith<$Res> get err {
    return $BeError2CopyWith<$Res>(_value.err, (value) {
      return _then(_value.copyWith(err: value));
    });
  }
}

/// @nodoc

class _$_BeFiatDepositResultErr
    with DiagnosticableTreeMixin
    implements _BeFiatDepositResultErr {
  const _$_BeFiatDepositResultErr(this.err);

  @override
  final BeError2 err;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BeFiatDepositResult.error(err: $err)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BeFiatDepositResult.error'))
      ..add(DiagnosticsProperty('err', err));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BeFiatDepositResultErr &&
            (identical(other.err, err) ||
                const DeepCollectionEquality().equals(other.err, err)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(err);

  @JsonKey(ignore: true)
  @override
  _$BeFiatDepositResultErrCopyWith<_BeFiatDepositResultErr> get copyWith =>
      __$BeFiatDepositResultErrCopyWithImpl<_BeFiatDepositResultErr>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(BeFiatDeposit deposit) $default, {
    required TResult Function(BeError2 err) error,
  }) {
    return error(err);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(BeFiatDeposit deposit)? $default, {
    TResult Function(BeError2 err)? error,
  }) {
    return error?.call(err);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(BeFiatDeposit deposit)? $default, {
    TResult Function(BeError2 err)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(err);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_BeFiatDepositResult value) $default, {
    required TResult Function(_BeFiatDepositResultErr value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_BeFiatDepositResult value)? $default, {
    TResult Function(_BeFiatDepositResultErr value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BeFiatDepositResult value)? $default, {
    TResult Function(_BeFiatDepositResultErr value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _BeFiatDepositResultErr implements BeFiatDepositResult {
  const factory _BeFiatDepositResultErr(BeError2 err) =
      _$_BeFiatDepositResultErr;

  BeError2 get err => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$BeFiatDepositResultErrCopyWith<_BeFiatDepositResultErr> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$BeFiatDepositsResultTearOff {
  const _$BeFiatDepositsResultTearOff();

  _BeFiatDepositsResult call(
      List<BeFiatDeposit> deposits, int offset, int limit, int total) {
    return _BeFiatDepositsResult(
      deposits,
      offset,
      limit,
      total,
    );
  }

  _BeFiatDepositsResultErr error(BeError2 err) {
    return _BeFiatDepositsResultErr(
      err,
    );
  }
}

/// @nodoc
const $BeFiatDepositsResult = _$BeFiatDepositsResultTearOff();

/// @nodoc
mixin _$BeFiatDepositsResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            List<BeFiatDeposit> deposits, int offset, int limit, int total)
        $default, {
    required TResult Function(BeError2 err) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(
            List<BeFiatDeposit> deposits, int offset, int limit, int total)?
        $default, {
    TResult Function(BeError2 err)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            List<BeFiatDeposit> deposits, int offset, int limit, int total)?
        $default, {
    TResult Function(BeError2 err)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_BeFiatDepositsResult value) $default, {
    required TResult Function(_BeFiatDepositsResultErr value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_BeFiatDepositsResult value)? $default, {
    TResult Function(_BeFiatDepositsResultErr value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BeFiatDepositsResult value)? $default, {
    TResult Function(_BeFiatDepositsResultErr value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BeFiatDepositsResultCopyWith<$Res> {
  factory $BeFiatDepositsResultCopyWith(BeFiatDepositsResult value,
          $Res Function(BeFiatDepositsResult) then) =
      _$BeFiatDepositsResultCopyWithImpl<$Res>;
}

/// @nodoc
class _$BeFiatDepositsResultCopyWithImpl<$Res>
    implements $BeFiatDepositsResultCopyWith<$Res> {
  _$BeFiatDepositsResultCopyWithImpl(this._value, this._then);

  final BeFiatDepositsResult _value;
  // ignore: unused_field
  final $Res Function(BeFiatDepositsResult) _then;
}

/// @nodoc
abstract class _$BeFiatDepositsResultCopyWith<$Res> {
  factory _$BeFiatDepositsResultCopyWith(_BeFiatDepositsResult value,
          $Res Function(_BeFiatDepositsResult) then) =
      __$BeFiatDepositsResultCopyWithImpl<$Res>;
  $Res call({List<BeFiatDeposit> deposits, int offset, int limit, int total});
}

/// @nodoc
class __$BeFiatDepositsResultCopyWithImpl<$Res>
    extends _$BeFiatDepositsResultCopyWithImpl<$Res>
    implements _$BeFiatDepositsResultCopyWith<$Res> {
  __$BeFiatDepositsResultCopyWithImpl(
      _BeFiatDepositsResult _value, $Res Function(_BeFiatDepositsResult) _then)
      : super(_value, (v) => _then(v as _BeFiatDepositsResult));

  @override
  _BeFiatDepositsResult get _value => super._value as _BeFiatDepositsResult;

  @override
  $Res call({
    Object? deposits = freezed,
    Object? offset = freezed,
    Object? limit = freezed,
    Object? total = freezed,
  }) {
    return _then(_BeFiatDepositsResult(
      deposits == freezed
          ? _value.deposits
          : deposits // ignore: cast_nullable_to_non_nullable
              as List<BeFiatDeposit>,
      offset == freezed
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int,
      limit == freezed
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      total == freezed
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_BeFiatDepositsResult
    with DiagnosticableTreeMixin
    implements _BeFiatDepositsResult {
  const _$_BeFiatDepositsResult(
      this.deposits, this.offset, this.limit, this.total);

  @override
  final List<BeFiatDeposit> deposits;
  @override
  final int offset;
  @override
  final int limit;
  @override
  final int total;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BeFiatDepositsResult(deposits: $deposits, offset: $offset, limit: $limit, total: $total)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BeFiatDepositsResult'))
      ..add(DiagnosticsProperty('deposits', deposits))
      ..add(DiagnosticsProperty('offset', offset))
      ..add(DiagnosticsProperty('limit', limit))
      ..add(DiagnosticsProperty('total', total));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BeFiatDepositsResult &&
            (identical(other.deposits, deposits) ||
                const DeepCollectionEquality()
                    .equals(other.deposits, deposits)) &&
            (identical(other.offset, offset) ||
                const DeepCollectionEquality().equals(other.offset, offset)) &&
            (identical(other.limit, limit) ||
                const DeepCollectionEquality().equals(other.limit, limit)) &&
            (identical(other.total, total) ||
                const DeepCollectionEquality().equals(other.total, total)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(deposits) ^
      const DeepCollectionEquality().hash(offset) ^
      const DeepCollectionEquality().hash(limit) ^
      const DeepCollectionEquality().hash(total);

  @JsonKey(ignore: true)
  @override
  _$BeFiatDepositsResultCopyWith<_BeFiatDepositsResult> get copyWith =>
      __$BeFiatDepositsResultCopyWithImpl<_BeFiatDepositsResult>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            List<BeFiatDeposit> deposits, int offset, int limit, int total)
        $default, {
    required TResult Function(BeError2 err) error,
  }) {
    return $default(deposits, offset, limit, total);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(
            List<BeFiatDeposit> deposits, int offset, int limit, int total)?
        $default, {
    TResult Function(BeError2 err)? error,
  }) {
    return $default?.call(deposits, offset, limit, total);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            List<BeFiatDeposit> deposits, int offset, int limit, int total)?
        $default, {
    TResult Function(BeError2 err)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(deposits, offset, limit, total);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_BeFiatDepositsResult value) $default, {
    required TResult Function(_BeFiatDepositsResultErr value) error,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_BeFiatDepositsResult value)? $default, {
    TResult Function(_BeFiatDepositsResultErr value)? error,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BeFiatDepositsResult value)? $default, {
    TResult Function(_BeFiatDepositsResultErr value)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _BeFiatDepositsResult implements BeFiatDepositsResult {
  const factory _BeFiatDepositsResult(
          List<BeFiatDeposit> deposits, int offset, int limit, int total) =
      _$_BeFiatDepositsResult;

  List<BeFiatDeposit> get deposits => throw _privateConstructorUsedError;
  int get offset => throw _privateConstructorUsedError;
  int get limit => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$BeFiatDepositsResultCopyWith<_BeFiatDepositsResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$BeFiatDepositsResultErrCopyWith<$Res> {
  factory _$BeFiatDepositsResultErrCopyWith(_BeFiatDepositsResultErr value,
          $Res Function(_BeFiatDepositsResultErr) then) =
      __$BeFiatDepositsResultErrCopyWithImpl<$Res>;
  $Res call({BeError2 err});

  $BeError2CopyWith<$Res> get err;
}

/// @nodoc
class __$BeFiatDepositsResultErrCopyWithImpl<$Res>
    extends _$BeFiatDepositsResultCopyWithImpl<$Res>
    implements _$BeFiatDepositsResultErrCopyWith<$Res> {
  __$BeFiatDepositsResultErrCopyWithImpl(_BeFiatDepositsResultErr _value,
      $Res Function(_BeFiatDepositsResultErr) _then)
      : super(_value, (v) => _then(v as _BeFiatDepositsResultErr));

  @override
  _BeFiatDepositsResultErr get _value =>
      super._value as _BeFiatDepositsResultErr;

  @override
  $Res call({
    Object? err = freezed,
  }) {
    return _then(_BeFiatDepositsResultErr(
      err == freezed
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as BeError2,
    ));
  }

  @override
  $BeError2CopyWith<$Res> get err {
    return $BeError2CopyWith<$Res>(_value.err, (value) {
      return _then(_value.copyWith(err: value));
    });
  }
}

/// @nodoc

class _$_BeFiatDepositsResultErr
    with DiagnosticableTreeMixin
    implements _BeFiatDepositsResultErr {
  const _$_BeFiatDepositsResultErr(this.err);

  @override
  final BeError2 err;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BeFiatDepositsResult.error(err: $err)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BeFiatDepositsResult.error'))
      ..add(DiagnosticsProperty('err', err));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BeFiatDepositsResultErr &&
            (identical(other.err, err) ||
                const DeepCollectionEquality().equals(other.err, err)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(err);

  @JsonKey(ignore: true)
  @override
  _$BeFiatDepositsResultErrCopyWith<_BeFiatDepositsResultErr> get copyWith =>
      __$BeFiatDepositsResultErrCopyWithImpl<_BeFiatDepositsResultErr>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            List<BeFiatDeposit> deposits, int offset, int limit, int total)
        $default, {
    required TResult Function(BeError2 err) error,
  }) {
    return error(err);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(
            List<BeFiatDeposit> deposits, int offset, int limit, int total)?
        $default, {
    TResult Function(BeError2 err)? error,
  }) {
    return error?.call(err);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            List<BeFiatDeposit> deposits, int offset, int limit, int total)?
        $default, {
    TResult Function(BeError2 err)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(err);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_BeFiatDepositsResult value) $default, {
    required TResult Function(_BeFiatDepositsResultErr value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_BeFiatDepositsResult value)? $default, {
    TResult Function(_BeFiatDepositsResultErr value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BeFiatDepositsResult value)? $default, {
    TResult Function(_BeFiatDepositsResultErr value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _BeFiatDepositsResultErr implements BeFiatDepositsResult {
  const factory _BeFiatDepositsResultErr(BeError2 err) =
      _$_BeFiatDepositsResultErr;

  BeError2 get err => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$BeFiatDepositsResultErrCopyWith<_BeFiatDepositsResultErr> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$BeFiatWithdrawalResultTearOff {
  const _$BeFiatWithdrawalResultTearOff();

  _BeFiatWithdrawalResult call(BeFiatWithdrawal withdrawal) {
    return _BeFiatWithdrawalResult(
      withdrawal,
    );
  }

  _BeFiatWithdrawalResultErr error(BeError2 err) {
    return _BeFiatWithdrawalResultErr(
      err,
    );
  }
}

/// @nodoc
const $BeFiatWithdrawalResult = _$BeFiatWithdrawalResultTearOff();

/// @nodoc
mixin _$BeFiatWithdrawalResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(BeFiatWithdrawal withdrawal) $default, {
    required TResult Function(BeError2 err) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(BeFiatWithdrawal withdrawal)? $default, {
    TResult Function(BeError2 err)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(BeFiatWithdrawal withdrawal)? $default, {
    TResult Function(BeError2 err)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_BeFiatWithdrawalResult value) $default, {
    required TResult Function(_BeFiatWithdrawalResultErr value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_BeFiatWithdrawalResult value)? $default, {
    TResult Function(_BeFiatWithdrawalResultErr value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BeFiatWithdrawalResult value)? $default, {
    TResult Function(_BeFiatWithdrawalResultErr value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BeFiatWithdrawalResultCopyWith<$Res> {
  factory $BeFiatWithdrawalResultCopyWith(BeFiatWithdrawalResult value,
          $Res Function(BeFiatWithdrawalResult) then) =
      _$BeFiatWithdrawalResultCopyWithImpl<$Res>;
}

/// @nodoc
class _$BeFiatWithdrawalResultCopyWithImpl<$Res>
    implements $BeFiatWithdrawalResultCopyWith<$Res> {
  _$BeFiatWithdrawalResultCopyWithImpl(this._value, this._then);

  final BeFiatWithdrawalResult _value;
  // ignore: unused_field
  final $Res Function(BeFiatWithdrawalResult) _then;
}

/// @nodoc
abstract class _$BeFiatWithdrawalResultCopyWith<$Res> {
  factory _$BeFiatWithdrawalResultCopyWith(_BeFiatWithdrawalResult value,
          $Res Function(_BeFiatWithdrawalResult) then) =
      __$BeFiatWithdrawalResultCopyWithImpl<$Res>;
  $Res call({BeFiatWithdrawal withdrawal});
}

/// @nodoc
class __$BeFiatWithdrawalResultCopyWithImpl<$Res>
    extends _$BeFiatWithdrawalResultCopyWithImpl<$Res>
    implements _$BeFiatWithdrawalResultCopyWith<$Res> {
  __$BeFiatWithdrawalResultCopyWithImpl(_BeFiatWithdrawalResult _value,
      $Res Function(_BeFiatWithdrawalResult) _then)
      : super(_value, (v) => _then(v as _BeFiatWithdrawalResult));

  @override
  _BeFiatWithdrawalResult get _value => super._value as _BeFiatWithdrawalResult;

  @override
  $Res call({
    Object? withdrawal = freezed,
  }) {
    return _then(_BeFiatWithdrawalResult(
      withdrawal == freezed
          ? _value.withdrawal
          : withdrawal // ignore: cast_nullable_to_non_nullable
              as BeFiatWithdrawal,
    ));
  }
}

/// @nodoc

class _$_BeFiatWithdrawalResult
    with DiagnosticableTreeMixin
    implements _BeFiatWithdrawalResult {
  const _$_BeFiatWithdrawalResult(this.withdrawal);

  @override
  final BeFiatWithdrawal withdrawal;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BeFiatWithdrawalResult(withdrawal: $withdrawal)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BeFiatWithdrawalResult'))
      ..add(DiagnosticsProperty('withdrawal', withdrawal));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BeFiatWithdrawalResult &&
            (identical(other.withdrawal, withdrawal) ||
                const DeepCollectionEquality()
                    .equals(other.withdrawal, withdrawal)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(withdrawal);

  @JsonKey(ignore: true)
  @override
  _$BeFiatWithdrawalResultCopyWith<_BeFiatWithdrawalResult> get copyWith =>
      __$BeFiatWithdrawalResultCopyWithImpl<_BeFiatWithdrawalResult>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(BeFiatWithdrawal withdrawal) $default, {
    required TResult Function(BeError2 err) error,
  }) {
    return $default(withdrawal);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(BeFiatWithdrawal withdrawal)? $default, {
    TResult Function(BeError2 err)? error,
  }) {
    return $default?.call(withdrawal);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(BeFiatWithdrawal withdrawal)? $default, {
    TResult Function(BeError2 err)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(withdrawal);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_BeFiatWithdrawalResult value) $default, {
    required TResult Function(_BeFiatWithdrawalResultErr value) error,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_BeFiatWithdrawalResult value)? $default, {
    TResult Function(_BeFiatWithdrawalResultErr value)? error,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BeFiatWithdrawalResult value)? $default, {
    TResult Function(_BeFiatWithdrawalResultErr value)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _BeFiatWithdrawalResult implements BeFiatWithdrawalResult {
  const factory _BeFiatWithdrawalResult(BeFiatWithdrawal withdrawal) =
      _$_BeFiatWithdrawalResult;

  BeFiatWithdrawal get withdrawal => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$BeFiatWithdrawalResultCopyWith<_BeFiatWithdrawalResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$BeFiatWithdrawalResultErrCopyWith<$Res> {
  factory _$BeFiatWithdrawalResultErrCopyWith(_BeFiatWithdrawalResultErr value,
          $Res Function(_BeFiatWithdrawalResultErr) then) =
      __$BeFiatWithdrawalResultErrCopyWithImpl<$Res>;
  $Res call({BeError2 err});

  $BeError2CopyWith<$Res> get err;
}

/// @nodoc
class __$BeFiatWithdrawalResultErrCopyWithImpl<$Res>
    extends _$BeFiatWithdrawalResultCopyWithImpl<$Res>
    implements _$BeFiatWithdrawalResultErrCopyWith<$Res> {
  __$BeFiatWithdrawalResultErrCopyWithImpl(_BeFiatWithdrawalResultErr _value,
      $Res Function(_BeFiatWithdrawalResultErr) _then)
      : super(_value, (v) => _then(v as _BeFiatWithdrawalResultErr));

  @override
  _BeFiatWithdrawalResultErr get _value =>
      super._value as _BeFiatWithdrawalResultErr;

  @override
  $Res call({
    Object? err = freezed,
  }) {
    return _then(_BeFiatWithdrawalResultErr(
      err == freezed
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as BeError2,
    ));
  }

  @override
  $BeError2CopyWith<$Res> get err {
    return $BeError2CopyWith<$Res>(_value.err, (value) {
      return _then(_value.copyWith(err: value));
    });
  }
}

/// @nodoc

class _$_BeFiatWithdrawalResultErr
    with DiagnosticableTreeMixin
    implements _BeFiatWithdrawalResultErr {
  const _$_BeFiatWithdrawalResultErr(this.err);

  @override
  final BeError2 err;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BeFiatWithdrawalResult.error(err: $err)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BeFiatWithdrawalResult.error'))
      ..add(DiagnosticsProperty('err', err));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BeFiatWithdrawalResultErr &&
            (identical(other.err, err) ||
                const DeepCollectionEquality().equals(other.err, err)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(err);

  @JsonKey(ignore: true)
  @override
  _$BeFiatWithdrawalResultErrCopyWith<_BeFiatWithdrawalResultErr>
      get copyWith =>
          __$BeFiatWithdrawalResultErrCopyWithImpl<_BeFiatWithdrawalResultErr>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(BeFiatWithdrawal withdrawal) $default, {
    required TResult Function(BeError2 err) error,
  }) {
    return error(err);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(BeFiatWithdrawal withdrawal)? $default, {
    TResult Function(BeError2 err)? error,
  }) {
    return error?.call(err);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(BeFiatWithdrawal withdrawal)? $default, {
    TResult Function(BeError2 err)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(err);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_BeFiatWithdrawalResult value) $default, {
    required TResult Function(_BeFiatWithdrawalResultErr value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_BeFiatWithdrawalResult value)? $default, {
    TResult Function(_BeFiatWithdrawalResultErr value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BeFiatWithdrawalResult value)? $default, {
    TResult Function(_BeFiatWithdrawalResultErr value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _BeFiatWithdrawalResultErr implements BeFiatWithdrawalResult {
  const factory _BeFiatWithdrawalResultErr(BeError2 err) =
      _$_BeFiatWithdrawalResultErr;

  BeError2 get err => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$BeFiatWithdrawalResultErrCopyWith<_BeFiatWithdrawalResultErr>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
class _$BeFiatWithdrawalsResultTearOff {
  const _$BeFiatWithdrawalsResultTearOff();

  _BeFiatWithdrawalsResult call(
      List<BeFiatWithdrawal> withdrawals, int offset, int limit, int total) {
    return _BeFiatWithdrawalsResult(
      withdrawals,
      offset,
      limit,
      total,
    );
  }

  _BeFiatWithdrawalsResultErr error(BeError2 err) {
    return _BeFiatWithdrawalsResultErr(
      err,
    );
  }
}

/// @nodoc
const $BeFiatWithdrawalsResult = _$BeFiatWithdrawalsResultTearOff();

/// @nodoc
mixin _$BeFiatWithdrawalsResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<BeFiatWithdrawal> withdrawals, int offset, int limit,
            int total)
        $default, {
    required TResult Function(BeError2 err) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(List<BeFiatWithdrawal> withdrawals, int offset, int limit,
            int total)?
        $default, {
    TResult Function(BeError2 err)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<BeFiatWithdrawal> withdrawals, int offset, int limit,
            int total)?
        $default, {
    TResult Function(BeError2 err)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_BeFiatWithdrawalsResult value) $default, {
    required TResult Function(_BeFiatWithdrawalsResultErr value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_BeFiatWithdrawalsResult value)? $default, {
    TResult Function(_BeFiatWithdrawalsResultErr value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BeFiatWithdrawalsResult value)? $default, {
    TResult Function(_BeFiatWithdrawalsResultErr value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BeFiatWithdrawalsResultCopyWith<$Res> {
  factory $BeFiatWithdrawalsResultCopyWith(BeFiatWithdrawalsResult value,
          $Res Function(BeFiatWithdrawalsResult) then) =
      _$BeFiatWithdrawalsResultCopyWithImpl<$Res>;
}

/// @nodoc
class _$BeFiatWithdrawalsResultCopyWithImpl<$Res>
    implements $BeFiatWithdrawalsResultCopyWith<$Res> {
  _$BeFiatWithdrawalsResultCopyWithImpl(this._value, this._then);

  final BeFiatWithdrawalsResult _value;
  // ignore: unused_field
  final $Res Function(BeFiatWithdrawalsResult) _then;
}

/// @nodoc
abstract class _$BeFiatWithdrawalsResultCopyWith<$Res> {
  factory _$BeFiatWithdrawalsResultCopyWith(_BeFiatWithdrawalsResult value,
          $Res Function(_BeFiatWithdrawalsResult) then) =
      __$BeFiatWithdrawalsResultCopyWithImpl<$Res>;
  $Res call(
      {List<BeFiatWithdrawal> withdrawals, int offset, int limit, int total});
}

/// @nodoc
class __$BeFiatWithdrawalsResultCopyWithImpl<$Res>
    extends _$BeFiatWithdrawalsResultCopyWithImpl<$Res>
    implements _$BeFiatWithdrawalsResultCopyWith<$Res> {
  __$BeFiatWithdrawalsResultCopyWithImpl(_BeFiatWithdrawalsResult _value,
      $Res Function(_BeFiatWithdrawalsResult) _then)
      : super(_value, (v) => _then(v as _BeFiatWithdrawalsResult));

  @override
  _BeFiatWithdrawalsResult get _value =>
      super._value as _BeFiatWithdrawalsResult;

  @override
  $Res call({
    Object? withdrawals = freezed,
    Object? offset = freezed,
    Object? limit = freezed,
    Object? total = freezed,
  }) {
    return _then(_BeFiatWithdrawalsResult(
      withdrawals == freezed
          ? _value.withdrawals
          : withdrawals // ignore: cast_nullable_to_non_nullable
              as List<BeFiatWithdrawal>,
      offset == freezed
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int,
      limit == freezed
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      total == freezed
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_BeFiatWithdrawalsResult
    with DiagnosticableTreeMixin
    implements _BeFiatWithdrawalsResult {
  const _$_BeFiatWithdrawalsResult(
      this.withdrawals, this.offset, this.limit, this.total);

  @override
  final List<BeFiatWithdrawal> withdrawals;
  @override
  final int offset;
  @override
  final int limit;
  @override
  final int total;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BeFiatWithdrawalsResult(withdrawals: $withdrawals, offset: $offset, limit: $limit, total: $total)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BeFiatWithdrawalsResult'))
      ..add(DiagnosticsProperty('withdrawals', withdrawals))
      ..add(DiagnosticsProperty('offset', offset))
      ..add(DiagnosticsProperty('limit', limit))
      ..add(DiagnosticsProperty('total', total));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BeFiatWithdrawalsResult &&
            (identical(other.withdrawals, withdrawals) ||
                const DeepCollectionEquality()
                    .equals(other.withdrawals, withdrawals)) &&
            (identical(other.offset, offset) ||
                const DeepCollectionEquality().equals(other.offset, offset)) &&
            (identical(other.limit, limit) ||
                const DeepCollectionEquality().equals(other.limit, limit)) &&
            (identical(other.total, total) ||
                const DeepCollectionEquality().equals(other.total, total)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(withdrawals) ^
      const DeepCollectionEquality().hash(offset) ^
      const DeepCollectionEquality().hash(limit) ^
      const DeepCollectionEquality().hash(total);

  @JsonKey(ignore: true)
  @override
  _$BeFiatWithdrawalsResultCopyWith<_BeFiatWithdrawalsResult> get copyWith =>
      __$BeFiatWithdrawalsResultCopyWithImpl<_BeFiatWithdrawalsResult>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<BeFiatWithdrawal> withdrawals, int offset, int limit,
            int total)
        $default, {
    required TResult Function(BeError2 err) error,
  }) {
    return $default(withdrawals, offset, limit, total);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(List<BeFiatWithdrawal> withdrawals, int offset, int limit,
            int total)?
        $default, {
    TResult Function(BeError2 err)? error,
  }) {
    return $default?.call(withdrawals, offset, limit, total);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<BeFiatWithdrawal> withdrawals, int offset, int limit,
            int total)?
        $default, {
    TResult Function(BeError2 err)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(withdrawals, offset, limit, total);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_BeFiatWithdrawalsResult value) $default, {
    required TResult Function(_BeFiatWithdrawalsResultErr value) error,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_BeFiatWithdrawalsResult value)? $default, {
    TResult Function(_BeFiatWithdrawalsResultErr value)? error,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BeFiatWithdrawalsResult value)? $default, {
    TResult Function(_BeFiatWithdrawalsResultErr value)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _BeFiatWithdrawalsResult implements BeFiatWithdrawalsResult {
  const factory _BeFiatWithdrawalsResult(List<BeFiatWithdrawal> withdrawals,
      int offset, int limit, int total) = _$_BeFiatWithdrawalsResult;

  List<BeFiatWithdrawal> get withdrawals => throw _privateConstructorUsedError;
  int get offset => throw _privateConstructorUsedError;
  int get limit => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$BeFiatWithdrawalsResultCopyWith<_BeFiatWithdrawalsResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$BeFiatWithdrawalsResultErrCopyWith<$Res> {
  factory _$BeFiatWithdrawalsResultErrCopyWith(
          _BeFiatWithdrawalsResultErr value,
          $Res Function(_BeFiatWithdrawalsResultErr) then) =
      __$BeFiatWithdrawalsResultErrCopyWithImpl<$Res>;
  $Res call({BeError2 err});

  $BeError2CopyWith<$Res> get err;
}

/// @nodoc
class __$BeFiatWithdrawalsResultErrCopyWithImpl<$Res>
    extends _$BeFiatWithdrawalsResultCopyWithImpl<$Res>
    implements _$BeFiatWithdrawalsResultErrCopyWith<$Res> {
  __$BeFiatWithdrawalsResultErrCopyWithImpl(_BeFiatWithdrawalsResultErr _value,
      $Res Function(_BeFiatWithdrawalsResultErr) _then)
      : super(_value, (v) => _then(v as _BeFiatWithdrawalsResultErr));

  @override
  _BeFiatWithdrawalsResultErr get _value =>
      super._value as _BeFiatWithdrawalsResultErr;

  @override
  $Res call({
    Object? err = freezed,
  }) {
    return _then(_BeFiatWithdrawalsResultErr(
      err == freezed
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as BeError2,
    ));
  }

  @override
  $BeError2CopyWith<$Res> get err {
    return $BeError2CopyWith<$Res>(_value.err, (value) {
      return _then(_value.copyWith(err: value));
    });
  }
}

/// @nodoc

class _$_BeFiatWithdrawalsResultErr
    with DiagnosticableTreeMixin
    implements _BeFiatWithdrawalsResultErr {
  const _$_BeFiatWithdrawalsResultErr(this.err);

  @override
  final BeError2 err;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BeFiatWithdrawalsResult.error(err: $err)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BeFiatWithdrawalsResult.error'))
      ..add(DiagnosticsProperty('err', err));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BeFiatWithdrawalsResultErr &&
            (identical(other.err, err) ||
                const DeepCollectionEquality().equals(other.err, err)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(err);

  @JsonKey(ignore: true)
  @override
  _$BeFiatWithdrawalsResultErrCopyWith<_BeFiatWithdrawalsResultErr>
      get copyWith => __$BeFiatWithdrawalsResultErrCopyWithImpl<
          _BeFiatWithdrawalsResultErr>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<BeFiatWithdrawal> withdrawals, int offset, int limit,
            int total)
        $default, {
    required TResult Function(BeError2 err) error,
  }) {
    return error(err);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(List<BeFiatWithdrawal> withdrawals, int offset, int limit,
            int total)?
        $default, {
    TResult Function(BeError2 err)? error,
  }) {
    return error?.call(err);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<BeFiatWithdrawal> withdrawals, int offset, int limit,
            int total)?
        $default, {
    TResult Function(BeError2 err)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(err);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_BeFiatWithdrawalsResult value) $default, {
    required TResult Function(_BeFiatWithdrawalsResultErr value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_BeFiatWithdrawalsResult value)? $default, {
    TResult Function(_BeFiatWithdrawalsResultErr value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BeFiatWithdrawalsResult value)? $default, {
    TResult Function(_BeFiatWithdrawalsResultErr value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _BeFiatWithdrawalsResultErr implements BeFiatWithdrawalsResult {
  const factory _BeFiatWithdrawalsResultErr(BeError2 err) =
      _$_BeFiatWithdrawalsResultErr;

  BeError2 get err => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$BeFiatWithdrawalsResultErrCopyWith<_BeFiatWithdrawalsResultErr>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
class _$BeAddressBookResultTearOff {
  const _$BeAddressBookResultTearOff();

  _BeAddressBookResult call(List<BeAddressBookEntry> entries) {
    return _BeAddressBookResult(
      entries,
    );
  }

  _BeAddressBookResultErr error(BeError2 err) {
    return _BeAddressBookResultErr(
      err,
    );
  }
}

/// @nodoc
const $BeAddressBookResult = _$BeAddressBookResultTearOff();

/// @nodoc
mixin _$BeAddressBookResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<BeAddressBookEntry> entries) $default, {
    required TResult Function(BeError2 err) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(List<BeAddressBookEntry> entries)? $default, {
    TResult Function(BeError2 err)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<BeAddressBookEntry> entries)? $default, {
    TResult Function(BeError2 err)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_BeAddressBookResult value) $default, {
    required TResult Function(_BeAddressBookResultErr value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_BeAddressBookResult value)? $default, {
    TResult Function(_BeAddressBookResultErr value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BeAddressBookResult value)? $default, {
    TResult Function(_BeAddressBookResultErr value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BeAddressBookResultCopyWith<$Res> {
  factory $BeAddressBookResultCopyWith(
          BeAddressBookResult value, $Res Function(BeAddressBookResult) then) =
      _$BeAddressBookResultCopyWithImpl<$Res>;
}

/// @nodoc
class _$BeAddressBookResultCopyWithImpl<$Res>
    implements $BeAddressBookResultCopyWith<$Res> {
  _$BeAddressBookResultCopyWithImpl(this._value, this._then);

  final BeAddressBookResult _value;
  // ignore: unused_field
  final $Res Function(BeAddressBookResult) _then;
}

/// @nodoc
abstract class _$BeAddressBookResultCopyWith<$Res> {
  factory _$BeAddressBookResultCopyWith(_BeAddressBookResult value,
          $Res Function(_BeAddressBookResult) then) =
      __$BeAddressBookResultCopyWithImpl<$Res>;
  $Res call({List<BeAddressBookEntry> entries});
}

/// @nodoc
class __$BeAddressBookResultCopyWithImpl<$Res>
    extends _$BeAddressBookResultCopyWithImpl<$Res>
    implements _$BeAddressBookResultCopyWith<$Res> {
  __$BeAddressBookResultCopyWithImpl(
      _BeAddressBookResult _value, $Res Function(_BeAddressBookResult) _then)
      : super(_value, (v) => _then(v as _BeAddressBookResult));

  @override
  _BeAddressBookResult get _value => super._value as _BeAddressBookResult;

  @override
  $Res call({
    Object? entries = freezed,
  }) {
    return _then(_BeAddressBookResult(
      entries == freezed
          ? _value.entries
          : entries // ignore: cast_nullable_to_non_nullable
              as List<BeAddressBookEntry>,
    ));
  }
}

/// @nodoc

class _$_BeAddressBookResult
    with DiagnosticableTreeMixin
    implements _BeAddressBookResult {
  const _$_BeAddressBookResult(this.entries);

  @override
  final List<BeAddressBookEntry> entries;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BeAddressBookResult(entries: $entries)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BeAddressBookResult'))
      ..add(DiagnosticsProperty('entries', entries));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BeAddressBookResult &&
            (identical(other.entries, entries) ||
                const DeepCollectionEquality().equals(other.entries, entries)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(entries);

  @JsonKey(ignore: true)
  @override
  _$BeAddressBookResultCopyWith<_BeAddressBookResult> get copyWith =>
      __$BeAddressBookResultCopyWithImpl<_BeAddressBookResult>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<BeAddressBookEntry> entries) $default, {
    required TResult Function(BeError2 err) error,
  }) {
    return $default(entries);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(List<BeAddressBookEntry> entries)? $default, {
    TResult Function(BeError2 err)? error,
  }) {
    return $default?.call(entries);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<BeAddressBookEntry> entries)? $default, {
    TResult Function(BeError2 err)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(entries);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_BeAddressBookResult value) $default, {
    required TResult Function(_BeAddressBookResultErr value) error,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_BeAddressBookResult value)? $default, {
    TResult Function(_BeAddressBookResultErr value)? error,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BeAddressBookResult value)? $default, {
    TResult Function(_BeAddressBookResultErr value)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _BeAddressBookResult implements BeAddressBookResult {
  const factory _BeAddressBookResult(List<BeAddressBookEntry> entries) =
      _$_BeAddressBookResult;

  List<BeAddressBookEntry> get entries => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$BeAddressBookResultCopyWith<_BeAddressBookResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$BeAddressBookResultErrCopyWith<$Res> {
  factory _$BeAddressBookResultErrCopyWith(_BeAddressBookResultErr value,
          $Res Function(_BeAddressBookResultErr) then) =
      __$BeAddressBookResultErrCopyWithImpl<$Res>;
  $Res call({BeError2 err});

  $BeError2CopyWith<$Res> get err;
}

/// @nodoc
class __$BeAddressBookResultErrCopyWithImpl<$Res>
    extends _$BeAddressBookResultCopyWithImpl<$Res>
    implements _$BeAddressBookResultErrCopyWith<$Res> {
  __$BeAddressBookResultErrCopyWithImpl(_BeAddressBookResultErr _value,
      $Res Function(_BeAddressBookResultErr) _then)
      : super(_value, (v) => _then(v as _BeAddressBookResultErr));

  @override
  _BeAddressBookResultErr get _value => super._value as _BeAddressBookResultErr;

  @override
  $Res call({
    Object? err = freezed,
  }) {
    return _then(_BeAddressBookResultErr(
      err == freezed
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as BeError2,
    ));
  }

  @override
  $BeError2CopyWith<$Res> get err {
    return $BeError2CopyWith<$Res>(_value.err, (value) {
      return _then(_value.copyWith(err: value));
    });
  }
}

/// @nodoc

class _$_BeAddressBookResultErr
    with DiagnosticableTreeMixin
    implements _BeAddressBookResultErr {
  const _$_BeAddressBookResultErr(this.err);

  @override
  final BeError2 err;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BeAddressBookResult.error(err: $err)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BeAddressBookResult.error'))
      ..add(DiagnosticsProperty('err', err));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BeAddressBookResultErr &&
            (identical(other.err, err) ||
                const DeepCollectionEquality().equals(other.err, err)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(err);

  @JsonKey(ignore: true)
  @override
  _$BeAddressBookResultErrCopyWith<_BeAddressBookResultErr> get copyWith =>
      __$BeAddressBookResultErrCopyWithImpl<_BeAddressBookResultErr>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<BeAddressBookEntry> entries) $default, {
    required TResult Function(BeError2 err) error,
  }) {
    return error(err);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(List<BeAddressBookEntry> entries)? $default, {
    TResult Function(BeError2 err)? error,
  }) {
    return error?.call(err);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<BeAddressBookEntry> entries)? $default, {
    TResult Function(BeError2 err)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(err);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_BeAddressBookResult value) $default, {
    required TResult Function(_BeAddressBookResultErr value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_BeAddressBookResult value)? $default, {
    TResult Function(_BeAddressBookResultErr value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BeAddressBookResult value)? $default, {
    TResult Function(_BeAddressBookResultErr value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _BeAddressBookResultErr implements BeAddressBookResult {
  const factory _BeAddressBookResultErr(BeError2 err) =
      _$_BeAddressBookResultErr;

  BeError2 get err => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$BeAddressBookResultErrCopyWith<_BeAddressBookResultErr> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$BeBrokerOrderResultTearOff {
  const _$BeBrokerOrderResultTearOff();

  _BeBrokerOrderResult call(BeBrokerOrder order) {
    return _BeBrokerOrderResult(
      order,
    );
  }

  _BeBrokerOrderResultErr error(BeError2 err) {
    return _BeBrokerOrderResultErr(
      err,
    );
  }
}

/// @nodoc
const $BeBrokerOrderResult = _$BeBrokerOrderResultTearOff();

/// @nodoc
mixin _$BeBrokerOrderResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(BeBrokerOrder order) $default, {
    required TResult Function(BeError2 err) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(BeBrokerOrder order)? $default, {
    TResult Function(BeError2 err)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(BeBrokerOrder order)? $default, {
    TResult Function(BeError2 err)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_BeBrokerOrderResult value) $default, {
    required TResult Function(_BeBrokerOrderResultErr value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_BeBrokerOrderResult value)? $default, {
    TResult Function(_BeBrokerOrderResultErr value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BeBrokerOrderResult value)? $default, {
    TResult Function(_BeBrokerOrderResultErr value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BeBrokerOrderResultCopyWith<$Res> {
  factory $BeBrokerOrderResultCopyWith(
          BeBrokerOrderResult value, $Res Function(BeBrokerOrderResult) then) =
      _$BeBrokerOrderResultCopyWithImpl<$Res>;
}

/// @nodoc
class _$BeBrokerOrderResultCopyWithImpl<$Res>
    implements $BeBrokerOrderResultCopyWith<$Res> {
  _$BeBrokerOrderResultCopyWithImpl(this._value, this._then);

  final BeBrokerOrderResult _value;
  // ignore: unused_field
  final $Res Function(BeBrokerOrderResult) _then;
}

/// @nodoc
abstract class _$BeBrokerOrderResultCopyWith<$Res> {
  factory _$BeBrokerOrderResultCopyWith(_BeBrokerOrderResult value,
          $Res Function(_BeBrokerOrderResult) then) =
      __$BeBrokerOrderResultCopyWithImpl<$Res>;
  $Res call({BeBrokerOrder order});
}

/// @nodoc
class __$BeBrokerOrderResultCopyWithImpl<$Res>
    extends _$BeBrokerOrderResultCopyWithImpl<$Res>
    implements _$BeBrokerOrderResultCopyWith<$Res> {
  __$BeBrokerOrderResultCopyWithImpl(
      _BeBrokerOrderResult _value, $Res Function(_BeBrokerOrderResult) _then)
      : super(_value, (v) => _then(v as _BeBrokerOrderResult));

  @override
  _BeBrokerOrderResult get _value => super._value as _BeBrokerOrderResult;

  @override
  $Res call({
    Object? order = freezed,
  }) {
    return _then(_BeBrokerOrderResult(
      order == freezed
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as BeBrokerOrder,
    ));
  }
}

/// @nodoc

class _$_BeBrokerOrderResult
    with DiagnosticableTreeMixin
    implements _BeBrokerOrderResult {
  const _$_BeBrokerOrderResult(this.order);

  @override
  final BeBrokerOrder order;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BeBrokerOrderResult(order: $order)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BeBrokerOrderResult'))
      ..add(DiagnosticsProperty('order', order));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BeBrokerOrderResult &&
            (identical(other.order, order) ||
                const DeepCollectionEquality().equals(other.order, order)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(order);

  @JsonKey(ignore: true)
  @override
  _$BeBrokerOrderResultCopyWith<_BeBrokerOrderResult> get copyWith =>
      __$BeBrokerOrderResultCopyWithImpl<_BeBrokerOrderResult>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(BeBrokerOrder order) $default, {
    required TResult Function(BeError2 err) error,
  }) {
    return $default(order);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(BeBrokerOrder order)? $default, {
    TResult Function(BeError2 err)? error,
  }) {
    return $default?.call(order);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(BeBrokerOrder order)? $default, {
    TResult Function(BeError2 err)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(order);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_BeBrokerOrderResult value) $default, {
    required TResult Function(_BeBrokerOrderResultErr value) error,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_BeBrokerOrderResult value)? $default, {
    TResult Function(_BeBrokerOrderResultErr value)? error,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BeBrokerOrderResult value)? $default, {
    TResult Function(_BeBrokerOrderResultErr value)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _BeBrokerOrderResult implements BeBrokerOrderResult {
  const factory _BeBrokerOrderResult(BeBrokerOrder order) =
      _$_BeBrokerOrderResult;

  BeBrokerOrder get order => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$BeBrokerOrderResultCopyWith<_BeBrokerOrderResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$BeBrokerOrderResultErrCopyWith<$Res> {
  factory _$BeBrokerOrderResultErrCopyWith(_BeBrokerOrderResultErr value,
          $Res Function(_BeBrokerOrderResultErr) then) =
      __$BeBrokerOrderResultErrCopyWithImpl<$Res>;
  $Res call({BeError2 err});

  $BeError2CopyWith<$Res> get err;
}

/// @nodoc
class __$BeBrokerOrderResultErrCopyWithImpl<$Res>
    extends _$BeBrokerOrderResultCopyWithImpl<$Res>
    implements _$BeBrokerOrderResultErrCopyWith<$Res> {
  __$BeBrokerOrderResultErrCopyWithImpl(_BeBrokerOrderResultErr _value,
      $Res Function(_BeBrokerOrderResultErr) _then)
      : super(_value, (v) => _then(v as _BeBrokerOrderResultErr));

  @override
  _BeBrokerOrderResultErr get _value => super._value as _BeBrokerOrderResultErr;

  @override
  $Res call({
    Object? err = freezed,
  }) {
    return _then(_BeBrokerOrderResultErr(
      err == freezed
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as BeError2,
    ));
  }

  @override
  $BeError2CopyWith<$Res> get err {
    return $BeError2CopyWith<$Res>(_value.err, (value) {
      return _then(_value.copyWith(err: value));
    });
  }
}

/// @nodoc

class _$_BeBrokerOrderResultErr
    with DiagnosticableTreeMixin
    implements _BeBrokerOrderResultErr {
  const _$_BeBrokerOrderResultErr(this.err);

  @override
  final BeError2 err;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BeBrokerOrderResult.error(err: $err)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BeBrokerOrderResult.error'))
      ..add(DiagnosticsProperty('err', err));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BeBrokerOrderResultErr &&
            (identical(other.err, err) ||
                const DeepCollectionEquality().equals(other.err, err)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(err);

  @JsonKey(ignore: true)
  @override
  _$BeBrokerOrderResultErrCopyWith<_BeBrokerOrderResultErr> get copyWith =>
      __$BeBrokerOrderResultErrCopyWithImpl<_BeBrokerOrderResultErr>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(BeBrokerOrder order) $default, {
    required TResult Function(BeError2 err) error,
  }) {
    return error(err);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(BeBrokerOrder order)? $default, {
    TResult Function(BeError2 err)? error,
  }) {
    return error?.call(err);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(BeBrokerOrder order)? $default, {
    TResult Function(BeError2 err)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(err);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_BeBrokerOrderResult value) $default, {
    required TResult Function(_BeBrokerOrderResultErr value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_BeBrokerOrderResult value)? $default, {
    TResult Function(_BeBrokerOrderResultErr value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BeBrokerOrderResult value)? $default, {
    TResult Function(_BeBrokerOrderResultErr value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _BeBrokerOrderResultErr implements BeBrokerOrderResult {
  const factory _BeBrokerOrderResultErr(BeError2 err) =
      _$_BeBrokerOrderResultErr;

  BeError2 get err => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$BeBrokerOrderResultErrCopyWith<_BeBrokerOrderResultErr> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$BeBrokerOrdersResultTearOff {
  const _$BeBrokerOrdersResultTearOff();

  _BeBrokerOrdersResult call(
      List<BeBrokerOrder> orders, int offset, int limit, int total) {
    return _BeBrokerOrdersResult(
      orders,
      offset,
      limit,
      total,
    );
  }

  _BeBrokerOrdersResultErr error(BeError2 err) {
    return _BeBrokerOrdersResultErr(
      err,
    );
  }
}

/// @nodoc
const $BeBrokerOrdersResult = _$BeBrokerOrdersResultTearOff();

/// @nodoc
mixin _$BeBrokerOrdersResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            List<BeBrokerOrder> orders, int offset, int limit, int total)
        $default, {
    required TResult Function(BeError2 err) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(
            List<BeBrokerOrder> orders, int offset, int limit, int total)?
        $default, {
    TResult Function(BeError2 err)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            List<BeBrokerOrder> orders, int offset, int limit, int total)?
        $default, {
    TResult Function(BeError2 err)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_BeBrokerOrdersResult value) $default, {
    required TResult Function(_BeBrokerOrdersResultErr value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_BeBrokerOrdersResult value)? $default, {
    TResult Function(_BeBrokerOrdersResultErr value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BeBrokerOrdersResult value)? $default, {
    TResult Function(_BeBrokerOrdersResultErr value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BeBrokerOrdersResultCopyWith<$Res> {
  factory $BeBrokerOrdersResultCopyWith(BeBrokerOrdersResult value,
          $Res Function(BeBrokerOrdersResult) then) =
      _$BeBrokerOrdersResultCopyWithImpl<$Res>;
}

/// @nodoc
class _$BeBrokerOrdersResultCopyWithImpl<$Res>
    implements $BeBrokerOrdersResultCopyWith<$Res> {
  _$BeBrokerOrdersResultCopyWithImpl(this._value, this._then);

  final BeBrokerOrdersResult _value;
  // ignore: unused_field
  final $Res Function(BeBrokerOrdersResult) _then;
}

/// @nodoc
abstract class _$BeBrokerOrdersResultCopyWith<$Res> {
  factory _$BeBrokerOrdersResultCopyWith(_BeBrokerOrdersResult value,
          $Res Function(_BeBrokerOrdersResult) then) =
      __$BeBrokerOrdersResultCopyWithImpl<$Res>;
  $Res call({List<BeBrokerOrder> orders, int offset, int limit, int total});
}

/// @nodoc
class __$BeBrokerOrdersResultCopyWithImpl<$Res>
    extends _$BeBrokerOrdersResultCopyWithImpl<$Res>
    implements _$BeBrokerOrdersResultCopyWith<$Res> {
  __$BeBrokerOrdersResultCopyWithImpl(
      _BeBrokerOrdersResult _value, $Res Function(_BeBrokerOrdersResult) _then)
      : super(_value, (v) => _then(v as _BeBrokerOrdersResult));

  @override
  _BeBrokerOrdersResult get _value => super._value as _BeBrokerOrdersResult;

  @override
  $Res call({
    Object? orders = freezed,
    Object? offset = freezed,
    Object? limit = freezed,
    Object? total = freezed,
  }) {
    return _then(_BeBrokerOrdersResult(
      orders == freezed
          ? _value.orders
          : orders // ignore: cast_nullable_to_non_nullable
              as List<BeBrokerOrder>,
      offset == freezed
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int,
      limit == freezed
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      total == freezed
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_BeBrokerOrdersResult
    with DiagnosticableTreeMixin
    implements _BeBrokerOrdersResult {
  const _$_BeBrokerOrdersResult(
      this.orders, this.offset, this.limit, this.total);

  @override
  final List<BeBrokerOrder> orders;
  @override
  final int offset;
  @override
  final int limit;
  @override
  final int total;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BeBrokerOrdersResult(orders: $orders, offset: $offset, limit: $limit, total: $total)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BeBrokerOrdersResult'))
      ..add(DiagnosticsProperty('orders', orders))
      ..add(DiagnosticsProperty('offset', offset))
      ..add(DiagnosticsProperty('limit', limit))
      ..add(DiagnosticsProperty('total', total));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BeBrokerOrdersResult &&
            (identical(other.orders, orders) ||
                const DeepCollectionEquality().equals(other.orders, orders)) &&
            (identical(other.offset, offset) ||
                const DeepCollectionEquality().equals(other.offset, offset)) &&
            (identical(other.limit, limit) ||
                const DeepCollectionEquality().equals(other.limit, limit)) &&
            (identical(other.total, total) ||
                const DeepCollectionEquality().equals(other.total, total)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(orders) ^
      const DeepCollectionEquality().hash(offset) ^
      const DeepCollectionEquality().hash(limit) ^
      const DeepCollectionEquality().hash(total);

  @JsonKey(ignore: true)
  @override
  _$BeBrokerOrdersResultCopyWith<_BeBrokerOrdersResult> get copyWith =>
      __$BeBrokerOrdersResultCopyWithImpl<_BeBrokerOrdersResult>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            List<BeBrokerOrder> orders, int offset, int limit, int total)
        $default, {
    required TResult Function(BeError2 err) error,
  }) {
    return $default(orders, offset, limit, total);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(
            List<BeBrokerOrder> orders, int offset, int limit, int total)?
        $default, {
    TResult Function(BeError2 err)? error,
  }) {
    return $default?.call(orders, offset, limit, total);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            List<BeBrokerOrder> orders, int offset, int limit, int total)?
        $default, {
    TResult Function(BeError2 err)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(orders, offset, limit, total);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_BeBrokerOrdersResult value) $default, {
    required TResult Function(_BeBrokerOrdersResultErr value) error,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_BeBrokerOrdersResult value)? $default, {
    TResult Function(_BeBrokerOrdersResultErr value)? error,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BeBrokerOrdersResult value)? $default, {
    TResult Function(_BeBrokerOrdersResultErr value)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _BeBrokerOrdersResult implements BeBrokerOrdersResult {
  const factory _BeBrokerOrdersResult(
          List<BeBrokerOrder> orders, int offset, int limit, int total) =
      _$_BeBrokerOrdersResult;

  List<BeBrokerOrder> get orders => throw _privateConstructorUsedError;
  int get offset => throw _privateConstructorUsedError;
  int get limit => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$BeBrokerOrdersResultCopyWith<_BeBrokerOrdersResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$BeBrokerOrdersResultErrCopyWith<$Res> {
  factory _$BeBrokerOrdersResultErrCopyWith(_BeBrokerOrdersResultErr value,
          $Res Function(_BeBrokerOrdersResultErr) then) =
      __$BeBrokerOrdersResultErrCopyWithImpl<$Res>;
  $Res call({BeError2 err});

  $BeError2CopyWith<$Res> get err;
}

/// @nodoc
class __$BeBrokerOrdersResultErrCopyWithImpl<$Res>
    extends _$BeBrokerOrdersResultCopyWithImpl<$Res>
    implements _$BeBrokerOrdersResultErrCopyWith<$Res> {
  __$BeBrokerOrdersResultErrCopyWithImpl(_BeBrokerOrdersResultErr _value,
      $Res Function(_BeBrokerOrdersResultErr) _then)
      : super(_value, (v) => _then(v as _BeBrokerOrdersResultErr));

  @override
  _BeBrokerOrdersResultErr get _value =>
      super._value as _BeBrokerOrdersResultErr;

  @override
  $Res call({
    Object? err = freezed,
  }) {
    return _then(_BeBrokerOrdersResultErr(
      err == freezed
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as BeError2,
    ));
  }

  @override
  $BeError2CopyWith<$Res> get err {
    return $BeError2CopyWith<$Res>(_value.err, (value) {
      return _then(_value.copyWith(err: value));
    });
  }
}

/// @nodoc

class _$_BeBrokerOrdersResultErr
    with DiagnosticableTreeMixin
    implements _BeBrokerOrdersResultErr {
  const _$_BeBrokerOrdersResultErr(this.err);

  @override
  final BeError2 err;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BeBrokerOrdersResult.error(err: $err)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BeBrokerOrdersResult.error'))
      ..add(DiagnosticsProperty('err', err));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BeBrokerOrdersResultErr &&
            (identical(other.err, err) ||
                const DeepCollectionEquality().equals(other.err, err)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(err);

  @JsonKey(ignore: true)
  @override
  _$BeBrokerOrdersResultErrCopyWith<_BeBrokerOrdersResultErr> get copyWith =>
      __$BeBrokerOrdersResultErrCopyWithImpl<_BeBrokerOrdersResultErr>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            List<BeBrokerOrder> orders, int offset, int limit, int total)
        $default, {
    required TResult Function(BeError2 err) error,
  }) {
    return error(err);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(
            List<BeBrokerOrder> orders, int offset, int limit, int total)?
        $default, {
    TResult Function(BeError2 err)? error,
  }) {
    return error?.call(err);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            List<BeBrokerOrder> orders, int offset, int limit, int total)?
        $default, {
    TResult Function(BeError2 err)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(err);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_BeBrokerOrdersResult value) $default, {
    required TResult Function(_BeBrokerOrdersResultErr value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_BeBrokerOrdersResult value)? $default, {
    TResult Function(_BeBrokerOrdersResultErr value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BeBrokerOrdersResult value)? $default, {
    TResult Function(_BeBrokerOrdersResultErr value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _BeBrokerOrdersResultErr implements BeBrokerOrdersResult {
  const factory _BeBrokerOrdersResultErr(BeError2 err) =
      _$_BeBrokerOrdersResultErr;

  BeError2 get err => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$BeBrokerOrdersResultErrCopyWith<_BeBrokerOrdersResultErr> get copyWith =>
      throw _privateConstructorUsedError;
}
