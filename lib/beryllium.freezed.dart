// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'beryllium.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BeError {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() network,
    required TResult Function(String message) auth,
    required TResult Function() format,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? network,
    TResult? Function(String message)? auth,
    TResult? Function()? format,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? network,
    TResult Function(String message)? auth,
    TResult Function()? format,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Network value) network,
    required TResult Function(Auth value) auth,
    required TResult Function(Format value) format,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Network value)? network,
    TResult? Function(Auth value)? auth,
    TResult? Function(Format value)? format,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Network value)? network,
    TResult Function(Auth value)? auth,
    TResult Function(Format value)? format,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BeErrorCopyWith<$Res> {
  factory $BeErrorCopyWith(BeError value, $Res Function(BeError) then) =
      _$BeErrorCopyWithImpl<$Res, BeError>;
}

/// @nodoc
class _$BeErrorCopyWithImpl<$Res, $Val extends BeError>
    implements $BeErrorCopyWith<$Res> {
  _$BeErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$NetworkCopyWith<$Res> {
  factory _$$NetworkCopyWith(_$Network value, $Res Function(_$Network) then) =
      __$$NetworkCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NetworkCopyWithImpl<$Res>
    extends _$BeErrorCopyWithImpl<$Res, _$Network>
    implements _$$NetworkCopyWith<$Res> {
  __$$NetworkCopyWithImpl(_$Network _value, $Res Function(_$Network) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Network with DiagnosticableTreeMixin implements Network {
  const _$Network();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BeError.network()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'BeError.network'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Network);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() network,
    required TResult Function(String message) auth,
    required TResult Function() format,
  }) {
    return network();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? network,
    TResult? Function(String message)? auth,
    TResult? Function()? format,
  }) {
    return network?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? network,
    TResult Function(String message)? auth,
    TResult Function()? format,
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
    required TResult Function(Format value) format,
  }) {
    return network(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Network value)? network,
    TResult? Function(Auth value)? auth,
    TResult? Function(Format value)? format,
  }) {
    return network?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Network value)? network,
    TResult Function(Auth value)? auth,
    TResult Function(Format value)? format,
    required TResult orElse(),
  }) {
    if (network != null) {
      return network(this);
    }
    return orElse();
  }
}

abstract class Network implements BeError {
  const factory Network() = _$Network;
}

/// @nodoc
abstract class _$$AuthCopyWith<$Res> {
  factory _$$AuthCopyWith(_$Auth value, $Res Function(_$Auth) then) =
      __$$AuthCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$AuthCopyWithImpl<$Res> extends _$BeErrorCopyWithImpl<$Res, _$Auth>
    implements _$$AuthCopyWith<$Res> {
  __$$AuthCopyWithImpl(_$Auth _value, $Res Function(_$Auth) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$Auth(
      null == message
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
    return 'BeError.auth(message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BeError.auth'))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Auth &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthCopyWith<_$Auth> get copyWith =>
      __$$AuthCopyWithImpl<_$Auth>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() network,
    required TResult Function(String message) auth,
    required TResult Function() format,
  }) {
    return auth(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? network,
    TResult? Function(String message)? auth,
    TResult? Function()? format,
  }) {
    return auth?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? network,
    TResult Function(String message)? auth,
    TResult Function()? format,
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
    required TResult Function(Format value) format,
  }) {
    return auth(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Network value)? network,
    TResult? Function(Auth value)? auth,
    TResult? Function(Format value)? format,
  }) {
    return auth?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Network value)? network,
    TResult Function(Auth value)? auth,
    TResult Function(Format value)? format,
    required TResult orElse(),
  }) {
    if (auth != null) {
      return auth(this);
    }
    return orElse();
  }
}

abstract class Auth implements BeError {
  const factory Auth(final String message) = _$Auth;

  String get message;
  @JsonKey(ignore: true)
  _$$AuthCopyWith<_$Auth> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FormatCopyWith<$Res> {
  factory _$$FormatCopyWith(_$Format value, $Res Function(_$Format) then) =
      __$$FormatCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FormatCopyWithImpl<$Res> extends _$BeErrorCopyWithImpl<$Res, _$Format>
    implements _$$FormatCopyWith<$Res> {
  __$$FormatCopyWithImpl(_$Format _value, $Res Function(_$Format) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Format with DiagnosticableTreeMixin implements Format {
  const _$Format();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BeError.format()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'BeError.format'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Format);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() network,
    required TResult Function(String message) auth,
    required TResult Function() format,
  }) {
    return format();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? network,
    TResult? Function(String message)? auth,
    TResult? Function()? format,
  }) {
    return format?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? network,
    TResult Function(String message)? auth,
    TResult Function()? format,
    required TResult orElse(),
  }) {
    if (format != null) {
      return format();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Network value) network,
    required TResult Function(Auth value) auth,
    required TResult Function(Format value) format,
  }) {
    return format(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Network value)? network,
    TResult? Function(Auth value)? auth,
    TResult? Function(Format value)? format,
  }) {
    return format?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Network value)? network,
    TResult Function(Auth value)? auth,
    TResult Function(Format value)? format,
    required TResult orElse(),
  }) {
    if (format != null) {
      return format(this);
    }
    return orElse();
  }
}

abstract class Format implements BeError {
  const factory Format() = _$Format;
}

/// @nodoc
mixin _$ErrorResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String content) $default, {
    required TResult Function(BeError err) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String content)? $default, {
    TResult? Function(BeError err)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String content)? $default, {
    TResult Function(BeError err)? error,
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
    TResult? Function(_ErrorResult value)? $default, {
    TResult? Function(_ErrorResultErr value)? error,
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
      _$ErrorResultCopyWithImpl<$Res, ErrorResult>;
}

/// @nodoc
class _$ErrorResultCopyWithImpl<$Res, $Val extends ErrorResult>
    implements $ErrorResultCopyWith<$Res> {
  _$ErrorResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_ErrorResultCopyWith<$Res> {
  factory _$$_ErrorResultCopyWith(
          _$_ErrorResult value, $Res Function(_$_ErrorResult) then) =
      __$$_ErrorResultCopyWithImpl<$Res>;
  @useResult
  $Res call({String content});
}

/// @nodoc
class __$$_ErrorResultCopyWithImpl<$Res>
    extends _$ErrorResultCopyWithImpl<$Res, _$_ErrorResult>
    implements _$$_ErrorResultCopyWith<$Res> {
  __$$_ErrorResultCopyWithImpl(
      _$_ErrorResult _value, $Res Function(_$_ErrorResult) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
  }) {
    return _then(_$_ErrorResult(
      null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ErrorResult with DiagnosticableTreeMixin implements _ErrorResult {
  const _$_ErrorResult(this.content);

  @override
  final String content;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ErrorResult(content: $content)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ErrorResult'))
      ..add(DiagnosticsProperty('content', content));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ErrorResult &&
            (identical(other.content, content) || other.content == content));
  }

  @override
  int get hashCode => Object.hash(runtimeType, content);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ErrorResultCopyWith<_$_ErrorResult> get copyWith =>
      __$$_ErrorResultCopyWithImpl<_$_ErrorResult>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String content) $default, {
    required TResult Function(BeError err) error,
  }) {
    return $default(content);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String content)? $default, {
    TResult? Function(BeError err)? error,
  }) {
    return $default?.call(content);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String content)? $default, {
    TResult Function(BeError err)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(content);
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
    TResult? Function(_ErrorResult value)? $default, {
    TResult? Function(_ErrorResultErr value)? error,
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
  const factory _ErrorResult(final String content) = _$_ErrorResult;

  String get content;
  @JsonKey(ignore: true)
  _$$_ErrorResultCopyWith<_$_ErrorResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ErrorResultErrCopyWith<$Res> {
  factory _$$_ErrorResultErrCopyWith(
          _$_ErrorResultErr value, $Res Function(_$_ErrorResultErr) then) =
      __$$_ErrorResultErrCopyWithImpl<$Res>;
  @useResult
  $Res call({BeError err});

  $BeErrorCopyWith<$Res> get err;
}

/// @nodoc
class __$$_ErrorResultErrCopyWithImpl<$Res>
    extends _$ErrorResultCopyWithImpl<$Res, _$_ErrorResultErr>
    implements _$$_ErrorResultErrCopyWith<$Res> {
  __$$_ErrorResultErrCopyWithImpl(
      _$_ErrorResultErr _value, $Res Function(_$_ErrorResultErr) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? err = null,
  }) {
    return _then(_$_ErrorResultErr(
      null == err
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as BeError,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $BeErrorCopyWith<$Res> get err {
    return $BeErrorCopyWith<$Res>(_value.err, (value) {
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
  final BeError err;

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
        (other.runtimeType == runtimeType &&
            other is _$_ErrorResultErr &&
            (identical(other.err, err) || other.err == err));
  }

  @override
  int get hashCode => Object.hash(runtimeType, err);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ErrorResultErrCopyWith<_$_ErrorResultErr> get copyWith =>
      __$$_ErrorResultErrCopyWithImpl<_$_ErrorResultErr>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String content) $default, {
    required TResult Function(BeError err) error,
  }) {
    return error(err);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String content)? $default, {
    TResult? Function(BeError err)? error,
  }) {
    return error?.call(err);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String content)? $default, {
    TResult Function(BeError err)? error,
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
    TResult? Function(_ErrorResult value)? $default, {
    TResult? Function(_ErrorResultErr value)? error,
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
  const factory _ErrorResultErr(final BeError err) = _$_ErrorResultErr;

  BeError get err;
  @JsonKey(ignore: true)
  _$$_ErrorResultErrCopyWith<_$_ErrorResultErr> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UserInfoResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(UserInfo info) $default, {
    required TResult Function(BeError err) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(UserInfo info)? $default, {
    TResult? Function(BeError err)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(UserInfo info)? $default, {
    TResult Function(BeError err)? error,
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
    TResult? Function(_UserInfo value)? $default, {
    TResult? Function(_UserInfoErr value)? error,
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
      _$UserInfoResultCopyWithImpl<$Res, UserInfoResult>;
}

/// @nodoc
class _$UserInfoResultCopyWithImpl<$Res, $Val extends UserInfoResult>
    implements $UserInfoResultCopyWith<$Res> {
  _$UserInfoResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_UserInfoCopyWith<$Res> {
  factory _$$_UserInfoCopyWith(
          _$_UserInfo value, $Res Function(_$_UserInfo) then) =
      __$$_UserInfoCopyWithImpl<$Res>;
  @useResult
  $Res call({UserInfo info});
}

/// @nodoc
class __$$_UserInfoCopyWithImpl<$Res>
    extends _$UserInfoResultCopyWithImpl<$Res, _$_UserInfo>
    implements _$$_UserInfoCopyWith<$Res> {
  __$$_UserInfoCopyWithImpl(
      _$_UserInfo _value, $Res Function(_$_UserInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? info = null,
  }) {
    return _then(_$_UserInfo(
      null == info
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
        (other.runtimeType == runtimeType &&
            other is _$_UserInfo &&
            (identical(other.info, info) || other.info == info));
  }

  @override
  int get hashCode => Object.hash(runtimeType, info);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserInfoCopyWith<_$_UserInfo> get copyWith =>
      __$$_UserInfoCopyWithImpl<_$_UserInfo>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(UserInfo info) $default, {
    required TResult Function(BeError err) error,
  }) {
    return $default(info);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(UserInfo info)? $default, {
    TResult? Function(BeError err)? error,
  }) {
    return $default?.call(info);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(UserInfo info)? $default, {
    TResult Function(BeError err)? error,
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
    TResult? Function(_UserInfo value)? $default, {
    TResult? Function(_UserInfoErr value)? error,
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
  const factory _UserInfo(final UserInfo info) = _$_UserInfo;

  UserInfo get info;
  @JsonKey(ignore: true)
  _$$_UserInfoCopyWith<_$_UserInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_UserInfoErrCopyWith<$Res> {
  factory _$$_UserInfoErrCopyWith(
          _$_UserInfoErr value, $Res Function(_$_UserInfoErr) then) =
      __$$_UserInfoErrCopyWithImpl<$Res>;
  @useResult
  $Res call({BeError err});

  $BeErrorCopyWith<$Res> get err;
}

/// @nodoc
class __$$_UserInfoErrCopyWithImpl<$Res>
    extends _$UserInfoResultCopyWithImpl<$Res, _$_UserInfoErr>
    implements _$$_UserInfoErrCopyWith<$Res> {
  __$$_UserInfoErrCopyWithImpl(
      _$_UserInfoErr _value, $Res Function(_$_UserInfoErr) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? err = null,
  }) {
    return _then(_$_UserInfoErr(
      null == err
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as BeError,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $BeErrorCopyWith<$Res> get err {
    return $BeErrorCopyWith<$Res>(_value.err, (value) {
      return _then(_value.copyWith(err: value));
    });
  }
}

/// @nodoc

class _$_UserInfoErr with DiagnosticableTreeMixin implements _UserInfoErr {
  const _$_UserInfoErr(this.err);

  @override
  final BeError err;

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
        (other.runtimeType == runtimeType &&
            other is _$_UserInfoErr &&
            (identical(other.err, err) || other.err == err));
  }

  @override
  int get hashCode => Object.hash(runtimeType, err);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserInfoErrCopyWith<_$_UserInfoErr> get copyWith =>
      __$$_UserInfoErrCopyWithImpl<_$_UserInfoErr>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(UserInfo info) $default, {
    required TResult Function(BeError err) error,
  }) {
    return error(err);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(UserInfo info)? $default, {
    TResult? Function(BeError err)? error,
  }) {
    return error?.call(err);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(UserInfo info)? $default, {
    TResult Function(BeError err)? error,
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
    TResult? Function(_UserInfo value)? $default, {
    TResult? Function(_UserInfoErr value)? error,
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
  const factory _UserInfoErr(final BeError err) = _$_UserInfoErr;

  BeError get err;
  @JsonKey(ignore: true)
  _$$_UserInfoErrCopyWith<_$_UserInfoErr> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BeTwoFactorEnabledResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(bool enabled) $default, {
    required TResult Function(BeError err) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(bool enabled)? $default, {
    TResult? Function(BeError err)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(bool enabled)? $default, {
    TResult Function(BeError err)? error,
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
    TResult? Function(_BeTwoFactorEnabledResult value)? $default, {
    TResult? Function(_BeTwoFactorEnabledResultErr value)? error,
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
      _$BeTwoFactorEnabledResultCopyWithImpl<$Res, BeTwoFactorEnabledResult>;
}

/// @nodoc
class _$BeTwoFactorEnabledResultCopyWithImpl<$Res,
        $Val extends BeTwoFactorEnabledResult>
    implements $BeTwoFactorEnabledResultCopyWith<$Res> {
  _$BeTwoFactorEnabledResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_BeTwoFactorEnabledResultCopyWith<$Res> {
  factory _$$_BeTwoFactorEnabledResultCopyWith(
          _$_BeTwoFactorEnabledResult value,
          $Res Function(_$_BeTwoFactorEnabledResult) then) =
      __$$_BeTwoFactorEnabledResultCopyWithImpl<$Res>;
  @useResult
  $Res call({bool enabled});
}

/// @nodoc
class __$$_BeTwoFactorEnabledResultCopyWithImpl<$Res>
    extends _$BeTwoFactorEnabledResultCopyWithImpl<$Res,
        _$_BeTwoFactorEnabledResult>
    implements _$$_BeTwoFactorEnabledResultCopyWith<$Res> {
  __$$_BeTwoFactorEnabledResultCopyWithImpl(_$_BeTwoFactorEnabledResult _value,
      $Res Function(_$_BeTwoFactorEnabledResult) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enabled = null,
  }) {
    return _then(_$_BeTwoFactorEnabledResult(
      null == enabled
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
        (other.runtimeType == runtimeType &&
            other is _$_BeTwoFactorEnabledResult &&
            (identical(other.enabled, enabled) || other.enabled == enabled));
  }

  @override
  int get hashCode => Object.hash(runtimeType, enabled);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BeTwoFactorEnabledResultCopyWith<_$_BeTwoFactorEnabledResult>
      get copyWith => __$$_BeTwoFactorEnabledResultCopyWithImpl<
          _$_BeTwoFactorEnabledResult>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(bool enabled) $default, {
    required TResult Function(BeError err) error,
  }) {
    return $default(enabled);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(bool enabled)? $default, {
    TResult? Function(BeError err)? error,
  }) {
    return $default?.call(enabled);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(bool enabled)? $default, {
    TResult Function(BeError err)? error,
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
    TResult? Function(_BeTwoFactorEnabledResult value)? $default, {
    TResult? Function(_BeTwoFactorEnabledResultErr value)? error,
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
  const factory _BeTwoFactorEnabledResult(final bool enabled) =
      _$_BeTwoFactorEnabledResult;

  bool get enabled;
  @JsonKey(ignore: true)
  _$$_BeTwoFactorEnabledResultCopyWith<_$_BeTwoFactorEnabledResult>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_BeTwoFactorEnabledResultErrCopyWith<$Res> {
  factory _$$_BeTwoFactorEnabledResultErrCopyWith(
          _$_BeTwoFactorEnabledResultErr value,
          $Res Function(_$_BeTwoFactorEnabledResultErr) then) =
      __$$_BeTwoFactorEnabledResultErrCopyWithImpl<$Res>;
  @useResult
  $Res call({BeError err});

  $BeErrorCopyWith<$Res> get err;
}

/// @nodoc
class __$$_BeTwoFactorEnabledResultErrCopyWithImpl<$Res>
    extends _$BeTwoFactorEnabledResultCopyWithImpl<$Res,
        _$_BeTwoFactorEnabledResultErr>
    implements _$$_BeTwoFactorEnabledResultErrCopyWith<$Res> {
  __$$_BeTwoFactorEnabledResultErrCopyWithImpl(
      _$_BeTwoFactorEnabledResultErr _value,
      $Res Function(_$_BeTwoFactorEnabledResultErr) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? err = null,
  }) {
    return _then(_$_BeTwoFactorEnabledResultErr(
      null == err
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as BeError,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $BeErrorCopyWith<$Res> get err {
    return $BeErrorCopyWith<$Res>(_value.err, (value) {
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
  final BeError err;

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
        (other.runtimeType == runtimeType &&
            other is _$_BeTwoFactorEnabledResultErr &&
            (identical(other.err, err) || other.err == err));
  }

  @override
  int get hashCode => Object.hash(runtimeType, err);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BeTwoFactorEnabledResultErrCopyWith<_$_BeTwoFactorEnabledResultErr>
      get copyWith => __$$_BeTwoFactorEnabledResultErrCopyWithImpl<
          _$_BeTwoFactorEnabledResultErr>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(bool enabled) $default, {
    required TResult Function(BeError err) error,
  }) {
    return error(err);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(bool enabled)? $default, {
    TResult? Function(BeError err)? error,
  }) {
    return error?.call(err);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(bool enabled)? $default, {
    TResult Function(BeError err)? error,
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
    TResult? Function(_BeTwoFactorEnabledResult value)? $default, {
    TResult? Function(_BeTwoFactorEnabledResultErr value)? error,
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
  const factory _BeTwoFactorEnabledResultErr(final BeError err) =
      _$_BeTwoFactorEnabledResultErr;

  BeError get err;
  @JsonKey(ignore: true)
  _$$_BeTwoFactorEnabledResultErrCopyWith<_$_BeTwoFactorEnabledResultErr>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BeVersionResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(int serverVersion, int clientVersionDeployed) $default, {
    required TResult Function(BeError err) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(int serverVersion, int clientVersionDeployed)? $default, {
    TResult? Function(BeError err)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(int serverVersion, int clientVersionDeployed)? $default, {
    TResult Function(BeError err)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_BeVersionResult value) $default, {
    required TResult Function(_BeVersionResultErr value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_BeVersionResult value)? $default, {
    TResult? Function(_BeVersionResultErr value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BeVersionResult value)? $default, {
    TResult Function(_BeVersionResultErr value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BeVersionResultCopyWith<$Res> {
  factory $BeVersionResultCopyWith(
          BeVersionResult value, $Res Function(BeVersionResult) then) =
      _$BeVersionResultCopyWithImpl<$Res, BeVersionResult>;
}

/// @nodoc
class _$BeVersionResultCopyWithImpl<$Res, $Val extends BeVersionResult>
    implements $BeVersionResultCopyWith<$Res> {
  _$BeVersionResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_BeVersionResultCopyWith<$Res> {
  factory _$$_BeVersionResultCopyWith(
          _$_BeVersionResult value, $Res Function(_$_BeVersionResult) then) =
      __$$_BeVersionResultCopyWithImpl<$Res>;
  @useResult
  $Res call({int serverVersion, int clientVersionDeployed});
}

/// @nodoc
class __$$_BeVersionResultCopyWithImpl<$Res>
    extends _$BeVersionResultCopyWithImpl<$Res, _$_BeVersionResult>
    implements _$$_BeVersionResultCopyWith<$Res> {
  __$$_BeVersionResultCopyWithImpl(
      _$_BeVersionResult _value, $Res Function(_$_BeVersionResult) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serverVersion = null,
    Object? clientVersionDeployed = null,
  }) {
    return _then(_$_BeVersionResult(
      null == serverVersion
          ? _value.serverVersion
          : serverVersion // ignore: cast_nullable_to_non_nullable
              as int,
      null == clientVersionDeployed
          ? _value.clientVersionDeployed
          : clientVersionDeployed // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_BeVersionResult
    with DiagnosticableTreeMixin
    implements _BeVersionResult {
  const _$_BeVersionResult(this.serverVersion, this.clientVersionDeployed);

  @override
  final int serverVersion;
  @override
  final int clientVersionDeployed;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BeVersionResult(serverVersion: $serverVersion, clientVersionDeployed: $clientVersionDeployed)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BeVersionResult'))
      ..add(DiagnosticsProperty('serverVersion', serverVersion))
      ..add(
          DiagnosticsProperty('clientVersionDeployed', clientVersionDeployed));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BeVersionResult &&
            (identical(other.serverVersion, serverVersion) ||
                other.serverVersion == serverVersion) &&
            (identical(other.clientVersionDeployed, clientVersionDeployed) ||
                other.clientVersionDeployed == clientVersionDeployed));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, serverVersion, clientVersionDeployed);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BeVersionResultCopyWith<_$_BeVersionResult> get copyWith =>
      __$$_BeVersionResultCopyWithImpl<_$_BeVersionResult>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(int serverVersion, int clientVersionDeployed) $default, {
    required TResult Function(BeError err) error,
  }) {
    return $default(serverVersion, clientVersionDeployed);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(int serverVersion, int clientVersionDeployed)? $default, {
    TResult? Function(BeError err)? error,
  }) {
    return $default?.call(serverVersion, clientVersionDeployed);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(int serverVersion, int clientVersionDeployed)? $default, {
    TResult Function(BeError err)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(serverVersion, clientVersionDeployed);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_BeVersionResult value) $default, {
    required TResult Function(_BeVersionResultErr value) error,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_BeVersionResult value)? $default, {
    TResult? Function(_BeVersionResultErr value)? error,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BeVersionResult value)? $default, {
    TResult Function(_BeVersionResultErr value)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _BeVersionResult implements BeVersionResult {
  const factory _BeVersionResult(
          final int serverVersion, final int clientVersionDeployed) =
      _$_BeVersionResult;

  int get serverVersion;
  int get clientVersionDeployed;
  @JsonKey(ignore: true)
  _$$_BeVersionResultCopyWith<_$_BeVersionResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_BeVersionResultErrCopyWith<$Res> {
  factory _$$_BeVersionResultErrCopyWith(_$_BeVersionResultErr value,
          $Res Function(_$_BeVersionResultErr) then) =
      __$$_BeVersionResultErrCopyWithImpl<$Res>;
  @useResult
  $Res call({BeError err});

  $BeErrorCopyWith<$Res> get err;
}

/// @nodoc
class __$$_BeVersionResultErrCopyWithImpl<$Res>
    extends _$BeVersionResultCopyWithImpl<$Res, _$_BeVersionResultErr>
    implements _$$_BeVersionResultErrCopyWith<$Res> {
  __$$_BeVersionResultErrCopyWithImpl(
      _$_BeVersionResultErr _value, $Res Function(_$_BeVersionResultErr) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? err = null,
  }) {
    return _then(_$_BeVersionResultErr(
      null == err
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as BeError,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $BeErrorCopyWith<$Res> get err {
    return $BeErrorCopyWith<$Res>(_value.err, (value) {
      return _then(_value.copyWith(err: value));
    });
  }
}

/// @nodoc

class _$_BeVersionResultErr
    with DiagnosticableTreeMixin
    implements _BeVersionResultErr {
  const _$_BeVersionResultErr(this.err);

  @override
  final BeError err;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BeVersionResult.error(err: $err)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BeVersionResult.error'))
      ..add(DiagnosticsProperty('err', err));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BeVersionResultErr &&
            (identical(other.err, err) || other.err == err));
  }

  @override
  int get hashCode => Object.hash(runtimeType, err);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BeVersionResultErrCopyWith<_$_BeVersionResultErr> get copyWith =>
      __$$_BeVersionResultErrCopyWithImpl<_$_BeVersionResultErr>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(int serverVersion, int clientVersionDeployed) $default, {
    required TResult Function(BeError err) error,
  }) {
    return error(err);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(int serverVersion, int clientVersionDeployed)? $default, {
    TResult? Function(BeError err)? error,
  }) {
    return error?.call(err);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(int serverVersion, int clientVersionDeployed)? $default, {
    TResult Function(BeError err)? error,
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
    TResult Function(_BeVersionResult value) $default, {
    required TResult Function(_BeVersionResultErr value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_BeVersionResult value)? $default, {
    TResult? Function(_BeVersionResultErr value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BeVersionResult value)? $default, {
    TResult Function(_BeVersionResultErr value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _BeVersionResultErr implements BeVersionResult {
  const factory _BeVersionResultErr(final BeError err) = _$_BeVersionResultErr;

  BeError get err;
  @JsonKey(ignore: true)
  _$$_BeVersionResultErrCopyWith<_$_BeVersionResultErr> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BeApiKeyResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(BeApiKey apikey) $default, {
    required TResult Function(BeError err) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(BeApiKey apikey)? $default, {
    TResult? Function(BeError err)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(BeApiKey apikey)? $default, {
    TResult Function(BeError err)? error,
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
    TResult? Function(_BeApiKeyResult value)? $default, {
    TResult? Function(_BeApiKeyResultErr value)? error,
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
      _$BeApiKeyResultCopyWithImpl<$Res, BeApiKeyResult>;
}

/// @nodoc
class _$BeApiKeyResultCopyWithImpl<$Res, $Val extends BeApiKeyResult>
    implements $BeApiKeyResultCopyWith<$Res> {
  _$BeApiKeyResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_BeApiKeyResultCopyWith<$Res> {
  factory _$$_BeApiKeyResultCopyWith(
          _$_BeApiKeyResult value, $Res Function(_$_BeApiKeyResult) then) =
      __$$_BeApiKeyResultCopyWithImpl<$Res>;
  @useResult
  $Res call({BeApiKey apikey});
}

/// @nodoc
class __$$_BeApiKeyResultCopyWithImpl<$Res>
    extends _$BeApiKeyResultCopyWithImpl<$Res, _$_BeApiKeyResult>
    implements _$$_BeApiKeyResultCopyWith<$Res> {
  __$$_BeApiKeyResultCopyWithImpl(
      _$_BeApiKeyResult _value, $Res Function(_$_BeApiKeyResult) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? apikey = null,
  }) {
    return _then(_$_BeApiKeyResult(
      null == apikey
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
        (other.runtimeType == runtimeType &&
            other is _$_BeApiKeyResult &&
            (identical(other.apikey, apikey) || other.apikey == apikey));
  }

  @override
  int get hashCode => Object.hash(runtimeType, apikey);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BeApiKeyResultCopyWith<_$_BeApiKeyResult> get copyWith =>
      __$$_BeApiKeyResultCopyWithImpl<_$_BeApiKeyResult>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(BeApiKey apikey) $default, {
    required TResult Function(BeError err) error,
  }) {
    return $default(apikey);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(BeApiKey apikey)? $default, {
    TResult? Function(BeError err)? error,
  }) {
    return $default?.call(apikey);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(BeApiKey apikey)? $default, {
    TResult Function(BeError err)? error,
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
    TResult? Function(_BeApiKeyResult value)? $default, {
    TResult? Function(_BeApiKeyResultErr value)? error,
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
  const factory _BeApiKeyResult(final BeApiKey apikey) = _$_BeApiKeyResult;

  BeApiKey get apikey;
  @JsonKey(ignore: true)
  _$$_BeApiKeyResultCopyWith<_$_BeApiKeyResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_BeApiKeyResultErrCopyWith<$Res> {
  factory _$$_BeApiKeyResultErrCopyWith(_$_BeApiKeyResultErr value,
          $Res Function(_$_BeApiKeyResultErr) then) =
      __$$_BeApiKeyResultErrCopyWithImpl<$Res>;
  @useResult
  $Res call({BeError err});

  $BeErrorCopyWith<$Res> get err;
}

/// @nodoc
class __$$_BeApiKeyResultErrCopyWithImpl<$Res>
    extends _$BeApiKeyResultCopyWithImpl<$Res, _$_BeApiKeyResultErr>
    implements _$$_BeApiKeyResultErrCopyWith<$Res> {
  __$$_BeApiKeyResultErrCopyWithImpl(
      _$_BeApiKeyResultErr _value, $Res Function(_$_BeApiKeyResultErr) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? err = null,
  }) {
    return _then(_$_BeApiKeyResultErr(
      null == err
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as BeError,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $BeErrorCopyWith<$Res> get err {
    return $BeErrorCopyWith<$Res>(_value.err, (value) {
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
  final BeError err;

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
        (other.runtimeType == runtimeType &&
            other is _$_BeApiKeyResultErr &&
            (identical(other.err, err) || other.err == err));
  }

  @override
  int get hashCode => Object.hash(runtimeType, err);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BeApiKeyResultErrCopyWith<_$_BeApiKeyResultErr> get copyWith =>
      __$$_BeApiKeyResultErrCopyWithImpl<_$_BeApiKeyResultErr>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(BeApiKey apikey) $default, {
    required TResult Function(BeError err) error,
  }) {
    return error(err);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(BeApiKey apikey)? $default, {
    TResult? Function(BeError err)? error,
  }) {
    return error?.call(err);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(BeApiKey apikey)? $default, {
    TResult Function(BeError err)? error,
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
    TResult? Function(_BeApiKeyResult value)? $default, {
    TResult? Function(_BeApiKeyResultErr value)? error,
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
  const factory _BeApiKeyResultErr(final BeError err) = _$_BeApiKeyResultErr;

  BeError get err;
  @JsonKey(ignore: true)
  _$$_BeApiKeyResultErrCopyWith<_$_BeApiKeyResultErr> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BeApiKeyRequestResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String token) $default, {
    required TResult Function(BeError err) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String token)? $default, {
    TResult? Function(BeError err)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String token)? $default, {
    TResult Function(BeError err)? error,
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
    TResult? Function(_BeApiKeyRequestResult value)? $default, {
    TResult? Function(_BeApiKeyRequestResulttErr value)? error,
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
      _$BeApiKeyRequestResultCopyWithImpl<$Res, BeApiKeyRequestResult>;
}

/// @nodoc
class _$BeApiKeyRequestResultCopyWithImpl<$Res,
        $Val extends BeApiKeyRequestResult>
    implements $BeApiKeyRequestResultCopyWith<$Res> {
  _$BeApiKeyRequestResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_BeApiKeyRequestResultCopyWith<$Res> {
  factory _$$_BeApiKeyRequestResultCopyWith(_$_BeApiKeyRequestResult value,
          $Res Function(_$_BeApiKeyRequestResult) then) =
      __$$_BeApiKeyRequestResultCopyWithImpl<$Res>;
  @useResult
  $Res call({String token});
}

/// @nodoc
class __$$_BeApiKeyRequestResultCopyWithImpl<$Res>
    extends _$BeApiKeyRequestResultCopyWithImpl<$Res, _$_BeApiKeyRequestResult>
    implements _$$_BeApiKeyRequestResultCopyWith<$Res> {
  __$$_BeApiKeyRequestResultCopyWithImpl(_$_BeApiKeyRequestResult _value,
      $Res Function(_$_BeApiKeyRequestResult) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
  }) {
    return _then(_$_BeApiKeyRequestResult(
      null == token
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
        (other.runtimeType == runtimeType &&
            other is _$_BeApiKeyRequestResult &&
            (identical(other.token, token) || other.token == token));
  }

  @override
  int get hashCode => Object.hash(runtimeType, token);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BeApiKeyRequestResultCopyWith<_$_BeApiKeyRequestResult> get copyWith =>
      __$$_BeApiKeyRequestResultCopyWithImpl<_$_BeApiKeyRequestResult>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String token) $default, {
    required TResult Function(BeError err) error,
  }) {
    return $default(token);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String token)? $default, {
    TResult? Function(BeError err)? error,
  }) {
    return $default?.call(token);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String token)? $default, {
    TResult Function(BeError err)? error,
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
    TResult? Function(_BeApiKeyRequestResult value)? $default, {
    TResult? Function(_BeApiKeyRequestResulttErr value)? error,
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
  const factory _BeApiKeyRequestResult(final String token) =
      _$_BeApiKeyRequestResult;

  String get token;
  @JsonKey(ignore: true)
  _$$_BeApiKeyRequestResultCopyWith<_$_BeApiKeyRequestResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_BeApiKeyRequestResulttErrCopyWith<$Res> {
  factory _$$_BeApiKeyRequestResulttErrCopyWith(
          _$_BeApiKeyRequestResulttErr value,
          $Res Function(_$_BeApiKeyRequestResulttErr) then) =
      __$$_BeApiKeyRequestResulttErrCopyWithImpl<$Res>;
  @useResult
  $Res call({BeError err});

  $BeErrorCopyWith<$Res> get err;
}

/// @nodoc
class __$$_BeApiKeyRequestResulttErrCopyWithImpl<$Res>
    extends _$BeApiKeyRequestResultCopyWithImpl<$Res,
        _$_BeApiKeyRequestResulttErr>
    implements _$$_BeApiKeyRequestResulttErrCopyWith<$Res> {
  __$$_BeApiKeyRequestResulttErrCopyWithImpl(
      _$_BeApiKeyRequestResulttErr _value,
      $Res Function(_$_BeApiKeyRequestResulttErr) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? err = null,
  }) {
    return _then(_$_BeApiKeyRequestResulttErr(
      null == err
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as BeError,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $BeErrorCopyWith<$Res> get err {
    return $BeErrorCopyWith<$Res>(_value.err, (value) {
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
  final BeError err;

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
        (other.runtimeType == runtimeType &&
            other is _$_BeApiKeyRequestResulttErr &&
            (identical(other.err, err) || other.err == err));
  }

  @override
  int get hashCode => Object.hash(runtimeType, err);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BeApiKeyRequestResulttErrCopyWith<_$_BeApiKeyRequestResulttErr>
      get copyWith => __$$_BeApiKeyRequestResulttErrCopyWithImpl<
          _$_BeApiKeyRequestResulttErr>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String token) $default, {
    required TResult Function(BeError err) error,
  }) {
    return error(err);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String token)? $default, {
    TResult? Function(BeError err)? error,
  }) {
    return error?.call(err);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String token)? $default, {
    TResult Function(BeError err)? error,
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
    TResult? Function(_BeApiKeyRequestResult value)? $default, {
    TResult? Function(_BeApiKeyRequestResulttErr value)? error,
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
  const factory _BeApiKeyRequestResulttErr(final BeError err) =
      _$_BeApiKeyRequestResulttErr;

  BeError get err;
  @JsonKey(ignore: true)
  _$$_BeApiKeyRequestResulttErrCopyWith<_$_BeApiKeyRequestResulttErr>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BeKycRequestCreateResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String kycUrl) $default, {
    required TResult Function(BeError err) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String kycUrl)? $default, {
    TResult? Function(BeError err)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String kycUrl)? $default, {
    TResult Function(BeError err)? error,
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
    TResult? Function(_BeKycRequestCreateResult value)? $default, {
    TResult? Function(_BeKycRequestCreateResultErr value)? error,
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
      _$BeKycRequestCreateResultCopyWithImpl<$Res, BeKycRequestCreateResult>;
}

/// @nodoc
class _$BeKycRequestCreateResultCopyWithImpl<$Res,
        $Val extends BeKycRequestCreateResult>
    implements $BeKycRequestCreateResultCopyWith<$Res> {
  _$BeKycRequestCreateResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_BeKycRequestCreateResultCopyWith<$Res> {
  factory _$$_BeKycRequestCreateResultCopyWith(
          _$_BeKycRequestCreateResult value,
          $Res Function(_$_BeKycRequestCreateResult) then) =
      __$$_BeKycRequestCreateResultCopyWithImpl<$Res>;
  @useResult
  $Res call({String kycUrl});
}

/// @nodoc
class __$$_BeKycRequestCreateResultCopyWithImpl<$Res>
    extends _$BeKycRequestCreateResultCopyWithImpl<$Res,
        _$_BeKycRequestCreateResult>
    implements _$$_BeKycRequestCreateResultCopyWith<$Res> {
  __$$_BeKycRequestCreateResultCopyWithImpl(_$_BeKycRequestCreateResult _value,
      $Res Function(_$_BeKycRequestCreateResult) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? kycUrl = null,
  }) {
    return _then(_$_BeKycRequestCreateResult(
      null == kycUrl
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
        (other.runtimeType == runtimeType &&
            other is _$_BeKycRequestCreateResult &&
            (identical(other.kycUrl, kycUrl) || other.kycUrl == kycUrl));
  }

  @override
  int get hashCode => Object.hash(runtimeType, kycUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BeKycRequestCreateResultCopyWith<_$_BeKycRequestCreateResult>
      get copyWith => __$$_BeKycRequestCreateResultCopyWithImpl<
          _$_BeKycRequestCreateResult>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String kycUrl) $default, {
    required TResult Function(BeError err) error,
  }) {
    return $default(kycUrl);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String kycUrl)? $default, {
    TResult? Function(BeError err)? error,
  }) {
    return $default?.call(kycUrl);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String kycUrl)? $default, {
    TResult Function(BeError err)? error,
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
    TResult? Function(_BeKycRequestCreateResult value)? $default, {
    TResult? Function(_BeKycRequestCreateResultErr value)? error,
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
  const factory _BeKycRequestCreateResult(final String kycUrl) =
      _$_BeKycRequestCreateResult;

  String get kycUrl;
  @JsonKey(ignore: true)
  _$$_BeKycRequestCreateResultCopyWith<_$_BeKycRequestCreateResult>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_BeKycRequestCreateResultErrCopyWith<$Res> {
  factory _$$_BeKycRequestCreateResultErrCopyWith(
          _$_BeKycRequestCreateResultErr value,
          $Res Function(_$_BeKycRequestCreateResultErr) then) =
      __$$_BeKycRequestCreateResultErrCopyWithImpl<$Res>;
  @useResult
  $Res call({BeError err});

  $BeErrorCopyWith<$Res> get err;
}

/// @nodoc
class __$$_BeKycRequestCreateResultErrCopyWithImpl<$Res>
    extends _$BeKycRequestCreateResultCopyWithImpl<$Res,
        _$_BeKycRequestCreateResultErr>
    implements _$$_BeKycRequestCreateResultErrCopyWith<$Res> {
  __$$_BeKycRequestCreateResultErrCopyWithImpl(
      _$_BeKycRequestCreateResultErr _value,
      $Res Function(_$_BeKycRequestCreateResultErr) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? err = null,
  }) {
    return _then(_$_BeKycRequestCreateResultErr(
      null == err
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as BeError,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $BeErrorCopyWith<$Res> get err {
    return $BeErrorCopyWith<$Res>(_value.err, (value) {
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
  final BeError err;

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
        (other.runtimeType == runtimeType &&
            other is _$_BeKycRequestCreateResultErr &&
            (identical(other.err, err) || other.err == err));
  }

  @override
  int get hashCode => Object.hash(runtimeType, err);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BeKycRequestCreateResultErrCopyWith<_$_BeKycRequestCreateResultErr>
      get copyWith => __$$_BeKycRequestCreateResultErrCopyWithImpl<
          _$_BeKycRequestCreateResultErr>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String kycUrl) $default, {
    required TResult Function(BeError err) error,
  }) {
    return error(err);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String kycUrl)? $default, {
    TResult? Function(BeError err)? error,
  }) {
    return error?.call(err);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String kycUrl)? $default, {
    TResult Function(BeError err)? error,
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
    TResult? Function(_BeKycRequestCreateResult value)? $default, {
    TResult? Function(_BeKycRequestCreateResultErr value)? error,
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
  const factory _BeKycRequestCreateResultErr(final BeError err) =
      _$_BeKycRequestCreateResultErr;

  BeError get err;
  @JsonKey(ignore: true)
  _$$_BeKycRequestCreateResultErrCopyWith<_$_BeKycRequestCreateResultErr>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BeTwoFactorResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(BeTwoFactor twoFactor) $default, {
    required TResult Function(BeError err) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(BeTwoFactor twoFactor)? $default, {
    TResult? Function(BeError err)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(BeTwoFactor twoFactor)? $default, {
    TResult Function(BeError err)? error,
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
    TResult? Function(_BeTwoFactorResult value)? $default, {
    TResult? Function(_BeTwoFactorResultErr value)? error,
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
      _$BeTwoFactorResultCopyWithImpl<$Res, BeTwoFactorResult>;
}

/// @nodoc
class _$BeTwoFactorResultCopyWithImpl<$Res, $Val extends BeTwoFactorResult>
    implements $BeTwoFactorResultCopyWith<$Res> {
  _$BeTwoFactorResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_BeTwoFactorResultCopyWith<$Res> {
  factory _$$_BeTwoFactorResultCopyWith(_$_BeTwoFactorResult value,
          $Res Function(_$_BeTwoFactorResult) then) =
      __$$_BeTwoFactorResultCopyWithImpl<$Res>;
  @useResult
  $Res call({BeTwoFactor twoFactor});
}

/// @nodoc
class __$$_BeTwoFactorResultCopyWithImpl<$Res>
    extends _$BeTwoFactorResultCopyWithImpl<$Res, _$_BeTwoFactorResult>
    implements _$$_BeTwoFactorResultCopyWith<$Res> {
  __$$_BeTwoFactorResultCopyWithImpl(
      _$_BeTwoFactorResult _value, $Res Function(_$_BeTwoFactorResult) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? twoFactor = null,
  }) {
    return _then(_$_BeTwoFactorResult(
      null == twoFactor
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
        (other.runtimeType == runtimeType &&
            other is _$_BeTwoFactorResult &&
            (identical(other.twoFactor, twoFactor) ||
                other.twoFactor == twoFactor));
  }

  @override
  int get hashCode => Object.hash(runtimeType, twoFactor);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BeTwoFactorResultCopyWith<_$_BeTwoFactorResult> get copyWith =>
      __$$_BeTwoFactorResultCopyWithImpl<_$_BeTwoFactorResult>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(BeTwoFactor twoFactor) $default, {
    required TResult Function(BeError err) error,
  }) {
    return $default(twoFactor);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(BeTwoFactor twoFactor)? $default, {
    TResult? Function(BeError err)? error,
  }) {
    return $default?.call(twoFactor);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(BeTwoFactor twoFactor)? $default, {
    TResult Function(BeError err)? error,
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
    TResult? Function(_BeTwoFactorResult value)? $default, {
    TResult? Function(_BeTwoFactorResultErr value)? error,
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
  const factory _BeTwoFactorResult(final BeTwoFactor twoFactor) =
      _$_BeTwoFactorResult;

  BeTwoFactor get twoFactor;
  @JsonKey(ignore: true)
  _$$_BeTwoFactorResultCopyWith<_$_BeTwoFactorResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_BeTwoFactorResultErrCopyWith<$Res> {
  factory _$$_BeTwoFactorResultErrCopyWith(_$_BeTwoFactorResultErr value,
          $Res Function(_$_BeTwoFactorResultErr) then) =
      __$$_BeTwoFactorResultErrCopyWithImpl<$Res>;
  @useResult
  $Res call({BeError err});

  $BeErrorCopyWith<$Res> get err;
}

/// @nodoc
class __$$_BeTwoFactorResultErrCopyWithImpl<$Res>
    extends _$BeTwoFactorResultCopyWithImpl<$Res, _$_BeTwoFactorResultErr>
    implements _$$_BeTwoFactorResultErrCopyWith<$Res> {
  __$$_BeTwoFactorResultErrCopyWithImpl(_$_BeTwoFactorResultErr _value,
      $Res Function(_$_BeTwoFactorResultErr) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? err = null,
  }) {
    return _then(_$_BeTwoFactorResultErr(
      null == err
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as BeError,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $BeErrorCopyWith<$Res> get err {
    return $BeErrorCopyWith<$Res>(_value.err, (value) {
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
  final BeError err;

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
        (other.runtimeType == runtimeType &&
            other is _$_BeTwoFactorResultErr &&
            (identical(other.err, err) || other.err == err));
  }

  @override
  int get hashCode => Object.hash(runtimeType, err);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BeTwoFactorResultErrCopyWith<_$_BeTwoFactorResultErr> get copyWith =>
      __$$_BeTwoFactorResultErrCopyWithImpl<_$_BeTwoFactorResultErr>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(BeTwoFactor twoFactor) $default, {
    required TResult Function(BeError err) error,
  }) {
    return error(err);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(BeTwoFactor twoFactor)? $default, {
    TResult? Function(BeError err)? error,
  }) {
    return error?.call(err);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(BeTwoFactor twoFactor)? $default, {
    TResult Function(BeError err)? error,
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
    TResult? Function(_BeTwoFactorResult value)? $default, {
    TResult? Function(_BeTwoFactorResultErr value)? error,
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
  const factory _BeTwoFactorResultErr(final BeError err) =
      _$_BeTwoFactorResultErr;

  BeError get err;
  @JsonKey(ignore: true)
  _$$_BeTwoFactorResultErrCopyWith<_$_BeTwoFactorResultErr> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BeAssetResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<BeAsset> assets) $default, {
    required TResult Function(BeError err) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(List<BeAsset> assets)? $default, {
    TResult? Function(BeError err)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<BeAsset> assets)? $default, {
    TResult Function(BeError err)? error,
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
    TResult? Function(_BeAssetResult value)? $default, {
    TResult? Function(_BeAssetResultErr value)? error,
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
      _$BeAssetResultCopyWithImpl<$Res, BeAssetResult>;
}

/// @nodoc
class _$BeAssetResultCopyWithImpl<$Res, $Val extends BeAssetResult>
    implements $BeAssetResultCopyWith<$Res> {
  _$BeAssetResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_BeAssetResultCopyWith<$Res> {
  factory _$$_BeAssetResultCopyWith(
          _$_BeAssetResult value, $Res Function(_$_BeAssetResult) then) =
      __$$_BeAssetResultCopyWithImpl<$Res>;
  @useResult
  $Res call({List<BeAsset> assets});
}

/// @nodoc
class __$$_BeAssetResultCopyWithImpl<$Res>
    extends _$BeAssetResultCopyWithImpl<$Res, _$_BeAssetResult>
    implements _$$_BeAssetResultCopyWith<$Res> {
  __$$_BeAssetResultCopyWithImpl(
      _$_BeAssetResult _value, $Res Function(_$_BeAssetResult) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? assets = null,
  }) {
    return _then(_$_BeAssetResult(
      null == assets
          ? _value._assets
          : assets // ignore: cast_nullable_to_non_nullable
              as List<BeAsset>,
    ));
  }
}

/// @nodoc

class _$_BeAssetResult with DiagnosticableTreeMixin implements _BeAssetResult {
  const _$_BeAssetResult(final List<BeAsset> assets) : _assets = assets;

  final List<BeAsset> _assets;
  @override
  List<BeAsset> get assets {
    if (_assets is EqualUnmodifiableListView) return _assets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_assets);
  }

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
        (other.runtimeType == runtimeType &&
            other is _$_BeAssetResult &&
            const DeepCollectionEquality().equals(other._assets, _assets));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_assets));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BeAssetResultCopyWith<_$_BeAssetResult> get copyWith =>
      __$$_BeAssetResultCopyWithImpl<_$_BeAssetResult>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<BeAsset> assets) $default, {
    required TResult Function(BeError err) error,
  }) {
    return $default(assets);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(List<BeAsset> assets)? $default, {
    TResult? Function(BeError err)? error,
  }) {
    return $default?.call(assets);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<BeAsset> assets)? $default, {
    TResult Function(BeError err)? error,
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
    TResult? Function(_BeAssetResult value)? $default, {
    TResult? Function(_BeAssetResultErr value)? error,
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
  const factory _BeAssetResult(final List<BeAsset> assets) = _$_BeAssetResult;

  List<BeAsset> get assets;
  @JsonKey(ignore: true)
  _$$_BeAssetResultCopyWith<_$_BeAssetResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_BeAssetResultErrCopyWith<$Res> {
  factory _$$_BeAssetResultErrCopyWith(
          _$_BeAssetResultErr value, $Res Function(_$_BeAssetResultErr) then) =
      __$$_BeAssetResultErrCopyWithImpl<$Res>;
  @useResult
  $Res call({BeError err});

  $BeErrorCopyWith<$Res> get err;
}

/// @nodoc
class __$$_BeAssetResultErrCopyWithImpl<$Res>
    extends _$BeAssetResultCopyWithImpl<$Res, _$_BeAssetResultErr>
    implements _$$_BeAssetResultErrCopyWith<$Res> {
  __$$_BeAssetResultErrCopyWithImpl(
      _$_BeAssetResultErr _value, $Res Function(_$_BeAssetResultErr) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? err = null,
  }) {
    return _then(_$_BeAssetResultErr(
      null == err
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as BeError,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $BeErrorCopyWith<$Res> get err {
    return $BeErrorCopyWith<$Res>(_value.err, (value) {
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
  final BeError err;

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
        (other.runtimeType == runtimeType &&
            other is _$_BeAssetResultErr &&
            (identical(other.err, err) || other.err == err));
  }

  @override
  int get hashCode => Object.hash(runtimeType, err);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BeAssetResultErrCopyWith<_$_BeAssetResultErr> get copyWith =>
      __$$_BeAssetResultErrCopyWithImpl<_$_BeAssetResultErr>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<BeAsset> assets) $default, {
    required TResult Function(BeError err) error,
  }) {
    return error(err);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(List<BeAsset> assets)? $default, {
    TResult? Function(BeError err)? error,
  }) {
    return error?.call(err);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<BeAsset> assets)? $default, {
    TResult Function(BeError err)? error,
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
    TResult? Function(_BeAssetResult value)? $default, {
    TResult? Function(_BeAssetResultErr value)? error,
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
  const factory _BeAssetResultErr(final BeError err) = _$_BeAssetResultErr;

  BeError get err;
  @JsonKey(ignore: true)
  _$$_BeAssetResultErrCopyWith<_$_BeAssetResultErr> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BeMarketResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<BeMarket> markets) $default, {
    required TResult Function(BeError err) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(List<BeMarket> markets)? $default, {
    TResult? Function(BeError err)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<BeMarket> markets)? $default, {
    TResult Function(BeError err)? error,
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
    TResult? Function(_BeMarketResult value)? $default, {
    TResult? Function(_BeMarketResultErr value)? error,
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
      _$BeMarketResultCopyWithImpl<$Res, BeMarketResult>;
}

/// @nodoc
class _$BeMarketResultCopyWithImpl<$Res, $Val extends BeMarketResult>
    implements $BeMarketResultCopyWith<$Res> {
  _$BeMarketResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_BeMarketResultCopyWith<$Res> {
  factory _$$_BeMarketResultCopyWith(
          _$_BeMarketResult value, $Res Function(_$_BeMarketResult) then) =
      __$$_BeMarketResultCopyWithImpl<$Res>;
  @useResult
  $Res call({List<BeMarket> markets});
}

/// @nodoc
class __$$_BeMarketResultCopyWithImpl<$Res>
    extends _$BeMarketResultCopyWithImpl<$Res, _$_BeMarketResult>
    implements _$$_BeMarketResultCopyWith<$Res> {
  __$$_BeMarketResultCopyWithImpl(
      _$_BeMarketResult _value, $Res Function(_$_BeMarketResult) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? markets = null,
  }) {
    return _then(_$_BeMarketResult(
      null == markets
          ? _value._markets
          : markets // ignore: cast_nullable_to_non_nullable
              as List<BeMarket>,
    ));
  }
}

/// @nodoc

class _$_BeMarketResult
    with DiagnosticableTreeMixin
    implements _BeMarketResult {
  const _$_BeMarketResult(final List<BeMarket> markets) : _markets = markets;

  final List<BeMarket> _markets;
  @override
  List<BeMarket> get markets {
    if (_markets is EqualUnmodifiableListView) return _markets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_markets);
  }

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
        (other.runtimeType == runtimeType &&
            other is _$_BeMarketResult &&
            const DeepCollectionEquality().equals(other._markets, _markets));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_markets));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BeMarketResultCopyWith<_$_BeMarketResult> get copyWith =>
      __$$_BeMarketResultCopyWithImpl<_$_BeMarketResult>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<BeMarket> markets) $default, {
    required TResult Function(BeError err) error,
  }) {
    return $default(markets);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(List<BeMarket> markets)? $default, {
    TResult? Function(BeError err)? error,
  }) {
    return $default?.call(markets);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<BeMarket> markets)? $default, {
    TResult Function(BeError err)? error,
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
    TResult? Function(_BeMarketResult value)? $default, {
    TResult? Function(_BeMarketResultErr value)? error,
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
  const factory _BeMarketResult(final List<BeMarket> markets) =
      _$_BeMarketResult;

  List<BeMarket> get markets;
  @JsonKey(ignore: true)
  _$$_BeMarketResultCopyWith<_$_BeMarketResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_BeMarketResultErrCopyWith<$Res> {
  factory _$$_BeMarketResultErrCopyWith(_$_BeMarketResultErr value,
          $Res Function(_$_BeMarketResultErr) then) =
      __$$_BeMarketResultErrCopyWithImpl<$Res>;
  @useResult
  $Res call({BeError err});

  $BeErrorCopyWith<$Res> get err;
}

/// @nodoc
class __$$_BeMarketResultErrCopyWithImpl<$Res>
    extends _$BeMarketResultCopyWithImpl<$Res, _$_BeMarketResultErr>
    implements _$$_BeMarketResultErrCopyWith<$Res> {
  __$$_BeMarketResultErrCopyWithImpl(
      _$_BeMarketResultErr _value, $Res Function(_$_BeMarketResultErr) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? err = null,
  }) {
    return _then(_$_BeMarketResultErr(
      null == err
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as BeError,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $BeErrorCopyWith<$Res> get err {
    return $BeErrorCopyWith<$Res>(_value.err, (value) {
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
  final BeError err;

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
        (other.runtimeType == runtimeType &&
            other is _$_BeMarketResultErr &&
            (identical(other.err, err) || other.err == err));
  }

  @override
  int get hashCode => Object.hash(runtimeType, err);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BeMarketResultErrCopyWith<_$_BeMarketResultErr> get copyWith =>
      __$$_BeMarketResultErrCopyWithImpl<_$_BeMarketResultErr>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<BeMarket> markets) $default, {
    required TResult Function(BeError err) error,
  }) {
    return error(err);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(List<BeMarket> markets)? $default, {
    TResult? Function(BeError err)? error,
  }) {
    return error?.call(err);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<BeMarket> markets)? $default, {
    TResult Function(BeError err)? error,
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
    TResult? Function(_BeMarketResult value)? $default, {
    TResult? Function(_BeMarketResultErr value)? error,
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
  const factory _BeMarketResultErr(final BeError err) = _$_BeMarketResultErr;

  BeError get err;
  @JsonKey(ignore: true)
  _$$_BeMarketResultErrCopyWith<_$_BeMarketResultErr> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BeOrderbookResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(BeOrderbook orderbook) $default, {
    required TResult Function(BeError err) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(BeOrderbook orderbook)? $default, {
    TResult? Function(BeError err)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(BeOrderbook orderbook)? $default, {
    TResult Function(BeError err)? error,
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
    TResult? Function(_BeOrderbookResult value)? $default, {
    TResult? Function(_BeOrderbookResultErr value)? error,
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
      _$BeOrderbookResultCopyWithImpl<$Res, BeOrderbookResult>;
}

/// @nodoc
class _$BeOrderbookResultCopyWithImpl<$Res, $Val extends BeOrderbookResult>
    implements $BeOrderbookResultCopyWith<$Res> {
  _$BeOrderbookResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_BeOrderbookResultCopyWith<$Res> {
  factory _$$_BeOrderbookResultCopyWith(_$_BeOrderbookResult value,
          $Res Function(_$_BeOrderbookResult) then) =
      __$$_BeOrderbookResultCopyWithImpl<$Res>;
  @useResult
  $Res call({BeOrderbook orderbook});
}

/// @nodoc
class __$$_BeOrderbookResultCopyWithImpl<$Res>
    extends _$BeOrderbookResultCopyWithImpl<$Res, _$_BeOrderbookResult>
    implements _$$_BeOrderbookResultCopyWith<$Res> {
  __$$_BeOrderbookResultCopyWithImpl(
      _$_BeOrderbookResult _value, $Res Function(_$_BeOrderbookResult) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderbook = null,
  }) {
    return _then(_$_BeOrderbookResult(
      null == orderbook
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
        (other.runtimeType == runtimeType &&
            other is _$_BeOrderbookResult &&
            (identical(other.orderbook, orderbook) ||
                other.orderbook == orderbook));
  }

  @override
  int get hashCode => Object.hash(runtimeType, orderbook);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BeOrderbookResultCopyWith<_$_BeOrderbookResult> get copyWith =>
      __$$_BeOrderbookResultCopyWithImpl<_$_BeOrderbookResult>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(BeOrderbook orderbook) $default, {
    required TResult Function(BeError err) error,
  }) {
    return $default(orderbook);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(BeOrderbook orderbook)? $default, {
    TResult? Function(BeError err)? error,
  }) {
    return $default?.call(orderbook);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(BeOrderbook orderbook)? $default, {
    TResult Function(BeError err)? error,
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
    TResult? Function(_BeOrderbookResult value)? $default, {
    TResult? Function(_BeOrderbookResultErr value)? error,
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
  const factory _BeOrderbookResult(final BeOrderbook orderbook) =
      _$_BeOrderbookResult;

  BeOrderbook get orderbook;
  @JsonKey(ignore: true)
  _$$_BeOrderbookResultCopyWith<_$_BeOrderbookResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_BeOrderbookResultErrCopyWith<$Res> {
  factory _$$_BeOrderbookResultErrCopyWith(_$_BeOrderbookResultErr value,
          $Res Function(_$_BeOrderbookResultErr) then) =
      __$$_BeOrderbookResultErrCopyWithImpl<$Res>;
  @useResult
  $Res call({BeError err});

  $BeErrorCopyWith<$Res> get err;
}

/// @nodoc
class __$$_BeOrderbookResultErrCopyWithImpl<$Res>
    extends _$BeOrderbookResultCopyWithImpl<$Res, _$_BeOrderbookResultErr>
    implements _$$_BeOrderbookResultErrCopyWith<$Res> {
  __$$_BeOrderbookResultErrCopyWithImpl(_$_BeOrderbookResultErr _value,
      $Res Function(_$_BeOrderbookResultErr) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? err = null,
  }) {
    return _then(_$_BeOrderbookResultErr(
      null == err
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as BeError,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $BeErrorCopyWith<$Res> get err {
    return $BeErrorCopyWith<$Res>(_value.err, (value) {
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
  final BeError err;

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
        (other.runtimeType == runtimeType &&
            other is _$_BeOrderbookResultErr &&
            (identical(other.err, err) || other.err == err));
  }

  @override
  int get hashCode => Object.hash(runtimeType, err);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BeOrderbookResultErrCopyWith<_$_BeOrderbookResultErr> get copyWith =>
      __$$_BeOrderbookResultErrCopyWithImpl<_$_BeOrderbookResultErr>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(BeOrderbook orderbook) $default, {
    required TResult Function(BeError err) error,
  }) {
    return error(err);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(BeOrderbook orderbook)? $default, {
    TResult? Function(BeError err)? error,
  }) {
    return error?.call(err);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(BeOrderbook orderbook)? $default, {
    TResult Function(BeError err)? error,
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
    TResult? Function(_BeOrderbookResult value)? $default, {
    TResult? Function(_BeOrderbookResultErr value)? error,
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
  const factory _BeOrderbookResultErr(final BeError err) =
      _$_BeOrderbookResultErr;

  BeError get err;
  @JsonKey(ignore: true)
  _$$_BeOrderbookResultErrCopyWith<_$_BeOrderbookResultErr> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BeBalancesResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<BeBalance> balances) $default, {
    required TResult Function(BeError err) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(List<BeBalance> balances)? $default, {
    TResult? Function(BeError err)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<BeBalance> balances)? $default, {
    TResult Function(BeError err)? error,
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
    TResult? Function(_BeBalancesResult value)? $default, {
    TResult? Function(_BeBalancesResultErr value)? error,
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
      _$BeBalancesResultCopyWithImpl<$Res, BeBalancesResult>;
}

/// @nodoc
class _$BeBalancesResultCopyWithImpl<$Res, $Val extends BeBalancesResult>
    implements $BeBalancesResultCopyWith<$Res> {
  _$BeBalancesResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_BeBalancesResultCopyWith<$Res> {
  factory _$$_BeBalancesResultCopyWith(
          _$_BeBalancesResult value, $Res Function(_$_BeBalancesResult) then) =
      __$$_BeBalancesResultCopyWithImpl<$Res>;
  @useResult
  $Res call({List<BeBalance> balances});
}

/// @nodoc
class __$$_BeBalancesResultCopyWithImpl<$Res>
    extends _$BeBalancesResultCopyWithImpl<$Res, _$_BeBalancesResult>
    implements _$$_BeBalancesResultCopyWith<$Res> {
  __$$_BeBalancesResultCopyWithImpl(
      _$_BeBalancesResult _value, $Res Function(_$_BeBalancesResult) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? balances = null,
  }) {
    return _then(_$_BeBalancesResult(
      null == balances
          ? _value._balances
          : balances // ignore: cast_nullable_to_non_nullable
              as List<BeBalance>,
    ));
  }
}

/// @nodoc

class _$_BeBalancesResult
    with DiagnosticableTreeMixin
    implements _BeBalancesResult {
  const _$_BeBalancesResult(final List<BeBalance> balances)
      : _balances = balances;

  final List<BeBalance> _balances;
  @override
  List<BeBalance> get balances {
    if (_balances is EqualUnmodifiableListView) return _balances;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_balances);
  }

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
        (other.runtimeType == runtimeType &&
            other is _$_BeBalancesResult &&
            const DeepCollectionEquality().equals(other._balances, _balances));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_balances));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BeBalancesResultCopyWith<_$_BeBalancesResult> get copyWith =>
      __$$_BeBalancesResultCopyWithImpl<_$_BeBalancesResult>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<BeBalance> balances) $default, {
    required TResult Function(BeError err) error,
  }) {
    return $default(balances);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(List<BeBalance> balances)? $default, {
    TResult? Function(BeError err)? error,
  }) {
    return $default?.call(balances);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<BeBalance> balances)? $default, {
    TResult Function(BeError err)? error,
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
    TResult? Function(_BeBalancesResult value)? $default, {
    TResult? Function(_BeBalancesResultErr value)? error,
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
  const factory _BeBalancesResult(final List<BeBalance> balances) =
      _$_BeBalancesResult;

  List<BeBalance> get balances;
  @JsonKey(ignore: true)
  _$$_BeBalancesResultCopyWith<_$_BeBalancesResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_BeBalancesResultErrCopyWith<$Res> {
  factory _$$_BeBalancesResultErrCopyWith(_$_BeBalancesResultErr value,
          $Res Function(_$_BeBalancesResultErr) then) =
      __$$_BeBalancesResultErrCopyWithImpl<$Res>;
  @useResult
  $Res call({BeError err});

  $BeErrorCopyWith<$Res> get err;
}

/// @nodoc
class __$$_BeBalancesResultErrCopyWithImpl<$Res>
    extends _$BeBalancesResultCopyWithImpl<$Res, _$_BeBalancesResultErr>
    implements _$$_BeBalancesResultErrCopyWith<$Res> {
  __$$_BeBalancesResultErrCopyWithImpl(_$_BeBalancesResultErr _value,
      $Res Function(_$_BeBalancesResultErr) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? err = null,
  }) {
    return _then(_$_BeBalancesResultErr(
      null == err
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as BeError,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $BeErrorCopyWith<$Res> get err {
    return $BeErrorCopyWith<$Res>(_value.err, (value) {
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
  final BeError err;

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
        (other.runtimeType == runtimeType &&
            other is _$_BeBalancesResultErr &&
            (identical(other.err, err) || other.err == err));
  }

  @override
  int get hashCode => Object.hash(runtimeType, err);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BeBalancesResultErrCopyWith<_$_BeBalancesResultErr> get copyWith =>
      __$$_BeBalancesResultErrCopyWithImpl<_$_BeBalancesResultErr>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<BeBalance> balances) $default, {
    required TResult Function(BeError err) error,
  }) {
    return error(err);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(List<BeBalance> balances)? $default, {
    TResult? Function(BeError err)? error,
  }) {
    return error?.call(err);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<BeBalance> balances)? $default, {
    TResult Function(BeError err)? error,
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
    TResult? Function(_BeBalancesResult value)? $default, {
    TResult? Function(_BeBalancesResultErr value)? error,
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
  const factory _BeBalancesResultErr(final BeError err) =
      _$_BeBalancesResultErr;

  BeError get err;
  @JsonKey(ignore: true)
  _$$_BeBalancesResultErrCopyWith<_$_BeBalancesResultErr> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BeBalanceResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(BeBalance? balance) $default, {
    required TResult Function(BeError err) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(BeBalance? balance)? $default, {
    TResult? Function(BeError err)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(BeBalance? balance)? $default, {
    TResult Function(BeError err)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_BeBalanceResult value) $default, {
    required TResult Function(_BeBalanceResultErr value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_BeBalanceResult value)? $default, {
    TResult? Function(_BeBalanceResultErr value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BeBalanceResult value)? $default, {
    TResult Function(_BeBalanceResultErr value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BeBalanceResultCopyWith<$Res> {
  factory $BeBalanceResultCopyWith(
          BeBalanceResult value, $Res Function(BeBalanceResult) then) =
      _$BeBalanceResultCopyWithImpl<$Res, BeBalanceResult>;
}

/// @nodoc
class _$BeBalanceResultCopyWithImpl<$Res, $Val extends BeBalanceResult>
    implements $BeBalanceResultCopyWith<$Res> {
  _$BeBalanceResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_BeBalanceResultCopyWith<$Res> {
  factory _$$_BeBalanceResultCopyWith(
          _$_BeBalanceResult value, $Res Function(_$_BeBalanceResult) then) =
      __$$_BeBalanceResultCopyWithImpl<$Res>;
  @useResult
  $Res call({BeBalance? balance});
}

/// @nodoc
class __$$_BeBalanceResultCopyWithImpl<$Res>
    extends _$BeBalanceResultCopyWithImpl<$Res, _$_BeBalanceResult>
    implements _$$_BeBalanceResultCopyWith<$Res> {
  __$$_BeBalanceResultCopyWithImpl(
      _$_BeBalanceResult _value, $Res Function(_$_BeBalanceResult) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? balance = freezed,
  }) {
    return _then(_$_BeBalanceResult(
      freezed == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as BeBalance?,
    ));
  }
}

/// @nodoc

class _$_BeBalanceResult
    with DiagnosticableTreeMixin
    implements _BeBalanceResult {
  const _$_BeBalanceResult(this.balance);

  @override
  final BeBalance? balance;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BeBalanceResult(balance: $balance)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BeBalanceResult'))
      ..add(DiagnosticsProperty('balance', balance));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BeBalanceResult &&
            (identical(other.balance, balance) || other.balance == balance));
  }

  @override
  int get hashCode => Object.hash(runtimeType, balance);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BeBalanceResultCopyWith<_$_BeBalanceResult> get copyWith =>
      __$$_BeBalanceResultCopyWithImpl<_$_BeBalanceResult>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(BeBalance? balance) $default, {
    required TResult Function(BeError err) error,
  }) {
    return $default(balance);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(BeBalance? balance)? $default, {
    TResult? Function(BeError err)? error,
  }) {
    return $default?.call(balance);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(BeBalance? balance)? $default, {
    TResult Function(BeError err)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(balance);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_BeBalanceResult value) $default, {
    required TResult Function(_BeBalanceResultErr value) error,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_BeBalanceResult value)? $default, {
    TResult? Function(_BeBalanceResultErr value)? error,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BeBalanceResult value)? $default, {
    TResult Function(_BeBalanceResultErr value)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _BeBalanceResult implements BeBalanceResult {
  const factory _BeBalanceResult(final BeBalance? balance) = _$_BeBalanceResult;

  BeBalance? get balance;
  @JsonKey(ignore: true)
  _$$_BeBalanceResultCopyWith<_$_BeBalanceResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_BeBalanceResultErrCopyWith<$Res> {
  factory _$$_BeBalanceResultErrCopyWith(_$_BeBalanceResultErr value,
          $Res Function(_$_BeBalanceResultErr) then) =
      __$$_BeBalanceResultErrCopyWithImpl<$Res>;
  @useResult
  $Res call({BeError err});

  $BeErrorCopyWith<$Res> get err;
}

/// @nodoc
class __$$_BeBalanceResultErrCopyWithImpl<$Res>
    extends _$BeBalanceResultCopyWithImpl<$Res, _$_BeBalanceResultErr>
    implements _$$_BeBalanceResultErrCopyWith<$Res> {
  __$$_BeBalanceResultErrCopyWithImpl(
      _$_BeBalanceResultErr _value, $Res Function(_$_BeBalanceResultErr) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? err = null,
  }) {
    return _then(_$_BeBalanceResultErr(
      null == err
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as BeError,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $BeErrorCopyWith<$Res> get err {
    return $BeErrorCopyWith<$Res>(_value.err, (value) {
      return _then(_value.copyWith(err: value));
    });
  }
}

/// @nodoc

class _$_BeBalanceResultErr
    with DiagnosticableTreeMixin
    implements _BeBalanceResultErr {
  const _$_BeBalanceResultErr(this.err);

  @override
  final BeError err;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BeBalanceResult.error(err: $err)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BeBalanceResult.error'))
      ..add(DiagnosticsProperty('err', err));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BeBalanceResultErr &&
            (identical(other.err, err) || other.err == err));
  }

  @override
  int get hashCode => Object.hash(runtimeType, err);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BeBalanceResultErrCopyWith<_$_BeBalanceResultErr> get copyWith =>
      __$$_BeBalanceResultErrCopyWithImpl<_$_BeBalanceResultErr>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(BeBalance? balance) $default, {
    required TResult Function(BeError err) error,
  }) {
    return error(err);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(BeBalance? balance)? $default, {
    TResult? Function(BeError err)? error,
  }) {
    return error?.call(err);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(BeBalance? balance)? $default, {
    TResult Function(BeError err)? error,
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
    TResult Function(_BeBalanceResult value) $default, {
    required TResult Function(_BeBalanceResultErr value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_BeBalanceResult value)? $default, {
    TResult? Function(_BeBalanceResultErr value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BeBalanceResult value)? $default, {
    TResult Function(_BeBalanceResultErr value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _BeBalanceResultErr implements BeBalanceResult {
  const factory _BeBalanceResultErr(final BeError err) = _$_BeBalanceResultErr;

  BeError get err;
  @JsonKey(ignore: true)
  _$$_BeBalanceResultErrCopyWith<_$_BeBalanceResultErr> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BeCryptoDepositRecipientResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String recipient, String asset, String? l2Network)
        $default, {
    required TResult Function(BeError err) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String recipient, String asset, String? l2Network)?
        $default, {
    TResult? Function(BeError err)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String recipient, String asset, String? l2Network)?
        $default, {
    TResult Function(BeError err)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_BeCryptoDepositRecipientResult value) $default, {
    required TResult Function(_BeCryptoDepositRecipientResultErr value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_BeCryptoDepositRecipientResult value)? $default, {
    TResult? Function(_BeCryptoDepositRecipientResultErr value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BeCryptoDepositRecipientResult value)? $default, {
    TResult Function(_BeCryptoDepositRecipientResultErr value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BeCryptoDepositRecipientResultCopyWith<$Res> {
  factory $BeCryptoDepositRecipientResultCopyWith(
          BeCryptoDepositRecipientResult value,
          $Res Function(BeCryptoDepositRecipientResult) then) =
      _$BeCryptoDepositRecipientResultCopyWithImpl<$Res,
          BeCryptoDepositRecipientResult>;
}

/// @nodoc
class _$BeCryptoDepositRecipientResultCopyWithImpl<$Res,
        $Val extends BeCryptoDepositRecipientResult>
    implements $BeCryptoDepositRecipientResultCopyWith<$Res> {
  _$BeCryptoDepositRecipientResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_BeCryptoDepositRecipientResultCopyWith<$Res> {
  factory _$$_BeCryptoDepositRecipientResultCopyWith(
          _$_BeCryptoDepositRecipientResult value,
          $Res Function(_$_BeCryptoDepositRecipientResult) then) =
      __$$_BeCryptoDepositRecipientResultCopyWithImpl<$Res>;
  @useResult
  $Res call({String recipient, String asset, String? l2Network});
}

/// @nodoc
class __$$_BeCryptoDepositRecipientResultCopyWithImpl<$Res>
    extends _$BeCryptoDepositRecipientResultCopyWithImpl<$Res,
        _$_BeCryptoDepositRecipientResult>
    implements _$$_BeCryptoDepositRecipientResultCopyWith<$Res> {
  __$$_BeCryptoDepositRecipientResultCopyWithImpl(
      _$_BeCryptoDepositRecipientResult _value,
      $Res Function(_$_BeCryptoDepositRecipientResult) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recipient = null,
    Object? asset = null,
    Object? l2Network = freezed,
  }) {
    return _then(_$_BeCryptoDepositRecipientResult(
      null == recipient
          ? _value.recipient
          : recipient // ignore: cast_nullable_to_non_nullable
              as String,
      null == asset
          ? _value.asset
          : asset // ignore: cast_nullable_to_non_nullable
              as String,
      freezed == l2Network
          ? _value.l2Network
          : l2Network // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_BeCryptoDepositRecipientResult
    with DiagnosticableTreeMixin
    implements _BeCryptoDepositRecipientResult {
  const _$_BeCryptoDepositRecipientResult(
      this.recipient, this.asset, this.l2Network);

  @override
  final String recipient;
  @override
  final String asset;
  @override
  final String? l2Network;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BeCryptoDepositRecipientResult(recipient: $recipient, asset: $asset, l2Network: $l2Network)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BeCryptoDepositRecipientResult'))
      ..add(DiagnosticsProperty('recipient', recipient))
      ..add(DiagnosticsProperty('asset', asset))
      ..add(DiagnosticsProperty('l2Network', l2Network));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BeCryptoDepositRecipientResult &&
            (identical(other.recipient, recipient) ||
                other.recipient == recipient) &&
            (identical(other.asset, asset) || other.asset == asset) &&
            (identical(other.l2Network, l2Network) ||
                other.l2Network == l2Network));
  }

  @override
  int get hashCode => Object.hash(runtimeType, recipient, asset, l2Network);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BeCryptoDepositRecipientResultCopyWith<_$_BeCryptoDepositRecipientResult>
      get copyWith => __$$_BeCryptoDepositRecipientResultCopyWithImpl<
          _$_BeCryptoDepositRecipientResult>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String recipient, String asset, String? l2Network)
        $default, {
    required TResult Function(BeError err) error,
  }) {
    return $default(recipient, asset, l2Network);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String recipient, String asset, String? l2Network)?
        $default, {
    TResult? Function(BeError err)? error,
  }) {
    return $default?.call(recipient, asset, l2Network);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String recipient, String asset, String? l2Network)?
        $default, {
    TResult Function(BeError err)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(recipient, asset, l2Network);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_BeCryptoDepositRecipientResult value) $default, {
    required TResult Function(_BeCryptoDepositRecipientResultErr value) error,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_BeCryptoDepositRecipientResult value)? $default, {
    TResult? Function(_BeCryptoDepositRecipientResultErr value)? error,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BeCryptoDepositRecipientResult value)? $default, {
    TResult Function(_BeCryptoDepositRecipientResultErr value)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _BeCryptoDepositRecipientResult
    implements BeCryptoDepositRecipientResult {
  const factory _BeCryptoDepositRecipientResult(
          final String recipient, final String asset, final String? l2Network) =
      _$_BeCryptoDepositRecipientResult;

  String get recipient;
  String get asset;
  String? get l2Network;
  @JsonKey(ignore: true)
  _$$_BeCryptoDepositRecipientResultCopyWith<_$_BeCryptoDepositRecipientResult>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_BeCryptoDepositRecipientResultErrCopyWith<$Res> {
  factory _$$_BeCryptoDepositRecipientResultErrCopyWith(
          _$_BeCryptoDepositRecipientResultErr value,
          $Res Function(_$_BeCryptoDepositRecipientResultErr) then) =
      __$$_BeCryptoDepositRecipientResultErrCopyWithImpl<$Res>;
  @useResult
  $Res call({BeError err});

  $BeErrorCopyWith<$Res> get err;
}

/// @nodoc
class __$$_BeCryptoDepositRecipientResultErrCopyWithImpl<$Res>
    extends _$BeCryptoDepositRecipientResultCopyWithImpl<$Res,
        _$_BeCryptoDepositRecipientResultErr>
    implements _$$_BeCryptoDepositRecipientResultErrCopyWith<$Res> {
  __$$_BeCryptoDepositRecipientResultErrCopyWithImpl(
      _$_BeCryptoDepositRecipientResultErr _value,
      $Res Function(_$_BeCryptoDepositRecipientResultErr) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? err = null,
  }) {
    return _then(_$_BeCryptoDepositRecipientResultErr(
      null == err
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as BeError,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $BeErrorCopyWith<$Res> get err {
    return $BeErrorCopyWith<$Res>(_value.err, (value) {
      return _then(_value.copyWith(err: value));
    });
  }
}

/// @nodoc

class _$_BeCryptoDepositRecipientResultErr
    with DiagnosticableTreeMixin
    implements _BeCryptoDepositRecipientResultErr {
  const _$_BeCryptoDepositRecipientResultErr(this.err);

  @override
  final BeError err;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BeCryptoDepositRecipientResult.error(err: $err)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BeCryptoDepositRecipientResult.error'))
      ..add(DiagnosticsProperty('err', err));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BeCryptoDepositRecipientResultErr &&
            (identical(other.err, err) || other.err == err));
  }

  @override
  int get hashCode => Object.hash(runtimeType, err);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BeCryptoDepositRecipientResultErrCopyWith<
          _$_BeCryptoDepositRecipientResultErr>
      get copyWith => __$$_BeCryptoDepositRecipientResultErrCopyWithImpl<
          _$_BeCryptoDepositRecipientResultErr>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String recipient, String asset, String? l2Network)
        $default, {
    required TResult Function(BeError err) error,
  }) {
    return error(err);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String recipient, String asset, String? l2Network)?
        $default, {
    TResult? Function(BeError err)? error,
  }) {
    return error?.call(err);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String recipient, String asset, String? l2Network)?
        $default, {
    TResult Function(BeError err)? error,
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
    TResult Function(_BeCryptoDepositRecipientResult value) $default, {
    required TResult Function(_BeCryptoDepositRecipientResultErr value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_BeCryptoDepositRecipientResult value)? $default, {
    TResult? Function(_BeCryptoDepositRecipientResultErr value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BeCryptoDepositRecipientResult value)? $default, {
    TResult Function(_BeCryptoDepositRecipientResultErr value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _BeCryptoDepositRecipientResultErr
    implements BeCryptoDepositRecipientResult {
  const factory _BeCryptoDepositRecipientResultErr(final BeError err) =
      _$_BeCryptoDepositRecipientResultErr;

  BeError get err;
  @JsonKey(ignore: true)
  _$$_BeCryptoDepositRecipientResultErrCopyWith<
          _$_BeCryptoDepositRecipientResultErr>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BeFiatAccountNumberResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(BeFiatAccountNumber accountNumber) $default, {
    required TResult Function(BeError err) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(BeFiatAccountNumber accountNumber)? $default, {
    TResult? Function(BeError err)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(BeFiatAccountNumber accountNumber)? $default, {
    TResult Function(BeError err)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_BeFiatAccountNumberResult value) $default, {
    required TResult Function(_BeFiatAccountNumberResultErr value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_BeFiatAccountNumberResult value)? $default, {
    TResult? Function(_BeFiatAccountNumberResultErr value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BeFiatAccountNumberResult value)? $default, {
    TResult Function(_BeFiatAccountNumberResultErr value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BeFiatAccountNumberResultCopyWith<$Res> {
  factory $BeFiatAccountNumberResultCopyWith(BeFiatAccountNumberResult value,
          $Res Function(BeFiatAccountNumberResult) then) =
      _$BeFiatAccountNumberResultCopyWithImpl<$Res, BeFiatAccountNumberResult>;
}

/// @nodoc
class _$BeFiatAccountNumberResultCopyWithImpl<$Res,
        $Val extends BeFiatAccountNumberResult>
    implements $BeFiatAccountNumberResultCopyWith<$Res> {
  _$BeFiatAccountNumberResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_BeFiatAccountNumberResultCopyWith<$Res> {
  factory _$$_BeFiatAccountNumberResultCopyWith(
          _$_BeFiatAccountNumberResult value,
          $Res Function(_$_BeFiatAccountNumberResult) then) =
      __$$_BeFiatAccountNumberResultCopyWithImpl<$Res>;
  @useResult
  $Res call({BeFiatAccountNumber accountNumber});
}

/// @nodoc
class __$$_BeFiatAccountNumberResultCopyWithImpl<$Res>
    extends _$BeFiatAccountNumberResultCopyWithImpl<$Res,
        _$_BeFiatAccountNumberResult>
    implements _$$_BeFiatAccountNumberResultCopyWith<$Res> {
  __$$_BeFiatAccountNumberResultCopyWithImpl(
      _$_BeFiatAccountNumberResult _value,
      $Res Function(_$_BeFiatAccountNumberResult) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountNumber = null,
  }) {
    return _then(_$_BeFiatAccountNumberResult(
      null == accountNumber
          ? _value.accountNumber
          : accountNumber // ignore: cast_nullable_to_non_nullable
              as BeFiatAccountNumber,
    ));
  }
}

/// @nodoc

class _$_BeFiatAccountNumberResult
    with DiagnosticableTreeMixin
    implements _BeFiatAccountNumberResult {
  const _$_BeFiatAccountNumberResult(this.accountNumber);

  @override
  final BeFiatAccountNumber accountNumber;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BeFiatAccountNumberResult(accountNumber: $accountNumber)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BeFiatAccountNumberResult'))
      ..add(DiagnosticsProperty('accountNumber', accountNumber));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BeFiatAccountNumberResult &&
            (identical(other.accountNumber, accountNumber) ||
                other.accountNumber == accountNumber));
  }

  @override
  int get hashCode => Object.hash(runtimeType, accountNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BeFiatAccountNumberResultCopyWith<_$_BeFiatAccountNumberResult>
      get copyWith => __$$_BeFiatAccountNumberResultCopyWithImpl<
          _$_BeFiatAccountNumberResult>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(BeFiatAccountNumber accountNumber) $default, {
    required TResult Function(BeError err) error,
  }) {
    return $default(accountNumber);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(BeFiatAccountNumber accountNumber)? $default, {
    TResult? Function(BeError err)? error,
  }) {
    return $default?.call(accountNumber);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(BeFiatAccountNumber accountNumber)? $default, {
    TResult Function(BeError err)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(accountNumber);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_BeFiatAccountNumberResult value) $default, {
    required TResult Function(_BeFiatAccountNumberResultErr value) error,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_BeFiatAccountNumberResult value)? $default, {
    TResult? Function(_BeFiatAccountNumberResultErr value)? error,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BeFiatAccountNumberResult value)? $default, {
    TResult Function(_BeFiatAccountNumberResultErr value)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _BeFiatAccountNumberResult implements BeFiatAccountNumberResult {
  const factory _BeFiatAccountNumberResult(
      final BeFiatAccountNumber accountNumber) = _$_BeFiatAccountNumberResult;

  BeFiatAccountNumber get accountNumber;
  @JsonKey(ignore: true)
  _$$_BeFiatAccountNumberResultCopyWith<_$_BeFiatAccountNumberResult>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_BeFiatAccountNumberResultErrCopyWith<$Res> {
  factory _$$_BeFiatAccountNumberResultErrCopyWith(
          _$_BeFiatAccountNumberResultErr value,
          $Res Function(_$_BeFiatAccountNumberResultErr) then) =
      __$$_BeFiatAccountNumberResultErrCopyWithImpl<$Res>;
  @useResult
  $Res call({BeError err});

  $BeErrorCopyWith<$Res> get err;
}

/// @nodoc
class __$$_BeFiatAccountNumberResultErrCopyWithImpl<$Res>
    extends _$BeFiatAccountNumberResultCopyWithImpl<$Res,
        _$_BeFiatAccountNumberResultErr>
    implements _$$_BeFiatAccountNumberResultErrCopyWith<$Res> {
  __$$_BeFiatAccountNumberResultErrCopyWithImpl(
      _$_BeFiatAccountNumberResultErr _value,
      $Res Function(_$_BeFiatAccountNumberResultErr) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? err = null,
  }) {
    return _then(_$_BeFiatAccountNumberResultErr(
      null == err
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as BeError,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $BeErrorCopyWith<$Res> get err {
    return $BeErrorCopyWith<$Res>(_value.err, (value) {
      return _then(_value.copyWith(err: value));
    });
  }
}

/// @nodoc

class _$_BeFiatAccountNumberResultErr
    with DiagnosticableTreeMixin
    implements _BeFiatAccountNumberResultErr {
  const _$_BeFiatAccountNumberResultErr(this.err);

  @override
  final BeError err;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BeFiatAccountNumberResult.error(err: $err)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BeFiatAccountNumberResult.error'))
      ..add(DiagnosticsProperty('err', err));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BeFiatAccountNumberResultErr &&
            (identical(other.err, err) || other.err == err));
  }

  @override
  int get hashCode => Object.hash(runtimeType, err);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BeFiatAccountNumberResultErrCopyWith<_$_BeFiatAccountNumberResultErr>
      get copyWith => __$$_BeFiatAccountNumberResultErrCopyWithImpl<
          _$_BeFiatAccountNumberResultErr>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(BeFiatAccountNumber accountNumber) $default, {
    required TResult Function(BeError err) error,
  }) {
    return error(err);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(BeFiatAccountNumber accountNumber)? $default, {
    TResult? Function(BeError err)? error,
  }) {
    return error?.call(err);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(BeFiatAccountNumber accountNumber)? $default, {
    TResult Function(BeError err)? error,
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
    TResult Function(_BeFiatAccountNumberResult value) $default, {
    required TResult Function(_BeFiatAccountNumberResultErr value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_BeFiatAccountNumberResult value)? $default, {
    TResult? Function(_BeFiatAccountNumberResultErr value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BeFiatAccountNumberResult value)? $default, {
    TResult Function(_BeFiatAccountNumberResultErr value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _BeFiatAccountNumberResultErr
    implements BeFiatAccountNumberResult {
  const factory _BeFiatAccountNumberResultErr(final BeError err) =
      _$_BeFiatAccountNumberResultErr;

  BeError get err;
  @JsonKey(ignore: true)
  _$$_BeFiatAccountNumberResultErrCopyWith<_$_BeFiatAccountNumberResultErr>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BeDepositResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(BeBalanceUpdate deposit) $default, {
    required TResult Function(BeError err) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(BeBalanceUpdate deposit)? $default, {
    TResult? Function(BeError err)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(BeBalanceUpdate deposit)? $default, {
    TResult Function(BeError err)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_BeDepositResult value) $default, {
    required TResult Function(_BeFiatDepositResultErr value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_BeDepositResult value)? $default, {
    TResult? Function(_BeFiatDepositResultErr value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BeDepositResult value)? $default, {
    TResult Function(_BeFiatDepositResultErr value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BeDepositResultCopyWith<$Res> {
  factory $BeDepositResultCopyWith(
          BeDepositResult value, $Res Function(BeDepositResult) then) =
      _$BeDepositResultCopyWithImpl<$Res, BeDepositResult>;
}

/// @nodoc
class _$BeDepositResultCopyWithImpl<$Res, $Val extends BeDepositResult>
    implements $BeDepositResultCopyWith<$Res> {
  _$BeDepositResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_BeDepositResultCopyWith<$Res> {
  factory _$$_BeDepositResultCopyWith(
          _$_BeDepositResult value, $Res Function(_$_BeDepositResult) then) =
      __$$_BeDepositResultCopyWithImpl<$Res>;
  @useResult
  $Res call({BeBalanceUpdate deposit});
}

/// @nodoc
class __$$_BeDepositResultCopyWithImpl<$Res>
    extends _$BeDepositResultCopyWithImpl<$Res, _$_BeDepositResult>
    implements _$$_BeDepositResultCopyWith<$Res> {
  __$$_BeDepositResultCopyWithImpl(
      _$_BeDepositResult _value, $Res Function(_$_BeDepositResult) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deposit = null,
  }) {
    return _then(_$_BeDepositResult(
      null == deposit
          ? _value.deposit
          : deposit // ignore: cast_nullable_to_non_nullable
              as BeBalanceUpdate,
    ));
  }
}

/// @nodoc

class _$_BeDepositResult
    with DiagnosticableTreeMixin
    implements _BeDepositResult {
  const _$_BeDepositResult(this.deposit);

  @override
  final BeBalanceUpdate deposit;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BeDepositResult(deposit: $deposit)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BeDepositResult'))
      ..add(DiagnosticsProperty('deposit', deposit));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BeDepositResult &&
            (identical(other.deposit, deposit) || other.deposit == deposit));
  }

  @override
  int get hashCode => Object.hash(runtimeType, deposit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BeDepositResultCopyWith<_$_BeDepositResult> get copyWith =>
      __$$_BeDepositResultCopyWithImpl<_$_BeDepositResult>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(BeBalanceUpdate deposit) $default, {
    required TResult Function(BeError err) error,
  }) {
    return $default(deposit);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(BeBalanceUpdate deposit)? $default, {
    TResult? Function(BeError err)? error,
  }) {
    return $default?.call(deposit);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(BeBalanceUpdate deposit)? $default, {
    TResult Function(BeError err)? error,
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
    TResult Function(_BeDepositResult value) $default, {
    required TResult Function(_BeFiatDepositResultErr value) error,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_BeDepositResult value)? $default, {
    TResult? Function(_BeFiatDepositResultErr value)? error,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BeDepositResult value)? $default, {
    TResult Function(_BeFiatDepositResultErr value)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _BeDepositResult implements BeDepositResult {
  const factory _BeDepositResult(final BeBalanceUpdate deposit) =
      _$_BeDepositResult;

  BeBalanceUpdate get deposit;
  @JsonKey(ignore: true)
  _$$_BeDepositResultCopyWith<_$_BeDepositResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_BeFiatDepositResultErrCopyWith<$Res> {
  factory _$$_BeFiatDepositResultErrCopyWith(_$_BeFiatDepositResultErr value,
          $Res Function(_$_BeFiatDepositResultErr) then) =
      __$$_BeFiatDepositResultErrCopyWithImpl<$Res>;
  @useResult
  $Res call({BeError err});

  $BeErrorCopyWith<$Res> get err;
}

/// @nodoc
class __$$_BeFiatDepositResultErrCopyWithImpl<$Res>
    extends _$BeDepositResultCopyWithImpl<$Res, _$_BeFiatDepositResultErr>
    implements _$$_BeFiatDepositResultErrCopyWith<$Res> {
  __$$_BeFiatDepositResultErrCopyWithImpl(_$_BeFiatDepositResultErr _value,
      $Res Function(_$_BeFiatDepositResultErr) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? err = null,
  }) {
    return _then(_$_BeFiatDepositResultErr(
      null == err
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as BeError,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $BeErrorCopyWith<$Res> get err {
    return $BeErrorCopyWith<$Res>(_value.err, (value) {
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
  final BeError err;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BeDepositResult.error(err: $err)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BeDepositResult.error'))
      ..add(DiagnosticsProperty('err', err));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BeFiatDepositResultErr &&
            (identical(other.err, err) || other.err == err));
  }

  @override
  int get hashCode => Object.hash(runtimeType, err);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BeFiatDepositResultErrCopyWith<_$_BeFiatDepositResultErr> get copyWith =>
      __$$_BeFiatDepositResultErrCopyWithImpl<_$_BeFiatDepositResultErr>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(BeBalanceUpdate deposit) $default, {
    required TResult Function(BeError err) error,
  }) {
    return error(err);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(BeBalanceUpdate deposit)? $default, {
    TResult? Function(BeError err)? error,
  }) {
    return error?.call(err);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(BeBalanceUpdate deposit)? $default, {
    TResult Function(BeError err)? error,
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
    TResult Function(_BeDepositResult value) $default, {
    required TResult Function(_BeFiatDepositResultErr value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_BeDepositResult value)? $default, {
    TResult? Function(_BeFiatDepositResultErr value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BeDepositResult value)? $default, {
    TResult Function(_BeFiatDepositResultErr value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _BeFiatDepositResultErr implements BeDepositResult {
  const factory _BeFiatDepositResultErr(final BeError err) =
      _$_BeFiatDepositResultErr;

  BeError get err;
  @JsonKey(ignore: true)
  _$$_BeFiatDepositResultErrCopyWith<_$_BeFiatDepositResultErr> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BeDepositsResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            List<BeBalanceUpdate> deposits, int offset, int limit, int total)
        $default, {
    required TResult Function(BeError err) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            List<BeBalanceUpdate> deposits, int offset, int limit, int total)?
        $default, {
    TResult? Function(BeError err)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            List<BeBalanceUpdate> deposits, int offset, int limit, int total)?
        $default, {
    TResult Function(BeError err)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_BeDepositsResult value) $default, {
    required TResult Function(_BeDepositsResultErr value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_BeDepositsResult value)? $default, {
    TResult? Function(_BeDepositsResultErr value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BeDepositsResult value)? $default, {
    TResult Function(_BeDepositsResultErr value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BeDepositsResultCopyWith<$Res> {
  factory $BeDepositsResultCopyWith(
          BeDepositsResult value, $Res Function(BeDepositsResult) then) =
      _$BeDepositsResultCopyWithImpl<$Res, BeDepositsResult>;
}

/// @nodoc
class _$BeDepositsResultCopyWithImpl<$Res, $Val extends BeDepositsResult>
    implements $BeDepositsResultCopyWith<$Res> {
  _$BeDepositsResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_BeDepositsResultCopyWith<$Res> {
  factory _$$_BeDepositsResultCopyWith(
          _$_BeDepositsResult value, $Res Function(_$_BeDepositsResult) then) =
      __$$_BeDepositsResultCopyWithImpl<$Res>;
  @useResult
  $Res call({List<BeBalanceUpdate> deposits, int offset, int limit, int total});
}

/// @nodoc
class __$$_BeDepositsResultCopyWithImpl<$Res>
    extends _$BeDepositsResultCopyWithImpl<$Res, _$_BeDepositsResult>
    implements _$$_BeDepositsResultCopyWith<$Res> {
  __$$_BeDepositsResultCopyWithImpl(
      _$_BeDepositsResult _value, $Res Function(_$_BeDepositsResult) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deposits = null,
    Object? offset = null,
    Object? limit = null,
    Object? total = null,
  }) {
    return _then(_$_BeDepositsResult(
      null == deposits
          ? _value._deposits
          : deposits // ignore: cast_nullable_to_non_nullable
              as List<BeBalanceUpdate>,
      null == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int,
      null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_BeDepositsResult
    with DiagnosticableTreeMixin
    implements _BeDepositsResult {
  const _$_BeDepositsResult(
      final List<BeBalanceUpdate> deposits, this.offset, this.limit, this.total)
      : _deposits = deposits;

  final List<BeBalanceUpdate> _deposits;
  @override
  List<BeBalanceUpdate> get deposits {
    if (_deposits is EqualUnmodifiableListView) return _deposits;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_deposits);
  }

  @override
  final int offset;
  @override
  final int limit;
  @override
  final int total;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BeDepositsResult(deposits: $deposits, offset: $offset, limit: $limit, total: $total)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BeDepositsResult'))
      ..add(DiagnosticsProperty('deposits', deposits))
      ..add(DiagnosticsProperty('offset', offset))
      ..add(DiagnosticsProperty('limit', limit))
      ..add(DiagnosticsProperty('total', total));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BeDepositsResult &&
            const DeepCollectionEquality().equals(other._deposits, _deposits) &&
            (identical(other.offset, offset) || other.offset == offset) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.total, total) || other.total == total));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_deposits), offset, limit, total);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BeDepositsResultCopyWith<_$_BeDepositsResult> get copyWith =>
      __$$_BeDepositsResultCopyWithImpl<_$_BeDepositsResult>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            List<BeBalanceUpdate> deposits, int offset, int limit, int total)
        $default, {
    required TResult Function(BeError err) error,
  }) {
    return $default(deposits, offset, limit, total);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            List<BeBalanceUpdate> deposits, int offset, int limit, int total)?
        $default, {
    TResult? Function(BeError err)? error,
  }) {
    return $default?.call(deposits, offset, limit, total);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            List<BeBalanceUpdate> deposits, int offset, int limit, int total)?
        $default, {
    TResult Function(BeError err)? error,
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
    TResult Function(_BeDepositsResult value) $default, {
    required TResult Function(_BeDepositsResultErr value) error,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_BeDepositsResult value)? $default, {
    TResult? Function(_BeDepositsResultErr value)? error,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BeDepositsResult value)? $default, {
    TResult Function(_BeDepositsResultErr value)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _BeDepositsResult implements BeDepositsResult {
  const factory _BeDepositsResult(final List<BeBalanceUpdate> deposits,
      final int offset, final int limit, final int total) = _$_BeDepositsResult;

  List<BeBalanceUpdate> get deposits;
  int get offset;
  int get limit;
  int get total;
  @JsonKey(ignore: true)
  _$$_BeDepositsResultCopyWith<_$_BeDepositsResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_BeDepositsResultErrCopyWith<$Res> {
  factory _$$_BeDepositsResultErrCopyWith(_$_BeDepositsResultErr value,
          $Res Function(_$_BeDepositsResultErr) then) =
      __$$_BeDepositsResultErrCopyWithImpl<$Res>;
  @useResult
  $Res call({BeError err});

  $BeErrorCopyWith<$Res> get err;
}

/// @nodoc
class __$$_BeDepositsResultErrCopyWithImpl<$Res>
    extends _$BeDepositsResultCopyWithImpl<$Res, _$_BeDepositsResultErr>
    implements _$$_BeDepositsResultErrCopyWith<$Res> {
  __$$_BeDepositsResultErrCopyWithImpl(_$_BeDepositsResultErr _value,
      $Res Function(_$_BeDepositsResultErr) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? err = null,
  }) {
    return _then(_$_BeDepositsResultErr(
      null == err
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as BeError,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $BeErrorCopyWith<$Res> get err {
    return $BeErrorCopyWith<$Res>(_value.err, (value) {
      return _then(_value.copyWith(err: value));
    });
  }
}

/// @nodoc

class _$_BeDepositsResultErr
    with DiagnosticableTreeMixin
    implements _BeDepositsResultErr {
  const _$_BeDepositsResultErr(this.err);

  @override
  final BeError err;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BeDepositsResult.error(err: $err)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BeDepositsResult.error'))
      ..add(DiagnosticsProperty('err', err));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BeDepositsResultErr &&
            (identical(other.err, err) || other.err == err));
  }

  @override
  int get hashCode => Object.hash(runtimeType, err);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BeDepositsResultErrCopyWith<_$_BeDepositsResultErr> get copyWith =>
      __$$_BeDepositsResultErrCopyWithImpl<_$_BeDepositsResultErr>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            List<BeBalanceUpdate> deposits, int offset, int limit, int total)
        $default, {
    required TResult Function(BeError err) error,
  }) {
    return error(err);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            List<BeBalanceUpdate> deposits, int offset, int limit, int total)?
        $default, {
    TResult? Function(BeError err)? error,
  }) {
    return error?.call(err);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            List<BeBalanceUpdate> deposits, int offset, int limit, int total)?
        $default, {
    TResult Function(BeError err)? error,
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
    TResult Function(_BeDepositsResult value) $default, {
    required TResult Function(_BeDepositsResultErr value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_BeDepositsResult value)? $default, {
    TResult? Function(_BeDepositsResultErr value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BeDepositsResult value)? $default, {
    TResult Function(_BeDepositsResultErr value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _BeDepositsResultErr implements BeDepositsResult {
  const factory _BeDepositsResultErr(final BeError err) =
      _$_BeDepositsResultErr;

  BeError get err;
  @JsonKey(ignore: true)
  _$$_BeDepositsResultErrCopyWith<_$_BeDepositsResultErr> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BeWithdrawalResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(BeBalanceUpdate withdrawal) $default, {
    required TResult Function(BeError err) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(BeBalanceUpdate withdrawal)? $default, {
    TResult? Function(BeError err)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(BeBalanceUpdate withdrawal)? $default, {
    TResult Function(BeError err)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_BeWithdrawalResult value) $default, {
    required TResult Function(_BeWithdrawalResultErr value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_BeWithdrawalResult value)? $default, {
    TResult? Function(_BeWithdrawalResultErr value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BeWithdrawalResult value)? $default, {
    TResult Function(_BeWithdrawalResultErr value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BeWithdrawalResultCopyWith<$Res> {
  factory $BeWithdrawalResultCopyWith(
          BeWithdrawalResult value, $Res Function(BeWithdrawalResult) then) =
      _$BeWithdrawalResultCopyWithImpl<$Res, BeWithdrawalResult>;
}

/// @nodoc
class _$BeWithdrawalResultCopyWithImpl<$Res, $Val extends BeWithdrawalResult>
    implements $BeWithdrawalResultCopyWith<$Res> {
  _$BeWithdrawalResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_BeWithdrawalResultCopyWith<$Res> {
  factory _$$_BeWithdrawalResultCopyWith(_$_BeWithdrawalResult value,
          $Res Function(_$_BeWithdrawalResult) then) =
      __$$_BeWithdrawalResultCopyWithImpl<$Res>;
  @useResult
  $Res call({BeBalanceUpdate withdrawal});
}

/// @nodoc
class __$$_BeWithdrawalResultCopyWithImpl<$Res>
    extends _$BeWithdrawalResultCopyWithImpl<$Res, _$_BeWithdrawalResult>
    implements _$$_BeWithdrawalResultCopyWith<$Res> {
  __$$_BeWithdrawalResultCopyWithImpl(
      _$_BeWithdrawalResult _value, $Res Function(_$_BeWithdrawalResult) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? withdrawal = null,
  }) {
    return _then(_$_BeWithdrawalResult(
      null == withdrawal
          ? _value.withdrawal
          : withdrawal // ignore: cast_nullable_to_non_nullable
              as BeBalanceUpdate,
    ));
  }
}

/// @nodoc

class _$_BeWithdrawalResult
    with DiagnosticableTreeMixin
    implements _BeWithdrawalResult {
  const _$_BeWithdrawalResult(this.withdrawal);

  @override
  final BeBalanceUpdate withdrawal;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BeWithdrawalResult(withdrawal: $withdrawal)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BeWithdrawalResult'))
      ..add(DiagnosticsProperty('withdrawal', withdrawal));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BeWithdrawalResult &&
            (identical(other.withdrawal, withdrawal) ||
                other.withdrawal == withdrawal));
  }

  @override
  int get hashCode => Object.hash(runtimeType, withdrawal);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BeWithdrawalResultCopyWith<_$_BeWithdrawalResult> get copyWith =>
      __$$_BeWithdrawalResultCopyWithImpl<_$_BeWithdrawalResult>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(BeBalanceUpdate withdrawal) $default, {
    required TResult Function(BeError err) error,
  }) {
    return $default(withdrawal);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(BeBalanceUpdate withdrawal)? $default, {
    TResult? Function(BeError err)? error,
  }) {
    return $default?.call(withdrawal);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(BeBalanceUpdate withdrawal)? $default, {
    TResult Function(BeError err)? error,
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
    TResult Function(_BeWithdrawalResult value) $default, {
    required TResult Function(_BeWithdrawalResultErr value) error,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_BeWithdrawalResult value)? $default, {
    TResult? Function(_BeWithdrawalResultErr value)? error,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BeWithdrawalResult value)? $default, {
    TResult Function(_BeWithdrawalResultErr value)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _BeWithdrawalResult implements BeWithdrawalResult {
  const factory _BeWithdrawalResult(final BeBalanceUpdate withdrawal) =
      _$_BeWithdrawalResult;

  BeBalanceUpdate get withdrawal;
  @JsonKey(ignore: true)
  _$$_BeWithdrawalResultCopyWith<_$_BeWithdrawalResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_BeWithdrawalResultErrCopyWith<$Res> {
  factory _$$_BeWithdrawalResultErrCopyWith(_$_BeWithdrawalResultErr value,
          $Res Function(_$_BeWithdrawalResultErr) then) =
      __$$_BeWithdrawalResultErrCopyWithImpl<$Res>;
  @useResult
  $Res call({BeError err});

  $BeErrorCopyWith<$Res> get err;
}

/// @nodoc
class __$$_BeWithdrawalResultErrCopyWithImpl<$Res>
    extends _$BeWithdrawalResultCopyWithImpl<$Res, _$_BeWithdrawalResultErr>
    implements _$$_BeWithdrawalResultErrCopyWith<$Res> {
  __$$_BeWithdrawalResultErrCopyWithImpl(_$_BeWithdrawalResultErr _value,
      $Res Function(_$_BeWithdrawalResultErr) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? err = null,
  }) {
    return _then(_$_BeWithdrawalResultErr(
      null == err
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as BeError,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $BeErrorCopyWith<$Res> get err {
    return $BeErrorCopyWith<$Res>(_value.err, (value) {
      return _then(_value.copyWith(err: value));
    });
  }
}

/// @nodoc

class _$_BeWithdrawalResultErr
    with DiagnosticableTreeMixin
    implements _BeWithdrawalResultErr {
  const _$_BeWithdrawalResultErr(this.err);

  @override
  final BeError err;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BeWithdrawalResult.error(err: $err)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BeWithdrawalResult.error'))
      ..add(DiagnosticsProperty('err', err));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BeWithdrawalResultErr &&
            (identical(other.err, err) || other.err == err));
  }

  @override
  int get hashCode => Object.hash(runtimeType, err);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BeWithdrawalResultErrCopyWith<_$_BeWithdrawalResultErr> get copyWith =>
      __$$_BeWithdrawalResultErrCopyWithImpl<_$_BeWithdrawalResultErr>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(BeBalanceUpdate withdrawal) $default, {
    required TResult Function(BeError err) error,
  }) {
    return error(err);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(BeBalanceUpdate withdrawal)? $default, {
    TResult? Function(BeError err)? error,
  }) {
    return error?.call(err);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(BeBalanceUpdate withdrawal)? $default, {
    TResult Function(BeError err)? error,
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
    TResult Function(_BeWithdrawalResult value) $default, {
    required TResult Function(_BeWithdrawalResultErr value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_BeWithdrawalResult value)? $default, {
    TResult? Function(_BeWithdrawalResultErr value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BeWithdrawalResult value)? $default, {
    TResult Function(_BeWithdrawalResultErr value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _BeWithdrawalResultErr implements BeWithdrawalResult {
  const factory _BeWithdrawalResultErr(final BeError err) =
      _$_BeWithdrawalResultErr;

  BeError get err;
  @JsonKey(ignore: true)
  _$$_BeWithdrawalResultErrCopyWith<_$_BeWithdrawalResultErr> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BeWithdrawalsResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            List<BeBalanceUpdate> withdrawals, int offset, int limit, int total)
        $default, {
    required TResult Function(BeError err) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(List<BeBalanceUpdate> withdrawals, int offset, int limit,
            int total)?
        $default, {
    TResult? Function(BeError err)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<BeBalanceUpdate> withdrawals, int offset, int limit,
            int total)?
        $default, {
    TResult Function(BeError err)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_BeWithdrawalsResult value) $default, {
    required TResult Function(_BeWithdrawalsResultErr value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_BeWithdrawalsResult value)? $default, {
    TResult? Function(_BeWithdrawalsResultErr value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BeWithdrawalsResult value)? $default, {
    TResult Function(_BeWithdrawalsResultErr value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BeWithdrawalsResultCopyWith<$Res> {
  factory $BeWithdrawalsResultCopyWith(
          BeWithdrawalsResult value, $Res Function(BeWithdrawalsResult) then) =
      _$BeWithdrawalsResultCopyWithImpl<$Res, BeWithdrawalsResult>;
}

/// @nodoc
class _$BeWithdrawalsResultCopyWithImpl<$Res, $Val extends BeWithdrawalsResult>
    implements $BeWithdrawalsResultCopyWith<$Res> {
  _$BeWithdrawalsResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_BeWithdrawalsResultCopyWith<$Res> {
  factory _$$_BeWithdrawalsResultCopyWith(_$_BeWithdrawalsResult value,
          $Res Function(_$_BeWithdrawalsResult) then) =
      __$$_BeWithdrawalsResultCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<BeBalanceUpdate> withdrawals, int offset, int limit, int total});
}

/// @nodoc
class __$$_BeWithdrawalsResultCopyWithImpl<$Res>
    extends _$BeWithdrawalsResultCopyWithImpl<$Res, _$_BeWithdrawalsResult>
    implements _$$_BeWithdrawalsResultCopyWith<$Res> {
  __$$_BeWithdrawalsResultCopyWithImpl(_$_BeWithdrawalsResult _value,
      $Res Function(_$_BeWithdrawalsResult) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? withdrawals = null,
    Object? offset = null,
    Object? limit = null,
    Object? total = null,
  }) {
    return _then(_$_BeWithdrawalsResult(
      null == withdrawals
          ? _value._withdrawals
          : withdrawals // ignore: cast_nullable_to_non_nullable
              as List<BeBalanceUpdate>,
      null == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int,
      null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_BeWithdrawalsResult
    with DiagnosticableTreeMixin
    implements _BeWithdrawalsResult {
  const _$_BeWithdrawalsResult(final List<BeBalanceUpdate> withdrawals,
      this.offset, this.limit, this.total)
      : _withdrawals = withdrawals;

  final List<BeBalanceUpdate> _withdrawals;
  @override
  List<BeBalanceUpdate> get withdrawals {
    if (_withdrawals is EqualUnmodifiableListView) return _withdrawals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_withdrawals);
  }

  @override
  final int offset;
  @override
  final int limit;
  @override
  final int total;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BeWithdrawalsResult(withdrawals: $withdrawals, offset: $offset, limit: $limit, total: $total)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BeWithdrawalsResult'))
      ..add(DiagnosticsProperty('withdrawals', withdrawals))
      ..add(DiagnosticsProperty('offset', offset))
      ..add(DiagnosticsProperty('limit', limit))
      ..add(DiagnosticsProperty('total', total));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BeWithdrawalsResult &&
            const DeepCollectionEquality()
                .equals(other._withdrawals, _withdrawals) &&
            (identical(other.offset, offset) || other.offset == offset) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.total, total) || other.total == total));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_withdrawals), offset, limit, total);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BeWithdrawalsResultCopyWith<_$_BeWithdrawalsResult> get copyWith =>
      __$$_BeWithdrawalsResultCopyWithImpl<_$_BeWithdrawalsResult>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            List<BeBalanceUpdate> withdrawals, int offset, int limit, int total)
        $default, {
    required TResult Function(BeError err) error,
  }) {
    return $default(withdrawals, offset, limit, total);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(List<BeBalanceUpdate> withdrawals, int offset, int limit,
            int total)?
        $default, {
    TResult? Function(BeError err)? error,
  }) {
    return $default?.call(withdrawals, offset, limit, total);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<BeBalanceUpdate> withdrawals, int offset, int limit,
            int total)?
        $default, {
    TResult Function(BeError err)? error,
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
    TResult Function(_BeWithdrawalsResult value) $default, {
    required TResult Function(_BeWithdrawalsResultErr value) error,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_BeWithdrawalsResult value)? $default, {
    TResult? Function(_BeWithdrawalsResultErr value)? error,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BeWithdrawalsResult value)? $default, {
    TResult Function(_BeWithdrawalsResultErr value)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _BeWithdrawalsResult implements BeWithdrawalsResult {
  const factory _BeWithdrawalsResult(
      final List<BeBalanceUpdate> withdrawals,
      final int offset,
      final int limit,
      final int total) = _$_BeWithdrawalsResult;

  List<BeBalanceUpdate> get withdrawals;
  int get offset;
  int get limit;
  int get total;
  @JsonKey(ignore: true)
  _$$_BeWithdrawalsResultCopyWith<_$_BeWithdrawalsResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_BeWithdrawalsResultErrCopyWith<$Res> {
  factory _$$_BeWithdrawalsResultErrCopyWith(_$_BeWithdrawalsResultErr value,
          $Res Function(_$_BeWithdrawalsResultErr) then) =
      __$$_BeWithdrawalsResultErrCopyWithImpl<$Res>;
  @useResult
  $Res call({BeError err});

  $BeErrorCopyWith<$Res> get err;
}

/// @nodoc
class __$$_BeWithdrawalsResultErrCopyWithImpl<$Res>
    extends _$BeWithdrawalsResultCopyWithImpl<$Res, _$_BeWithdrawalsResultErr>
    implements _$$_BeWithdrawalsResultErrCopyWith<$Res> {
  __$$_BeWithdrawalsResultErrCopyWithImpl(_$_BeWithdrawalsResultErr _value,
      $Res Function(_$_BeWithdrawalsResultErr) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? err = null,
  }) {
    return _then(_$_BeWithdrawalsResultErr(
      null == err
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as BeError,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $BeErrorCopyWith<$Res> get err {
    return $BeErrorCopyWith<$Res>(_value.err, (value) {
      return _then(_value.copyWith(err: value));
    });
  }
}

/// @nodoc

class _$_BeWithdrawalsResultErr
    with DiagnosticableTreeMixin
    implements _BeWithdrawalsResultErr {
  const _$_BeWithdrawalsResultErr(this.err);

  @override
  final BeError err;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BeWithdrawalsResult.error(err: $err)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BeWithdrawalsResult.error'))
      ..add(DiagnosticsProperty('err', err));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BeWithdrawalsResultErr &&
            (identical(other.err, err) || other.err == err));
  }

  @override
  int get hashCode => Object.hash(runtimeType, err);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BeWithdrawalsResultErrCopyWith<_$_BeWithdrawalsResultErr> get copyWith =>
      __$$_BeWithdrawalsResultErrCopyWithImpl<_$_BeWithdrawalsResultErr>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            List<BeBalanceUpdate> withdrawals, int offset, int limit, int total)
        $default, {
    required TResult Function(BeError err) error,
  }) {
    return error(err);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(List<BeBalanceUpdate> withdrawals, int offset, int limit,
            int total)?
        $default, {
    TResult? Function(BeError err)? error,
  }) {
    return error?.call(err);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<BeBalanceUpdate> withdrawals, int offset, int limit,
            int total)?
        $default, {
    TResult Function(BeError err)? error,
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
    TResult Function(_BeWithdrawalsResult value) $default, {
    required TResult Function(_BeWithdrawalsResultErr value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_BeWithdrawalsResult value)? $default, {
    TResult? Function(_BeWithdrawalsResultErr value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BeWithdrawalsResult value)? $default, {
    TResult Function(_BeWithdrawalsResultErr value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _BeWithdrawalsResultErr implements BeWithdrawalsResult {
  const factory _BeWithdrawalsResultErr(final BeError err) =
      _$_BeWithdrawalsResultErr;

  BeError get err;
  @JsonKey(ignore: true)
  _$$_BeWithdrawalsResultErrCopyWith<_$_BeWithdrawalsResultErr> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BeAddressBookResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<BeAddressBookEntry> entries) $default, {
    required TResult Function(BeError err) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(List<BeAddressBookEntry> entries)? $default, {
    TResult? Function(BeError err)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<BeAddressBookEntry> entries)? $default, {
    TResult Function(BeError err)? error,
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
    TResult? Function(_BeAddressBookResult value)? $default, {
    TResult? Function(_BeAddressBookResultErr value)? error,
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
      _$BeAddressBookResultCopyWithImpl<$Res, BeAddressBookResult>;
}

/// @nodoc
class _$BeAddressBookResultCopyWithImpl<$Res, $Val extends BeAddressBookResult>
    implements $BeAddressBookResultCopyWith<$Res> {
  _$BeAddressBookResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_BeAddressBookResultCopyWith<$Res> {
  factory _$$_BeAddressBookResultCopyWith(_$_BeAddressBookResult value,
          $Res Function(_$_BeAddressBookResult) then) =
      __$$_BeAddressBookResultCopyWithImpl<$Res>;
  @useResult
  $Res call({List<BeAddressBookEntry> entries});
}

/// @nodoc
class __$$_BeAddressBookResultCopyWithImpl<$Res>
    extends _$BeAddressBookResultCopyWithImpl<$Res, _$_BeAddressBookResult>
    implements _$$_BeAddressBookResultCopyWith<$Res> {
  __$$_BeAddressBookResultCopyWithImpl(_$_BeAddressBookResult _value,
      $Res Function(_$_BeAddressBookResult) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entries = null,
  }) {
    return _then(_$_BeAddressBookResult(
      null == entries
          ? _value._entries
          : entries // ignore: cast_nullable_to_non_nullable
              as List<BeAddressBookEntry>,
    ));
  }
}

/// @nodoc

class _$_BeAddressBookResult
    with DiagnosticableTreeMixin
    implements _BeAddressBookResult {
  const _$_BeAddressBookResult(final List<BeAddressBookEntry> entries)
      : _entries = entries;

  final List<BeAddressBookEntry> _entries;
  @override
  List<BeAddressBookEntry> get entries {
    if (_entries is EqualUnmodifiableListView) return _entries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_entries);
  }

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
        (other.runtimeType == runtimeType &&
            other is _$_BeAddressBookResult &&
            const DeepCollectionEquality().equals(other._entries, _entries));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_entries));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BeAddressBookResultCopyWith<_$_BeAddressBookResult> get copyWith =>
      __$$_BeAddressBookResultCopyWithImpl<_$_BeAddressBookResult>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<BeAddressBookEntry> entries) $default, {
    required TResult Function(BeError err) error,
  }) {
    return $default(entries);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(List<BeAddressBookEntry> entries)? $default, {
    TResult? Function(BeError err)? error,
  }) {
    return $default?.call(entries);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<BeAddressBookEntry> entries)? $default, {
    TResult Function(BeError err)? error,
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
    TResult? Function(_BeAddressBookResult value)? $default, {
    TResult? Function(_BeAddressBookResultErr value)? error,
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
  const factory _BeAddressBookResult(final List<BeAddressBookEntry> entries) =
      _$_BeAddressBookResult;

  List<BeAddressBookEntry> get entries;
  @JsonKey(ignore: true)
  _$$_BeAddressBookResultCopyWith<_$_BeAddressBookResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_BeAddressBookResultErrCopyWith<$Res> {
  factory _$$_BeAddressBookResultErrCopyWith(_$_BeAddressBookResultErr value,
          $Res Function(_$_BeAddressBookResultErr) then) =
      __$$_BeAddressBookResultErrCopyWithImpl<$Res>;
  @useResult
  $Res call({BeError err});

  $BeErrorCopyWith<$Res> get err;
}

/// @nodoc
class __$$_BeAddressBookResultErrCopyWithImpl<$Res>
    extends _$BeAddressBookResultCopyWithImpl<$Res, _$_BeAddressBookResultErr>
    implements _$$_BeAddressBookResultErrCopyWith<$Res> {
  __$$_BeAddressBookResultErrCopyWithImpl(_$_BeAddressBookResultErr _value,
      $Res Function(_$_BeAddressBookResultErr) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? err = null,
  }) {
    return _then(_$_BeAddressBookResultErr(
      null == err
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as BeError,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $BeErrorCopyWith<$Res> get err {
    return $BeErrorCopyWith<$Res>(_value.err, (value) {
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
  final BeError err;

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
        (other.runtimeType == runtimeType &&
            other is _$_BeAddressBookResultErr &&
            (identical(other.err, err) || other.err == err));
  }

  @override
  int get hashCode => Object.hash(runtimeType, err);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BeAddressBookResultErrCopyWith<_$_BeAddressBookResultErr> get copyWith =>
      __$$_BeAddressBookResultErrCopyWithImpl<_$_BeAddressBookResultErr>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<BeAddressBookEntry> entries) $default, {
    required TResult Function(BeError err) error,
  }) {
    return error(err);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(List<BeAddressBookEntry> entries)? $default, {
    TResult? Function(BeError err)? error,
  }) {
    return error?.call(err);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<BeAddressBookEntry> entries)? $default, {
    TResult Function(BeError err)? error,
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
    TResult? Function(_BeAddressBookResult value)? $default, {
    TResult? Function(_BeAddressBookResultErr value)? error,
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
  const factory _BeAddressBookResultErr(final BeError err) =
      _$_BeAddressBookResultErr;

  BeError get err;
  @JsonKey(ignore: true)
  _$$_BeAddressBookResultErrCopyWith<_$_BeAddressBookResultErr> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BeBrokerOrderResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(BeBrokerOrder order) $default, {
    required TResult Function(BeError err) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(BeBrokerOrder order)? $default, {
    TResult? Function(BeError err)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(BeBrokerOrder order)? $default, {
    TResult Function(BeError err)? error,
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
    TResult? Function(_BeBrokerOrderResult value)? $default, {
    TResult? Function(_BeBrokerOrderResultErr value)? error,
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
      _$BeBrokerOrderResultCopyWithImpl<$Res, BeBrokerOrderResult>;
}

/// @nodoc
class _$BeBrokerOrderResultCopyWithImpl<$Res, $Val extends BeBrokerOrderResult>
    implements $BeBrokerOrderResultCopyWith<$Res> {
  _$BeBrokerOrderResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_BeBrokerOrderResultCopyWith<$Res> {
  factory _$$_BeBrokerOrderResultCopyWith(_$_BeBrokerOrderResult value,
          $Res Function(_$_BeBrokerOrderResult) then) =
      __$$_BeBrokerOrderResultCopyWithImpl<$Res>;
  @useResult
  $Res call({BeBrokerOrder order});
}

/// @nodoc
class __$$_BeBrokerOrderResultCopyWithImpl<$Res>
    extends _$BeBrokerOrderResultCopyWithImpl<$Res, _$_BeBrokerOrderResult>
    implements _$$_BeBrokerOrderResultCopyWith<$Res> {
  __$$_BeBrokerOrderResultCopyWithImpl(_$_BeBrokerOrderResult _value,
      $Res Function(_$_BeBrokerOrderResult) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? order = null,
  }) {
    return _then(_$_BeBrokerOrderResult(
      null == order
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
        (other.runtimeType == runtimeType &&
            other is _$_BeBrokerOrderResult &&
            (identical(other.order, order) || other.order == order));
  }

  @override
  int get hashCode => Object.hash(runtimeType, order);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BeBrokerOrderResultCopyWith<_$_BeBrokerOrderResult> get copyWith =>
      __$$_BeBrokerOrderResultCopyWithImpl<_$_BeBrokerOrderResult>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(BeBrokerOrder order) $default, {
    required TResult Function(BeError err) error,
  }) {
    return $default(order);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(BeBrokerOrder order)? $default, {
    TResult? Function(BeError err)? error,
  }) {
    return $default?.call(order);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(BeBrokerOrder order)? $default, {
    TResult Function(BeError err)? error,
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
    TResult? Function(_BeBrokerOrderResult value)? $default, {
    TResult? Function(_BeBrokerOrderResultErr value)? error,
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
  const factory _BeBrokerOrderResult(final BeBrokerOrder order) =
      _$_BeBrokerOrderResult;

  BeBrokerOrder get order;
  @JsonKey(ignore: true)
  _$$_BeBrokerOrderResultCopyWith<_$_BeBrokerOrderResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_BeBrokerOrderResultErrCopyWith<$Res> {
  factory _$$_BeBrokerOrderResultErrCopyWith(_$_BeBrokerOrderResultErr value,
          $Res Function(_$_BeBrokerOrderResultErr) then) =
      __$$_BeBrokerOrderResultErrCopyWithImpl<$Res>;
  @useResult
  $Res call({BeError err});

  $BeErrorCopyWith<$Res> get err;
}

/// @nodoc
class __$$_BeBrokerOrderResultErrCopyWithImpl<$Res>
    extends _$BeBrokerOrderResultCopyWithImpl<$Res, _$_BeBrokerOrderResultErr>
    implements _$$_BeBrokerOrderResultErrCopyWith<$Res> {
  __$$_BeBrokerOrderResultErrCopyWithImpl(_$_BeBrokerOrderResultErr _value,
      $Res Function(_$_BeBrokerOrderResultErr) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? err = null,
  }) {
    return _then(_$_BeBrokerOrderResultErr(
      null == err
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as BeError,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $BeErrorCopyWith<$Res> get err {
    return $BeErrorCopyWith<$Res>(_value.err, (value) {
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
  final BeError err;

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
        (other.runtimeType == runtimeType &&
            other is _$_BeBrokerOrderResultErr &&
            (identical(other.err, err) || other.err == err));
  }

  @override
  int get hashCode => Object.hash(runtimeType, err);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BeBrokerOrderResultErrCopyWith<_$_BeBrokerOrderResultErr> get copyWith =>
      __$$_BeBrokerOrderResultErrCopyWithImpl<_$_BeBrokerOrderResultErr>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(BeBrokerOrder order) $default, {
    required TResult Function(BeError err) error,
  }) {
    return error(err);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(BeBrokerOrder order)? $default, {
    TResult? Function(BeError err)? error,
  }) {
    return error?.call(err);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(BeBrokerOrder order)? $default, {
    TResult Function(BeError err)? error,
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
    TResult? Function(_BeBrokerOrderResult value)? $default, {
    TResult? Function(_BeBrokerOrderResultErr value)? error,
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
  const factory _BeBrokerOrderResultErr(final BeError err) =
      _$_BeBrokerOrderResultErr;

  BeError get err;
  @JsonKey(ignore: true)
  _$$_BeBrokerOrderResultErrCopyWith<_$_BeBrokerOrderResultErr> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BeBrokerOrdersResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            List<BeBrokerOrder> orders, int offset, int limit, int total)
        $default, {
    required TResult Function(BeError err) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            List<BeBrokerOrder> orders, int offset, int limit, int total)?
        $default, {
    TResult? Function(BeError err)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            List<BeBrokerOrder> orders, int offset, int limit, int total)?
        $default, {
    TResult Function(BeError err)? error,
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
    TResult? Function(_BeBrokerOrdersResult value)? $default, {
    TResult? Function(_BeBrokerOrdersResultErr value)? error,
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
      _$BeBrokerOrdersResultCopyWithImpl<$Res, BeBrokerOrdersResult>;
}

/// @nodoc
class _$BeBrokerOrdersResultCopyWithImpl<$Res,
        $Val extends BeBrokerOrdersResult>
    implements $BeBrokerOrdersResultCopyWith<$Res> {
  _$BeBrokerOrdersResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_BeBrokerOrdersResultCopyWith<$Res> {
  factory _$$_BeBrokerOrdersResultCopyWith(_$_BeBrokerOrdersResult value,
          $Res Function(_$_BeBrokerOrdersResult) then) =
      __$$_BeBrokerOrdersResultCopyWithImpl<$Res>;
  @useResult
  $Res call({List<BeBrokerOrder> orders, int offset, int limit, int total});
}

/// @nodoc
class __$$_BeBrokerOrdersResultCopyWithImpl<$Res>
    extends _$BeBrokerOrdersResultCopyWithImpl<$Res, _$_BeBrokerOrdersResult>
    implements _$$_BeBrokerOrdersResultCopyWith<$Res> {
  __$$_BeBrokerOrdersResultCopyWithImpl(_$_BeBrokerOrdersResult _value,
      $Res Function(_$_BeBrokerOrdersResult) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orders = null,
    Object? offset = null,
    Object? limit = null,
    Object? total = null,
  }) {
    return _then(_$_BeBrokerOrdersResult(
      null == orders
          ? _value._orders
          : orders // ignore: cast_nullable_to_non_nullable
              as List<BeBrokerOrder>,
      null == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int,
      null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      null == total
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
      final List<BeBrokerOrder> orders, this.offset, this.limit, this.total)
      : _orders = orders;

  final List<BeBrokerOrder> _orders;
  @override
  List<BeBrokerOrder> get orders {
    if (_orders is EqualUnmodifiableListView) return _orders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orders);
  }

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
        (other.runtimeType == runtimeType &&
            other is _$_BeBrokerOrdersResult &&
            const DeepCollectionEquality().equals(other._orders, _orders) &&
            (identical(other.offset, offset) || other.offset == offset) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.total, total) || other.total == total));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_orders), offset, limit, total);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BeBrokerOrdersResultCopyWith<_$_BeBrokerOrdersResult> get copyWith =>
      __$$_BeBrokerOrdersResultCopyWithImpl<_$_BeBrokerOrdersResult>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            List<BeBrokerOrder> orders, int offset, int limit, int total)
        $default, {
    required TResult Function(BeError err) error,
  }) {
    return $default(orders, offset, limit, total);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            List<BeBrokerOrder> orders, int offset, int limit, int total)?
        $default, {
    TResult? Function(BeError err)? error,
  }) {
    return $default?.call(orders, offset, limit, total);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            List<BeBrokerOrder> orders, int offset, int limit, int total)?
        $default, {
    TResult Function(BeError err)? error,
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
    TResult? Function(_BeBrokerOrdersResult value)? $default, {
    TResult? Function(_BeBrokerOrdersResultErr value)? error,
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
      final List<BeBrokerOrder> orders,
      final int offset,
      final int limit,
      final int total) = _$_BeBrokerOrdersResult;

  List<BeBrokerOrder> get orders;
  int get offset;
  int get limit;
  int get total;
  @JsonKey(ignore: true)
  _$$_BeBrokerOrdersResultCopyWith<_$_BeBrokerOrdersResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_BeBrokerOrdersResultErrCopyWith<$Res> {
  factory _$$_BeBrokerOrdersResultErrCopyWith(_$_BeBrokerOrdersResultErr value,
          $Res Function(_$_BeBrokerOrdersResultErr) then) =
      __$$_BeBrokerOrdersResultErrCopyWithImpl<$Res>;
  @useResult
  $Res call({BeError err});

  $BeErrorCopyWith<$Res> get err;
}

/// @nodoc
class __$$_BeBrokerOrdersResultErrCopyWithImpl<$Res>
    extends _$BeBrokerOrdersResultCopyWithImpl<$Res, _$_BeBrokerOrdersResultErr>
    implements _$$_BeBrokerOrdersResultErrCopyWith<$Res> {
  __$$_BeBrokerOrdersResultErrCopyWithImpl(_$_BeBrokerOrdersResultErr _value,
      $Res Function(_$_BeBrokerOrdersResultErr) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? err = null,
  }) {
    return _then(_$_BeBrokerOrdersResultErr(
      null == err
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as BeError,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $BeErrorCopyWith<$Res> get err {
    return $BeErrorCopyWith<$Res>(_value.err, (value) {
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
  final BeError err;

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
        (other.runtimeType == runtimeType &&
            other is _$_BeBrokerOrdersResultErr &&
            (identical(other.err, err) || other.err == err));
  }

  @override
  int get hashCode => Object.hash(runtimeType, err);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BeBrokerOrdersResultErrCopyWith<_$_BeBrokerOrdersResultErr>
      get copyWith =>
          __$$_BeBrokerOrdersResultErrCopyWithImpl<_$_BeBrokerOrdersResultErr>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            List<BeBrokerOrder> orders, int offset, int limit, int total)
        $default, {
    required TResult Function(BeError err) error,
  }) {
    return error(err);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            List<BeBrokerOrder> orders, int offset, int limit, int total)?
        $default, {
    TResult? Function(BeError err)? error,
  }) {
    return error?.call(err);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            List<BeBrokerOrder> orders, int offset, int limit, int total)?
        $default, {
    TResult Function(BeError err)? error,
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
    TResult? Function(_BeBrokerOrdersResult value)? $default, {
    TResult? Function(_BeBrokerOrdersResultErr value)? error,
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
  const factory _BeBrokerOrdersResultErr(final BeError err) =
      _$_BeBrokerOrdersResultErr;

  BeError get err;
  @JsonKey(ignore: true)
  _$$_BeBrokerOrdersResultErrCopyWith<_$_BeBrokerOrdersResultErr>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BeRemitPaymentMethodsResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            Map<BePaymentMethodCategory, List<BePaymentMethod>> paymentMethods)
        $default, {
    required TResult Function(BeError err) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            Map<BePaymentMethodCategory, List<BePaymentMethod>> paymentMethods)?
        $default, {
    TResult? Function(BeError err)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            Map<BePaymentMethodCategory, List<BePaymentMethod>> paymentMethods)?
        $default, {
    TResult Function(BeError err)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_BeRemitPaymentMethodsResult value) $default, {
    required TResult Function(_BeRemitPaymentMethodsResultErr value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_BeRemitPaymentMethodsResult value)? $default, {
    TResult? Function(_BeRemitPaymentMethodsResultErr value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BeRemitPaymentMethodsResult value)? $default, {
    TResult Function(_BeRemitPaymentMethodsResultErr value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BeRemitPaymentMethodsResultCopyWith<$Res> {
  factory $BeRemitPaymentMethodsResultCopyWith(
          BeRemitPaymentMethodsResult value,
          $Res Function(BeRemitPaymentMethodsResult) then) =
      _$BeRemitPaymentMethodsResultCopyWithImpl<$Res,
          BeRemitPaymentMethodsResult>;
}

/// @nodoc
class _$BeRemitPaymentMethodsResultCopyWithImpl<$Res,
        $Val extends BeRemitPaymentMethodsResult>
    implements $BeRemitPaymentMethodsResultCopyWith<$Res> {
  _$BeRemitPaymentMethodsResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_BeRemitPaymentMethodsResultCopyWith<$Res> {
  factory _$$_BeRemitPaymentMethodsResultCopyWith(
          _$_BeRemitPaymentMethodsResult value,
          $Res Function(_$_BeRemitPaymentMethodsResult) then) =
      __$$_BeRemitPaymentMethodsResultCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {Map<BePaymentMethodCategory, List<BePaymentMethod>> paymentMethods});
}

/// @nodoc
class __$$_BeRemitPaymentMethodsResultCopyWithImpl<$Res>
    extends _$BeRemitPaymentMethodsResultCopyWithImpl<$Res,
        _$_BeRemitPaymentMethodsResult>
    implements _$$_BeRemitPaymentMethodsResultCopyWith<$Res> {
  __$$_BeRemitPaymentMethodsResultCopyWithImpl(
      _$_BeRemitPaymentMethodsResult _value,
      $Res Function(_$_BeRemitPaymentMethodsResult) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentMethods = null,
  }) {
    return _then(_$_BeRemitPaymentMethodsResult(
      null == paymentMethods
          ? _value._paymentMethods
          : paymentMethods // ignore: cast_nullable_to_non_nullable
              as Map<BePaymentMethodCategory, List<BePaymentMethod>>,
    ));
  }
}

/// @nodoc

class _$_BeRemitPaymentMethodsResult
    with DiagnosticableTreeMixin
    implements _BeRemitPaymentMethodsResult {
  const _$_BeRemitPaymentMethodsResult(
      final Map<BePaymentMethodCategory, List<BePaymentMethod>> paymentMethods)
      : _paymentMethods = paymentMethods;

  final Map<BePaymentMethodCategory, List<BePaymentMethod>> _paymentMethods;
  @override
  Map<BePaymentMethodCategory, List<BePaymentMethod>> get paymentMethods {
    if (_paymentMethods is EqualUnmodifiableMapView) return _paymentMethods;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_paymentMethods);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BeRemitPaymentMethodsResult(paymentMethods: $paymentMethods)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BeRemitPaymentMethodsResult'))
      ..add(DiagnosticsProperty('paymentMethods', paymentMethods));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BeRemitPaymentMethodsResult &&
            const DeepCollectionEquality()
                .equals(other._paymentMethods, _paymentMethods));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_paymentMethods));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BeRemitPaymentMethodsResultCopyWith<_$_BeRemitPaymentMethodsResult>
      get copyWith => __$$_BeRemitPaymentMethodsResultCopyWithImpl<
          _$_BeRemitPaymentMethodsResult>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            Map<BePaymentMethodCategory, List<BePaymentMethod>> paymentMethods)
        $default, {
    required TResult Function(BeError err) error,
  }) {
    return $default(paymentMethods);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            Map<BePaymentMethodCategory, List<BePaymentMethod>> paymentMethods)?
        $default, {
    TResult? Function(BeError err)? error,
  }) {
    return $default?.call(paymentMethods);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            Map<BePaymentMethodCategory, List<BePaymentMethod>> paymentMethods)?
        $default, {
    TResult Function(BeError err)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(paymentMethods);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_BeRemitPaymentMethodsResult value) $default, {
    required TResult Function(_BeRemitPaymentMethodsResultErr value) error,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_BeRemitPaymentMethodsResult value)? $default, {
    TResult? Function(_BeRemitPaymentMethodsResultErr value)? error,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BeRemitPaymentMethodsResult value)? $default, {
    TResult Function(_BeRemitPaymentMethodsResultErr value)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _BeRemitPaymentMethodsResult
    implements BeRemitPaymentMethodsResult {
  const factory _BeRemitPaymentMethodsResult(
      final Map<BePaymentMethodCategory, List<BePaymentMethod>>
          paymentMethods) = _$_BeRemitPaymentMethodsResult;

  Map<BePaymentMethodCategory, List<BePaymentMethod>> get paymentMethods;
  @JsonKey(ignore: true)
  _$$_BeRemitPaymentMethodsResultCopyWith<_$_BeRemitPaymentMethodsResult>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_BeRemitPaymentMethodsResultErrCopyWith<$Res> {
  factory _$$_BeRemitPaymentMethodsResultErrCopyWith(
          _$_BeRemitPaymentMethodsResultErr value,
          $Res Function(_$_BeRemitPaymentMethodsResultErr) then) =
      __$$_BeRemitPaymentMethodsResultErrCopyWithImpl<$Res>;
  @useResult
  $Res call({BeError err});

  $BeErrorCopyWith<$Res> get err;
}

/// @nodoc
class __$$_BeRemitPaymentMethodsResultErrCopyWithImpl<$Res>
    extends _$BeRemitPaymentMethodsResultCopyWithImpl<$Res,
        _$_BeRemitPaymentMethodsResultErr>
    implements _$$_BeRemitPaymentMethodsResultErrCopyWith<$Res> {
  __$$_BeRemitPaymentMethodsResultErrCopyWithImpl(
      _$_BeRemitPaymentMethodsResultErr _value,
      $Res Function(_$_BeRemitPaymentMethodsResultErr) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? err = null,
  }) {
    return _then(_$_BeRemitPaymentMethodsResultErr(
      null == err
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as BeError,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $BeErrorCopyWith<$Res> get err {
    return $BeErrorCopyWith<$Res>(_value.err, (value) {
      return _then(_value.copyWith(err: value));
    });
  }
}

/// @nodoc

class _$_BeRemitPaymentMethodsResultErr
    with DiagnosticableTreeMixin
    implements _BeRemitPaymentMethodsResultErr {
  const _$_BeRemitPaymentMethodsResultErr(this.err);

  @override
  final BeError err;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BeRemitPaymentMethodsResult.error(err: $err)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BeRemitPaymentMethodsResult.error'))
      ..add(DiagnosticsProperty('err', err));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BeRemitPaymentMethodsResultErr &&
            (identical(other.err, err) || other.err == err));
  }

  @override
  int get hashCode => Object.hash(runtimeType, err);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BeRemitPaymentMethodsResultErrCopyWith<_$_BeRemitPaymentMethodsResultErr>
      get copyWith => __$$_BeRemitPaymentMethodsResultErrCopyWithImpl<
          _$_BeRemitPaymentMethodsResultErr>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            Map<BePaymentMethodCategory, List<BePaymentMethod>> paymentMethods)
        $default, {
    required TResult Function(BeError err) error,
  }) {
    return error(err);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            Map<BePaymentMethodCategory, List<BePaymentMethod>> paymentMethods)?
        $default, {
    TResult? Function(BeError err)? error,
  }) {
    return error?.call(err);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            Map<BePaymentMethodCategory, List<BePaymentMethod>> paymentMethods)?
        $default, {
    TResult Function(BeError err)? error,
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
    TResult Function(_BeRemitPaymentMethodsResult value) $default, {
    required TResult Function(_BeRemitPaymentMethodsResultErr value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_BeRemitPaymentMethodsResult value)? $default, {
    TResult? Function(_BeRemitPaymentMethodsResultErr value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BeRemitPaymentMethodsResult value)? $default, {
    TResult Function(_BeRemitPaymentMethodsResultErr value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _BeRemitPaymentMethodsResultErr
    implements BeRemitPaymentMethodsResult {
  const factory _BeRemitPaymentMethodsResultErr(final BeError err) =
      _$_BeRemitPaymentMethodsResultErr;

  BeError get err;
  @JsonKey(ignore: true)
  _$$_BeRemitPaymentMethodsResultErrCopyWith<_$_BeRemitPaymentMethodsResultErr>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BeRemitInvoiceResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            BeRemit remit, BeRemitInvoice invoice, BeBalanceUpdate? withdrawal)
        $default, {
    required TResult Function(BeError err) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            BeRemit remit, BeRemitInvoice invoice, BeBalanceUpdate? withdrawal)?
        $default, {
    TResult? Function(BeError err)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            BeRemit remit, BeRemitInvoice invoice, BeBalanceUpdate? withdrawal)?
        $default, {
    TResult Function(BeError err)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_BeRemitInvoiceResult value) $default, {
    required TResult Function(_BeRemitInvoiceResultErr value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_BeRemitInvoiceResult value)? $default, {
    TResult? Function(_BeRemitInvoiceResultErr value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BeRemitInvoiceResult value)? $default, {
    TResult Function(_BeRemitInvoiceResultErr value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BeRemitInvoiceResultCopyWith<$Res> {
  factory $BeRemitInvoiceResultCopyWith(BeRemitInvoiceResult value,
          $Res Function(BeRemitInvoiceResult) then) =
      _$BeRemitInvoiceResultCopyWithImpl<$Res, BeRemitInvoiceResult>;
}

/// @nodoc
class _$BeRemitInvoiceResultCopyWithImpl<$Res,
        $Val extends BeRemitInvoiceResult>
    implements $BeRemitInvoiceResultCopyWith<$Res> {
  _$BeRemitInvoiceResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_BeRemitInvoiceResultCopyWith<$Res> {
  factory _$$_BeRemitInvoiceResultCopyWith(_$_BeRemitInvoiceResult value,
          $Res Function(_$_BeRemitInvoiceResult) then) =
      __$$_BeRemitInvoiceResultCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {BeRemit remit, BeRemitInvoice invoice, BeBalanceUpdate? withdrawal});
}

/// @nodoc
class __$$_BeRemitInvoiceResultCopyWithImpl<$Res>
    extends _$BeRemitInvoiceResultCopyWithImpl<$Res, _$_BeRemitInvoiceResult>
    implements _$$_BeRemitInvoiceResultCopyWith<$Res> {
  __$$_BeRemitInvoiceResultCopyWithImpl(_$_BeRemitInvoiceResult _value,
      $Res Function(_$_BeRemitInvoiceResult) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? remit = null,
    Object? invoice = null,
    Object? withdrawal = freezed,
  }) {
    return _then(_$_BeRemitInvoiceResult(
      null == remit
          ? _value.remit
          : remit // ignore: cast_nullable_to_non_nullable
              as BeRemit,
      null == invoice
          ? _value.invoice
          : invoice // ignore: cast_nullable_to_non_nullable
              as BeRemitInvoice,
      freezed == withdrawal
          ? _value.withdrawal
          : withdrawal // ignore: cast_nullable_to_non_nullable
              as BeBalanceUpdate?,
    ));
  }
}

/// @nodoc

class _$_BeRemitInvoiceResult
    with DiagnosticableTreeMixin
    implements _BeRemitInvoiceResult {
  const _$_BeRemitInvoiceResult(this.remit, this.invoice, this.withdrawal);

  @override
  final BeRemit remit;
  @override
  final BeRemitInvoice invoice;
  @override
  final BeBalanceUpdate? withdrawal;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BeRemitInvoiceResult(remit: $remit, invoice: $invoice, withdrawal: $withdrawal)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BeRemitInvoiceResult'))
      ..add(DiagnosticsProperty('remit', remit))
      ..add(DiagnosticsProperty('invoice', invoice))
      ..add(DiagnosticsProperty('withdrawal', withdrawal));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BeRemitInvoiceResult &&
            (identical(other.remit, remit) || other.remit == remit) &&
            (identical(other.invoice, invoice) || other.invoice == invoice) &&
            (identical(other.withdrawal, withdrawal) ||
                other.withdrawal == withdrawal));
  }

  @override
  int get hashCode => Object.hash(runtimeType, remit, invoice, withdrawal);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BeRemitInvoiceResultCopyWith<_$_BeRemitInvoiceResult> get copyWith =>
      __$$_BeRemitInvoiceResultCopyWithImpl<_$_BeRemitInvoiceResult>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            BeRemit remit, BeRemitInvoice invoice, BeBalanceUpdate? withdrawal)
        $default, {
    required TResult Function(BeError err) error,
  }) {
    return $default(remit, invoice, withdrawal);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            BeRemit remit, BeRemitInvoice invoice, BeBalanceUpdate? withdrawal)?
        $default, {
    TResult? Function(BeError err)? error,
  }) {
    return $default?.call(remit, invoice, withdrawal);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            BeRemit remit, BeRemitInvoice invoice, BeBalanceUpdate? withdrawal)?
        $default, {
    TResult Function(BeError err)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(remit, invoice, withdrawal);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_BeRemitInvoiceResult value) $default, {
    required TResult Function(_BeRemitInvoiceResultErr value) error,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_BeRemitInvoiceResult value)? $default, {
    TResult? Function(_BeRemitInvoiceResultErr value)? error,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BeRemitInvoiceResult value)? $default, {
    TResult Function(_BeRemitInvoiceResultErr value)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _BeRemitInvoiceResult implements BeRemitInvoiceResult {
  const factory _BeRemitInvoiceResult(
      final BeRemit remit,
      final BeRemitInvoice invoice,
      final BeBalanceUpdate? withdrawal) = _$_BeRemitInvoiceResult;

  BeRemit get remit;
  BeRemitInvoice get invoice;
  BeBalanceUpdate? get withdrawal;
  @JsonKey(ignore: true)
  _$$_BeRemitInvoiceResultCopyWith<_$_BeRemitInvoiceResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_BeRemitInvoiceResultErrCopyWith<$Res> {
  factory _$$_BeRemitInvoiceResultErrCopyWith(_$_BeRemitInvoiceResultErr value,
          $Res Function(_$_BeRemitInvoiceResultErr) then) =
      __$$_BeRemitInvoiceResultErrCopyWithImpl<$Res>;
  @useResult
  $Res call({BeError err});

  $BeErrorCopyWith<$Res> get err;
}

/// @nodoc
class __$$_BeRemitInvoiceResultErrCopyWithImpl<$Res>
    extends _$BeRemitInvoiceResultCopyWithImpl<$Res, _$_BeRemitInvoiceResultErr>
    implements _$$_BeRemitInvoiceResultErrCopyWith<$Res> {
  __$$_BeRemitInvoiceResultErrCopyWithImpl(_$_BeRemitInvoiceResultErr _value,
      $Res Function(_$_BeRemitInvoiceResultErr) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? err = null,
  }) {
    return _then(_$_BeRemitInvoiceResultErr(
      null == err
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as BeError,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $BeErrorCopyWith<$Res> get err {
    return $BeErrorCopyWith<$Res>(_value.err, (value) {
      return _then(_value.copyWith(err: value));
    });
  }
}

/// @nodoc

class _$_BeRemitInvoiceResultErr
    with DiagnosticableTreeMixin
    implements _BeRemitInvoiceResultErr {
  const _$_BeRemitInvoiceResultErr(this.err);

  @override
  final BeError err;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BeRemitInvoiceResult.error(err: $err)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BeRemitInvoiceResult.error'))
      ..add(DiagnosticsProperty('err', err));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BeRemitInvoiceResultErr &&
            (identical(other.err, err) || other.err == err));
  }

  @override
  int get hashCode => Object.hash(runtimeType, err);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BeRemitInvoiceResultErrCopyWith<_$_BeRemitInvoiceResultErr>
      get copyWith =>
          __$$_BeRemitInvoiceResultErrCopyWithImpl<_$_BeRemitInvoiceResultErr>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            BeRemit remit, BeRemitInvoice invoice, BeBalanceUpdate? withdrawal)
        $default, {
    required TResult Function(BeError err) error,
  }) {
    return error(err);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            BeRemit remit, BeRemitInvoice invoice, BeBalanceUpdate? withdrawal)?
        $default, {
    TResult? Function(BeError err)? error,
  }) {
    return error?.call(err);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            BeRemit remit, BeRemitInvoice invoice, BeBalanceUpdate? withdrawal)?
        $default, {
    TResult Function(BeError err)? error,
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
    TResult Function(_BeRemitInvoiceResult value) $default, {
    required TResult Function(_BeRemitInvoiceResultErr value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_BeRemitInvoiceResult value)? $default, {
    TResult? Function(_BeRemitInvoiceResultErr value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BeRemitInvoiceResult value)? $default, {
    TResult Function(_BeRemitInvoiceResultErr value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _BeRemitInvoiceResultErr implements BeRemitInvoiceResult {
  const factory _BeRemitInvoiceResultErr(final BeError err) =
      _$_BeRemitInvoiceResultErr;

  BeError get err;
  @JsonKey(ignore: true)
  _$$_BeRemitInvoiceResultErrCopyWith<_$_BeRemitInvoiceResultErr>
      get copyWith => throw _privateConstructorUsedError;
}
