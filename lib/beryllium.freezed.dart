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
abstract class _$$NetworkImplCopyWith<$Res> {
  factory _$$NetworkImplCopyWith(
          _$NetworkImpl value, $Res Function(_$NetworkImpl) then) =
      __$$NetworkImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NetworkImplCopyWithImpl<$Res>
    extends _$BeErrorCopyWithImpl<$Res, _$NetworkImpl>
    implements _$$NetworkImplCopyWith<$Res> {
  __$$NetworkImplCopyWithImpl(
      _$NetworkImpl _value, $Res Function(_$NetworkImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NetworkImpl with DiagnosticableTreeMixin implements Network {
  const _$NetworkImpl();

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NetworkImpl);
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
  const factory Network() = _$NetworkImpl;
}

/// @nodoc
abstract class _$$AuthImplCopyWith<$Res> {
  factory _$$AuthImplCopyWith(
          _$AuthImpl value, $Res Function(_$AuthImpl) then) =
      __$$AuthImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$AuthImplCopyWithImpl<$Res>
    extends _$BeErrorCopyWithImpl<$Res, _$AuthImpl>
    implements _$$AuthImplCopyWith<$Res> {
  __$$AuthImplCopyWithImpl(_$AuthImpl _value, $Res Function(_$AuthImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$AuthImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AuthImpl with DiagnosticableTreeMixin implements Auth {
  const _$AuthImpl(this.message);

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthImplCopyWith<_$AuthImpl> get copyWith =>
      __$$AuthImplCopyWithImpl<_$AuthImpl>(this, _$identity);

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
  const factory Auth(final String message) = _$AuthImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$AuthImplCopyWith<_$AuthImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FormatImplCopyWith<$Res> {
  factory _$$FormatImplCopyWith(
          _$FormatImpl value, $Res Function(_$FormatImpl) then) =
      __$$FormatImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FormatImplCopyWithImpl<$Res>
    extends _$BeErrorCopyWithImpl<$Res, _$FormatImpl>
    implements _$$FormatImplCopyWith<$Res> {
  __$$FormatImplCopyWithImpl(
      _$FormatImpl _value, $Res Function(_$FormatImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FormatImpl with DiagnosticableTreeMixin implements Format {
  const _$FormatImpl();

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FormatImpl);
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
  const factory Format() = _$FormatImpl;
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
abstract class _$$ErrorResultImplCopyWith<$Res> {
  factory _$$ErrorResultImplCopyWith(
          _$ErrorResultImpl value, $Res Function(_$ErrorResultImpl) then) =
      __$$ErrorResultImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String content});
}

/// @nodoc
class __$$ErrorResultImplCopyWithImpl<$Res>
    extends _$ErrorResultCopyWithImpl<$Res, _$ErrorResultImpl>
    implements _$$ErrorResultImplCopyWith<$Res> {
  __$$ErrorResultImplCopyWithImpl(
      _$ErrorResultImpl _value, $Res Function(_$ErrorResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
  }) {
    return _then(_$ErrorResultImpl(
      null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorResultImpl with DiagnosticableTreeMixin implements _ErrorResult {
  const _$ErrorResultImpl(this.content);

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorResultImpl &&
            (identical(other.content, content) || other.content == content));
  }

  @override
  int get hashCode => Object.hash(runtimeType, content);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorResultImplCopyWith<_$ErrorResultImpl> get copyWith =>
      __$$ErrorResultImplCopyWithImpl<_$ErrorResultImpl>(this, _$identity);

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
  const factory _ErrorResult(final String content) = _$ErrorResultImpl;

  String get content;
  @JsonKey(ignore: true)
  _$$ErrorResultImplCopyWith<_$ErrorResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorResultErrImplCopyWith<$Res> {
  factory _$$ErrorResultErrImplCopyWith(_$ErrorResultErrImpl value,
          $Res Function(_$ErrorResultErrImpl) then) =
      __$$ErrorResultErrImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BeError err});

  $BeErrorCopyWith<$Res> get err;
}

/// @nodoc
class __$$ErrorResultErrImplCopyWithImpl<$Res>
    extends _$ErrorResultCopyWithImpl<$Res, _$ErrorResultErrImpl>
    implements _$$ErrorResultErrImplCopyWith<$Res> {
  __$$ErrorResultErrImplCopyWithImpl(
      _$ErrorResultErrImpl _value, $Res Function(_$ErrorResultErrImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? err = null,
  }) {
    return _then(_$ErrorResultErrImpl(
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

class _$ErrorResultErrImpl
    with DiagnosticableTreeMixin
    implements _ErrorResultErr {
  const _$ErrorResultErrImpl(this.err);

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorResultErrImpl &&
            (identical(other.err, err) || other.err == err));
  }

  @override
  int get hashCode => Object.hash(runtimeType, err);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorResultErrImplCopyWith<_$ErrorResultErrImpl> get copyWith =>
      __$$ErrorResultErrImplCopyWithImpl<_$ErrorResultErrImpl>(
          this, _$identity);

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
  const factory _ErrorResultErr(final BeError err) = _$ErrorResultErrImpl;

  BeError get err;
  @JsonKey(ignore: true)
  _$$ErrorResultErrImplCopyWith<_$ErrorResultErrImpl> get copyWith =>
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
abstract class _$$UserInfoImplCopyWith<$Res> {
  factory _$$UserInfoImplCopyWith(
          _$UserInfoImpl value, $Res Function(_$UserInfoImpl) then) =
      __$$UserInfoImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserInfo info});
}

/// @nodoc
class __$$UserInfoImplCopyWithImpl<$Res>
    extends _$UserInfoResultCopyWithImpl<$Res, _$UserInfoImpl>
    implements _$$UserInfoImplCopyWith<$Res> {
  __$$UserInfoImplCopyWithImpl(
      _$UserInfoImpl _value, $Res Function(_$UserInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? info = null,
  }) {
    return _then(_$UserInfoImpl(
      null == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as UserInfo,
    ));
  }
}

/// @nodoc

class _$UserInfoImpl with DiagnosticableTreeMixin implements _UserInfo {
  const _$UserInfoImpl(this.info);

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserInfoImpl &&
            (identical(other.info, info) || other.info == info));
  }

  @override
  int get hashCode => Object.hash(runtimeType, info);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserInfoImplCopyWith<_$UserInfoImpl> get copyWith =>
      __$$UserInfoImplCopyWithImpl<_$UserInfoImpl>(this, _$identity);

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
  const factory _UserInfo(final UserInfo info) = _$UserInfoImpl;

  UserInfo get info;
  @JsonKey(ignore: true)
  _$$UserInfoImplCopyWith<_$UserInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UserInfoErrImplCopyWith<$Res> {
  factory _$$UserInfoErrImplCopyWith(
          _$UserInfoErrImpl value, $Res Function(_$UserInfoErrImpl) then) =
      __$$UserInfoErrImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BeError err});

  $BeErrorCopyWith<$Res> get err;
}

/// @nodoc
class __$$UserInfoErrImplCopyWithImpl<$Res>
    extends _$UserInfoResultCopyWithImpl<$Res, _$UserInfoErrImpl>
    implements _$$UserInfoErrImplCopyWith<$Res> {
  __$$UserInfoErrImplCopyWithImpl(
      _$UserInfoErrImpl _value, $Res Function(_$UserInfoErrImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? err = null,
  }) {
    return _then(_$UserInfoErrImpl(
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

class _$UserInfoErrImpl with DiagnosticableTreeMixin implements _UserInfoErr {
  const _$UserInfoErrImpl(this.err);

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserInfoErrImpl &&
            (identical(other.err, err) || other.err == err));
  }

  @override
  int get hashCode => Object.hash(runtimeType, err);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserInfoErrImplCopyWith<_$UserInfoErrImpl> get copyWith =>
      __$$UserInfoErrImplCopyWithImpl<_$UserInfoErrImpl>(this, _$identity);

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
  const factory _UserInfoErr(final BeError err) = _$UserInfoErrImpl;

  BeError get err;
  @JsonKey(ignore: true)
  _$$UserInfoErrImplCopyWith<_$UserInfoErrImpl> get copyWith =>
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
abstract class _$$BeTwoFactorEnabledResultImplCopyWith<$Res> {
  factory _$$BeTwoFactorEnabledResultImplCopyWith(
          _$BeTwoFactorEnabledResultImpl value,
          $Res Function(_$BeTwoFactorEnabledResultImpl) then) =
      __$$BeTwoFactorEnabledResultImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool enabled});
}

/// @nodoc
class __$$BeTwoFactorEnabledResultImplCopyWithImpl<$Res>
    extends _$BeTwoFactorEnabledResultCopyWithImpl<$Res,
        _$BeTwoFactorEnabledResultImpl>
    implements _$$BeTwoFactorEnabledResultImplCopyWith<$Res> {
  __$$BeTwoFactorEnabledResultImplCopyWithImpl(
      _$BeTwoFactorEnabledResultImpl _value,
      $Res Function(_$BeTwoFactorEnabledResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enabled = null,
  }) {
    return _then(_$BeTwoFactorEnabledResultImpl(
      null == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$BeTwoFactorEnabledResultImpl
    with DiagnosticableTreeMixin
    implements _BeTwoFactorEnabledResult {
  const _$BeTwoFactorEnabledResultImpl(this.enabled);

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BeTwoFactorEnabledResultImpl &&
            (identical(other.enabled, enabled) || other.enabled == enabled));
  }

  @override
  int get hashCode => Object.hash(runtimeType, enabled);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BeTwoFactorEnabledResultImplCopyWith<_$BeTwoFactorEnabledResultImpl>
      get copyWith => __$$BeTwoFactorEnabledResultImplCopyWithImpl<
          _$BeTwoFactorEnabledResultImpl>(this, _$identity);

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
      _$BeTwoFactorEnabledResultImpl;

  bool get enabled;
  @JsonKey(ignore: true)
  _$$BeTwoFactorEnabledResultImplCopyWith<_$BeTwoFactorEnabledResultImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BeTwoFactorEnabledResultErrImplCopyWith<$Res> {
  factory _$$BeTwoFactorEnabledResultErrImplCopyWith(
          _$BeTwoFactorEnabledResultErrImpl value,
          $Res Function(_$BeTwoFactorEnabledResultErrImpl) then) =
      __$$BeTwoFactorEnabledResultErrImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BeError err});

  $BeErrorCopyWith<$Res> get err;
}

/// @nodoc
class __$$BeTwoFactorEnabledResultErrImplCopyWithImpl<$Res>
    extends _$BeTwoFactorEnabledResultCopyWithImpl<$Res,
        _$BeTwoFactorEnabledResultErrImpl>
    implements _$$BeTwoFactorEnabledResultErrImplCopyWith<$Res> {
  __$$BeTwoFactorEnabledResultErrImplCopyWithImpl(
      _$BeTwoFactorEnabledResultErrImpl _value,
      $Res Function(_$BeTwoFactorEnabledResultErrImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? err = null,
  }) {
    return _then(_$BeTwoFactorEnabledResultErrImpl(
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

class _$BeTwoFactorEnabledResultErrImpl
    with DiagnosticableTreeMixin
    implements _BeTwoFactorEnabledResultErr {
  const _$BeTwoFactorEnabledResultErrImpl(this.err);

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BeTwoFactorEnabledResultErrImpl &&
            (identical(other.err, err) || other.err == err));
  }

  @override
  int get hashCode => Object.hash(runtimeType, err);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BeTwoFactorEnabledResultErrImplCopyWith<_$BeTwoFactorEnabledResultErrImpl>
      get copyWith => __$$BeTwoFactorEnabledResultErrImplCopyWithImpl<
          _$BeTwoFactorEnabledResultErrImpl>(this, _$identity);

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
      _$BeTwoFactorEnabledResultErrImpl;

  BeError get err;
  @JsonKey(ignore: true)
  _$$BeTwoFactorEnabledResultErrImplCopyWith<_$BeTwoFactorEnabledResultErrImpl>
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
abstract class _$$BeVersionResultImplCopyWith<$Res> {
  factory _$$BeVersionResultImplCopyWith(_$BeVersionResultImpl value,
          $Res Function(_$BeVersionResultImpl) then) =
      __$$BeVersionResultImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int serverVersion, int clientVersionDeployed});
}

/// @nodoc
class __$$BeVersionResultImplCopyWithImpl<$Res>
    extends _$BeVersionResultCopyWithImpl<$Res, _$BeVersionResultImpl>
    implements _$$BeVersionResultImplCopyWith<$Res> {
  __$$BeVersionResultImplCopyWithImpl(
      _$BeVersionResultImpl _value, $Res Function(_$BeVersionResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serverVersion = null,
    Object? clientVersionDeployed = null,
  }) {
    return _then(_$BeVersionResultImpl(
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

class _$BeVersionResultImpl
    with DiagnosticableTreeMixin
    implements _BeVersionResult {
  const _$BeVersionResultImpl(this.serverVersion, this.clientVersionDeployed);

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BeVersionResultImpl &&
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
  _$$BeVersionResultImplCopyWith<_$BeVersionResultImpl> get copyWith =>
      __$$BeVersionResultImplCopyWithImpl<_$BeVersionResultImpl>(
          this, _$identity);

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
      _$BeVersionResultImpl;

  int get serverVersion;
  int get clientVersionDeployed;
  @JsonKey(ignore: true)
  _$$BeVersionResultImplCopyWith<_$BeVersionResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BeVersionResultErrImplCopyWith<$Res> {
  factory _$$BeVersionResultErrImplCopyWith(_$BeVersionResultErrImpl value,
          $Res Function(_$BeVersionResultErrImpl) then) =
      __$$BeVersionResultErrImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BeError err});

  $BeErrorCopyWith<$Res> get err;
}

/// @nodoc
class __$$BeVersionResultErrImplCopyWithImpl<$Res>
    extends _$BeVersionResultCopyWithImpl<$Res, _$BeVersionResultErrImpl>
    implements _$$BeVersionResultErrImplCopyWith<$Res> {
  __$$BeVersionResultErrImplCopyWithImpl(_$BeVersionResultErrImpl _value,
      $Res Function(_$BeVersionResultErrImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? err = null,
  }) {
    return _then(_$BeVersionResultErrImpl(
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

class _$BeVersionResultErrImpl
    with DiagnosticableTreeMixin
    implements _BeVersionResultErr {
  const _$BeVersionResultErrImpl(this.err);

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BeVersionResultErrImpl &&
            (identical(other.err, err) || other.err == err));
  }

  @override
  int get hashCode => Object.hash(runtimeType, err);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BeVersionResultErrImplCopyWith<_$BeVersionResultErrImpl> get copyWith =>
      __$$BeVersionResultErrImplCopyWithImpl<_$BeVersionResultErrImpl>(
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
  const factory _BeVersionResultErr(final BeError err) =
      _$BeVersionResultErrImpl;

  BeError get err;
  @JsonKey(ignore: true)
  _$$BeVersionResultErrImplCopyWith<_$BeVersionResultErrImpl> get copyWith =>
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
abstract class _$$BeApiKeyResultImplCopyWith<$Res> {
  factory _$$BeApiKeyResultImplCopyWith(_$BeApiKeyResultImpl value,
          $Res Function(_$BeApiKeyResultImpl) then) =
      __$$BeApiKeyResultImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BeApiKey apikey});
}

/// @nodoc
class __$$BeApiKeyResultImplCopyWithImpl<$Res>
    extends _$BeApiKeyResultCopyWithImpl<$Res, _$BeApiKeyResultImpl>
    implements _$$BeApiKeyResultImplCopyWith<$Res> {
  __$$BeApiKeyResultImplCopyWithImpl(
      _$BeApiKeyResultImpl _value, $Res Function(_$BeApiKeyResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? apikey = null,
  }) {
    return _then(_$BeApiKeyResultImpl(
      null == apikey
          ? _value.apikey
          : apikey // ignore: cast_nullable_to_non_nullable
              as BeApiKey,
    ));
  }
}

/// @nodoc

class _$BeApiKeyResultImpl
    with DiagnosticableTreeMixin
    implements _BeApiKeyResult {
  const _$BeApiKeyResultImpl(this.apikey);

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BeApiKeyResultImpl &&
            (identical(other.apikey, apikey) || other.apikey == apikey));
  }

  @override
  int get hashCode => Object.hash(runtimeType, apikey);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BeApiKeyResultImplCopyWith<_$BeApiKeyResultImpl> get copyWith =>
      __$$BeApiKeyResultImplCopyWithImpl<_$BeApiKeyResultImpl>(
          this, _$identity);

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
  const factory _BeApiKeyResult(final BeApiKey apikey) = _$BeApiKeyResultImpl;

  BeApiKey get apikey;
  @JsonKey(ignore: true)
  _$$BeApiKeyResultImplCopyWith<_$BeApiKeyResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BeApiKeyResultErrImplCopyWith<$Res> {
  factory _$$BeApiKeyResultErrImplCopyWith(_$BeApiKeyResultErrImpl value,
          $Res Function(_$BeApiKeyResultErrImpl) then) =
      __$$BeApiKeyResultErrImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BeError err});

  $BeErrorCopyWith<$Res> get err;
}

/// @nodoc
class __$$BeApiKeyResultErrImplCopyWithImpl<$Res>
    extends _$BeApiKeyResultCopyWithImpl<$Res, _$BeApiKeyResultErrImpl>
    implements _$$BeApiKeyResultErrImplCopyWith<$Res> {
  __$$BeApiKeyResultErrImplCopyWithImpl(_$BeApiKeyResultErrImpl _value,
      $Res Function(_$BeApiKeyResultErrImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? err = null,
  }) {
    return _then(_$BeApiKeyResultErrImpl(
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

class _$BeApiKeyResultErrImpl
    with DiagnosticableTreeMixin
    implements _BeApiKeyResultErr {
  const _$BeApiKeyResultErrImpl(this.err);

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BeApiKeyResultErrImpl &&
            (identical(other.err, err) || other.err == err));
  }

  @override
  int get hashCode => Object.hash(runtimeType, err);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BeApiKeyResultErrImplCopyWith<_$BeApiKeyResultErrImpl> get copyWith =>
      __$$BeApiKeyResultErrImplCopyWithImpl<_$BeApiKeyResultErrImpl>(
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
  const factory _BeApiKeyResultErr(final BeError err) = _$BeApiKeyResultErrImpl;

  BeError get err;
  @JsonKey(ignore: true)
  _$$BeApiKeyResultErrImplCopyWith<_$BeApiKeyResultErrImpl> get copyWith =>
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
abstract class _$$BeApiKeyRequestResultImplCopyWith<$Res> {
  factory _$$BeApiKeyRequestResultImplCopyWith(
          _$BeApiKeyRequestResultImpl value,
          $Res Function(_$BeApiKeyRequestResultImpl) then) =
      __$$BeApiKeyRequestResultImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String token});
}

/// @nodoc
class __$$BeApiKeyRequestResultImplCopyWithImpl<$Res>
    extends _$BeApiKeyRequestResultCopyWithImpl<$Res,
        _$BeApiKeyRequestResultImpl>
    implements _$$BeApiKeyRequestResultImplCopyWith<$Res> {
  __$$BeApiKeyRequestResultImplCopyWithImpl(_$BeApiKeyRequestResultImpl _value,
      $Res Function(_$BeApiKeyRequestResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
  }) {
    return _then(_$BeApiKeyRequestResultImpl(
      null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$BeApiKeyRequestResultImpl
    with DiagnosticableTreeMixin
    implements _BeApiKeyRequestResult {
  const _$BeApiKeyRequestResultImpl(this.token);

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BeApiKeyRequestResultImpl &&
            (identical(other.token, token) || other.token == token));
  }

  @override
  int get hashCode => Object.hash(runtimeType, token);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BeApiKeyRequestResultImplCopyWith<_$BeApiKeyRequestResultImpl>
      get copyWith => __$$BeApiKeyRequestResultImplCopyWithImpl<
          _$BeApiKeyRequestResultImpl>(this, _$identity);

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
      _$BeApiKeyRequestResultImpl;

  String get token;
  @JsonKey(ignore: true)
  _$$BeApiKeyRequestResultImplCopyWith<_$BeApiKeyRequestResultImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BeApiKeyRequestResulttErrImplCopyWith<$Res> {
  factory _$$BeApiKeyRequestResulttErrImplCopyWith(
          _$BeApiKeyRequestResulttErrImpl value,
          $Res Function(_$BeApiKeyRequestResulttErrImpl) then) =
      __$$BeApiKeyRequestResulttErrImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BeError err});

  $BeErrorCopyWith<$Res> get err;
}

/// @nodoc
class __$$BeApiKeyRequestResulttErrImplCopyWithImpl<$Res>
    extends _$BeApiKeyRequestResultCopyWithImpl<$Res,
        _$BeApiKeyRequestResulttErrImpl>
    implements _$$BeApiKeyRequestResulttErrImplCopyWith<$Res> {
  __$$BeApiKeyRequestResulttErrImplCopyWithImpl(
      _$BeApiKeyRequestResulttErrImpl _value,
      $Res Function(_$BeApiKeyRequestResulttErrImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? err = null,
  }) {
    return _then(_$BeApiKeyRequestResulttErrImpl(
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

class _$BeApiKeyRequestResulttErrImpl
    with DiagnosticableTreeMixin
    implements _BeApiKeyRequestResulttErr {
  const _$BeApiKeyRequestResulttErrImpl(this.err);

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BeApiKeyRequestResulttErrImpl &&
            (identical(other.err, err) || other.err == err));
  }

  @override
  int get hashCode => Object.hash(runtimeType, err);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BeApiKeyRequestResulttErrImplCopyWith<_$BeApiKeyRequestResulttErrImpl>
      get copyWith => __$$BeApiKeyRequestResulttErrImplCopyWithImpl<
          _$BeApiKeyRequestResulttErrImpl>(this, _$identity);

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
      _$BeApiKeyRequestResulttErrImpl;

  BeError get err;
  @JsonKey(ignore: true)
  _$$BeApiKeyRequestResulttErrImplCopyWith<_$BeApiKeyRequestResulttErrImpl>
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
abstract class _$$BeKycRequestCreateResultImplCopyWith<$Res> {
  factory _$$BeKycRequestCreateResultImplCopyWith(
          _$BeKycRequestCreateResultImpl value,
          $Res Function(_$BeKycRequestCreateResultImpl) then) =
      __$$BeKycRequestCreateResultImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String kycUrl});
}

/// @nodoc
class __$$BeKycRequestCreateResultImplCopyWithImpl<$Res>
    extends _$BeKycRequestCreateResultCopyWithImpl<$Res,
        _$BeKycRequestCreateResultImpl>
    implements _$$BeKycRequestCreateResultImplCopyWith<$Res> {
  __$$BeKycRequestCreateResultImplCopyWithImpl(
      _$BeKycRequestCreateResultImpl _value,
      $Res Function(_$BeKycRequestCreateResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? kycUrl = null,
  }) {
    return _then(_$BeKycRequestCreateResultImpl(
      null == kycUrl
          ? _value.kycUrl
          : kycUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$BeKycRequestCreateResultImpl
    with DiagnosticableTreeMixin
    implements _BeKycRequestCreateResult {
  const _$BeKycRequestCreateResultImpl(this.kycUrl);

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BeKycRequestCreateResultImpl &&
            (identical(other.kycUrl, kycUrl) || other.kycUrl == kycUrl));
  }

  @override
  int get hashCode => Object.hash(runtimeType, kycUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BeKycRequestCreateResultImplCopyWith<_$BeKycRequestCreateResultImpl>
      get copyWith => __$$BeKycRequestCreateResultImplCopyWithImpl<
          _$BeKycRequestCreateResultImpl>(this, _$identity);

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
      _$BeKycRequestCreateResultImpl;

  String get kycUrl;
  @JsonKey(ignore: true)
  _$$BeKycRequestCreateResultImplCopyWith<_$BeKycRequestCreateResultImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BeKycRequestCreateResultErrImplCopyWith<$Res> {
  factory _$$BeKycRequestCreateResultErrImplCopyWith(
          _$BeKycRequestCreateResultErrImpl value,
          $Res Function(_$BeKycRequestCreateResultErrImpl) then) =
      __$$BeKycRequestCreateResultErrImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BeError err});

  $BeErrorCopyWith<$Res> get err;
}

/// @nodoc
class __$$BeKycRequestCreateResultErrImplCopyWithImpl<$Res>
    extends _$BeKycRequestCreateResultCopyWithImpl<$Res,
        _$BeKycRequestCreateResultErrImpl>
    implements _$$BeKycRequestCreateResultErrImplCopyWith<$Res> {
  __$$BeKycRequestCreateResultErrImplCopyWithImpl(
      _$BeKycRequestCreateResultErrImpl _value,
      $Res Function(_$BeKycRequestCreateResultErrImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? err = null,
  }) {
    return _then(_$BeKycRequestCreateResultErrImpl(
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

class _$BeKycRequestCreateResultErrImpl
    with DiagnosticableTreeMixin
    implements _BeKycRequestCreateResultErr {
  const _$BeKycRequestCreateResultErrImpl(this.err);

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BeKycRequestCreateResultErrImpl &&
            (identical(other.err, err) || other.err == err));
  }

  @override
  int get hashCode => Object.hash(runtimeType, err);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BeKycRequestCreateResultErrImplCopyWith<_$BeKycRequestCreateResultErrImpl>
      get copyWith => __$$BeKycRequestCreateResultErrImplCopyWithImpl<
          _$BeKycRequestCreateResultErrImpl>(this, _$identity);

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
      _$BeKycRequestCreateResultErrImpl;

  BeError get err;
  @JsonKey(ignore: true)
  _$$BeKycRequestCreateResultErrImplCopyWith<_$BeKycRequestCreateResultErrImpl>
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
abstract class _$$BeTwoFactorResultImplCopyWith<$Res> {
  factory _$$BeTwoFactorResultImplCopyWith(_$BeTwoFactorResultImpl value,
          $Res Function(_$BeTwoFactorResultImpl) then) =
      __$$BeTwoFactorResultImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BeTwoFactor twoFactor});
}

/// @nodoc
class __$$BeTwoFactorResultImplCopyWithImpl<$Res>
    extends _$BeTwoFactorResultCopyWithImpl<$Res, _$BeTwoFactorResultImpl>
    implements _$$BeTwoFactorResultImplCopyWith<$Res> {
  __$$BeTwoFactorResultImplCopyWithImpl(_$BeTwoFactorResultImpl _value,
      $Res Function(_$BeTwoFactorResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? twoFactor = null,
  }) {
    return _then(_$BeTwoFactorResultImpl(
      null == twoFactor
          ? _value.twoFactor
          : twoFactor // ignore: cast_nullable_to_non_nullable
              as BeTwoFactor,
    ));
  }
}

/// @nodoc

class _$BeTwoFactorResultImpl
    with DiagnosticableTreeMixin
    implements _BeTwoFactorResult {
  const _$BeTwoFactorResultImpl(this.twoFactor);

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BeTwoFactorResultImpl &&
            (identical(other.twoFactor, twoFactor) ||
                other.twoFactor == twoFactor));
  }

  @override
  int get hashCode => Object.hash(runtimeType, twoFactor);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BeTwoFactorResultImplCopyWith<_$BeTwoFactorResultImpl> get copyWith =>
      __$$BeTwoFactorResultImplCopyWithImpl<_$BeTwoFactorResultImpl>(
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
      _$BeTwoFactorResultImpl;

  BeTwoFactor get twoFactor;
  @JsonKey(ignore: true)
  _$$BeTwoFactorResultImplCopyWith<_$BeTwoFactorResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BeTwoFactorResultErrImplCopyWith<$Res> {
  factory _$$BeTwoFactorResultErrImplCopyWith(_$BeTwoFactorResultErrImpl value,
          $Res Function(_$BeTwoFactorResultErrImpl) then) =
      __$$BeTwoFactorResultErrImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BeError err});

  $BeErrorCopyWith<$Res> get err;
}

/// @nodoc
class __$$BeTwoFactorResultErrImplCopyWithImpl<$Res>
    extends _$BeTwoFactorResultCopyWithImpl<$Res, _$BeTwoFactorResultErrImpl>
    implements _$$BeTwoFactorResultErrImplCopyWith<$Res> {
  __$$BeTwoFactorResultErrImplCopyWithImpl(_$BeTwoFactorResultErrImpl _value,
      $Res Function(_$BeTwoFactorResultErrImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? err = null,
  }) {
    return _then(_$BeTwoFactorResultErrImpl(
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

class _$BeTwoFactorResultErrImpl
    with DiagnosticableTreeMixin
    implements _BeTwoFactorResultErr {
  const _$BeTwoFactorResultErrImpl(this.err);

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BeTwoFactorResultErrImpl &&
            (identical(other.err, err) || other.err == err));
  }

  @override
  int get hashCode => Object.hash(runtimeType, err);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BeTwoFactorResultErrImplCopyWith<_$BeTwoFactorResultErrImpl>
      get copyWith =>
          __$$BeTwoFactorResultErrImplCopyWithImpl<_$BeTwoFactorResultErrImpl>(
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
      _$BeTwoFactorResultErrImpl;

  BeError get err;
  @JsonKey(ignore: true)
  _$$BeTwoFactorResultErrImplCopyWith<_$BeTwoFactorResultErrImpl>
      get copyWith => throw _privateConstructorUsedError;
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
abstract class _$$BeAssetResultImplCopyWith<$Res> {
  factory _$$BeAssetResultImplCopyWith(
          _$BeAssetResultImpl value, $Res Function(_$BeAssetResultImpl) then) =
      __$$BeAssetResultImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<BeAsset> assets});
}

/// @nodoc
class __$$BeAssetResultImplCopyWithImpl<$Res>
    extends _$BeAssetResultCopyWithImpl<$Res, _$BeAssetResultImpl>
    implements _$$BeAssetResultImplCopyWith<$Res> {
  __$$BeAssetResultImplCopyWithImpl(
      _$BeAssetResultImpl _value, $Res Function(_$BeAssetResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? assets = null,
  }) {
    return _then(_$BeAssetResultImpl(
      null == assets
          ? _value._assets
          : assets // ignore: cast_nullable_to_non_nullable
              as List<BeAsset>,
    ));
  }
}

/// @nodoc

class _$BeAssetResultImpl
    with DiagnosticableTreeMixin
    implements _BeAssetResult {
  const _$BeAssetResultImpl(final List<BeAsset> assets) : _assets = assets;

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BeAssetResultImpl &&
            const DeepCollectionEquality().equals(other._assets, _assets));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_assets));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BeAssetResultImplCopyWith<_$BeAssetResultImpl> get copyWith =>
      __$$BeAssetResultImplCopyWithImpl<_$BeAssetResultImpl>(this, _$identity);

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
  const factory _BeAssetResult(final List<BeAsset> assets) =
      _$BeAssetResultImpl;

  List<BeAsset> get assets;
  @JsonKey(ignore: true)
  _$$BeAssetResultImplCopyWith<_$BeAssetResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BeAssetResultErrImplCopyWith<$Res> {
  factory _$$BeAssetResultErrImplCopyWith(_$BeAssetResultErrImpl value,
          $Res Function(_$BeAssetResultErrImpl) then) =
      __$$BeAssetResultErrImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BeError err});

  $BeErrorCopyWith<$Res> get err;
}

/// @nodoc
class __$$BeAssetResultErrImplCopyWithImpl<$Res>
    extends _$BeAssetResultCopyWithImpl<$Res, _$BeAssetResultErrImpl>
    implements _$$BeAssetResultErrImplCopyWith<$Res> {
  __$$BeAssetResultErrImplCopyWithImpl(_$BeAssetResultErrImpl _value,
      $Res Function(_$BeAssetResultErrImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? err = null,
  }) {
    return _then(_$BeAssetResultErrImpl(
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

class _$BeAssetResultErrImpl
    with DiagnosticableTreeMixin
    implements _BeAssetResultErr {
  const _$BeAssetResultErrImpl(this.err);

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BeAssetResultErrImpl &&
            (identical(other.err, err) || other.err == err));
  }

  @override
  int get hashCode => Object.hash(runtimeType, err);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BeAssetResultErrImplCopyWith<_$BeAssetResultErrImpl> get copyWith =>
      __$$BeAssetResultErrImplCopyWithImpl<_$BeAssetResultErrImpl>(
          this, _$identity);

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
  const factory _BeAssetResultErr(final BeError err) = _$BeAssetResultErrImpl;

  BeError get err;
  @JsonKey(ignore: true)
  _$$BeAssetResultErrImplCopyWith<_$BeAssetResultErrImpl> get copyWith =>
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
abstract class _$$BeMarketResultImplCopyWith<$Res> {
  factory _$$BeMarketResultImplCopyWith(_$BeMarketResultImpl value,
          $Res Function(_$BeMarketResultImpl) then) =
      __$$BeMarketResultImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<BeMarket> markets});
}

/// @nodoc
class __$$BeMarketResultImplCopyWithImpl<$Res>
    extends _$BeMarketResultCopyWithImpl<$Res, _$BeMarketResultImpl>
    implements _$$BeMarketResultImplCopyWith<$Res> {
  __$$BeMarketResultImplCopyWithImpl(
      _$BeMarketResultImpl _value, $Res Function(_$BeMarketResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? markets = null,
  }) {
    return _then(_$BeMarketResultImpl(
      null == markets
          ? _value._markets
          : markets // ignore: cast_nullable_to_non_nullable
              as List<BeMarket>,
    ));
  }
}

/// @nodoc

class _$BeMarketResultImpl
    with DiagnosticableTreeMixin
    implements _BeMarketResult {
  const _$BeMarketResultImpl(final List<BeMarket> markets) : _markets = markets;

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BeMarketResultImpl &&
            const DeepCollectionEquality().equals(other._markets, _markets));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_markets));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BeMarketResultImplCopyWith<_$BeMarketResultImpl> get copyWith =>
      __$$BeMarketResultImplCopyWithImpl<_$BeMarketResultImpl>(
          this, _$identity);

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
      _$BeMarketResultImpl;

  List<BeMarket> get markets;
  @JsonKey(ignore: true)
  _$$BeMarketResultImplCopyWith<_$BeMarketResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BeMarketResultErrImplCopyWith<$Res> {
  factory _$$BeMarketResultErrImplCopyWith(_$BeMarketResultErrImpl value,
          $Res Function(_$BeMarketResultErrImpl) then) =
      __$$BeMarketResultErrImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BeError err});

  $BeErrorCopyWith<$Res> get err;
}

/// @nodoc
class __$$BeMarketResultErrImplCopyWithImpl<$Res>
    extends _$BeMarketResultCopyWithImpl<$Res, _$BeMarketResultErrImpl>
    implements _$$BeMarketResultErrImplCopyWith<$Res> {
  __$$BeMarketResultErrImplCopyWithImpl(_$BeMarketResultErrImpl _value,
      $Res Function(_$BeMarketResultErrImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? err = null,
  }) {
    return _then(_$BeMarketResultErrImpl(
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

class _$BeMarketResultErrImpl
    with DiagnosticableTreeMixin
    implements _BeMarketResultErr {
  const _$BeMarketResultErrImpl(this.err);

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BeMarketResultErrImpl &&
            (identical(other.err, err) || other.err == err));
  }

  @override
  int get hashCode => Object.hash(runtimeType, err);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BeMarketResultErrImplCopyWith<_$BeMarketResultErrImpl> get copyWith =>
      __$$BeMarketResultErrImplCopyWithImpl<_$BeMarketResultErrImpl>(
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
  const factory _BeMarketResultErr(final BeError err) = _$BeMarketResultErrImpl;

  BeError get err;
  @JsonKey(ignore: true)
  _$$BeMarketResultErrImplCopyWith<_$BeMarketResultErrImpl> get copyWith =>
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
abstract class _$$BeOrderbookResultImplCopyWith<$Res> {
  factory _$$BeOrderbookResultImplCopyWith(_$BeOrderbookResultImpl value,
          $Res Function(_$BeOrderbookResultImpl) then) =
      __$$BeOrderbookResultImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BeOrderbook orderbook});
}

/// @nodoc
class __$$BeOrderbookResultImplCopyWithImpl<$Res>
    extends _$BeOrderbookResultCopyWithImpl<$Res, _$BeOrderbookResultImpl>
    implements _$$BeOrderbookResultImplCopyWith<$Res> {
  __$$BeOrderbookResultImplCopyWithImpl(_$BeOrderbookResultImpl _value,
      $Res Function(_$BeOrderbookResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderbook = null,
  }) {
    return _then(_$BeOrderbookResultImpl(
      null == orderbook
          ? _value.orderbook
          : orderbook // ignore: cast_nullable_to_non_nullable
              as BeOrderbook,
    ));
  }
}

/// @nodoc

class _$BeOrderbookResultImpl
    with DiagnosticableTreeMixin
    implements _BeOrderbookResult {
  const _$BeOrderbookResultImpl(this.orderbook);

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BeOrderbookResultImpl &&
            (identical(other.orderbook, orderbook) ||
                other.orderbook == orderbook));
  }

  @override
  int get hashCode => Object.hash(runtimeType, orderbook);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BeOrderbookResultImplCopyWith<_$BeOrderbookResultImpl> get copyWith =>
      __$$BeOrderbookResultImplCopyWithImpl<_$BeOrderbookResultImpl>(
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
      _$BeOrderbookResultImpl;

  BeOrderbook get orderbook;
  @JsonKey(ignore: true)
  _$$BeOrderbookResultImplCopyWith<_$BeOrderbookResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BeOrderbookResultErrImplCopyWith<$Res> {
  factory _$$BeOrderbookResultErrImplCopyWith(_$BeOrderbookResultErrImpl value,
          $Res Function(_$BeOrderbookResultErrImpl) then) =
      __$$BeOrderbookResultErrImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BeError err});

  $BeErrorCopyWith<$Res> get err;
}

/// @nodoc
class __$$BeOrderbookResultErrImplCopyWithImpl<$Res>
    extends _$BeOrderbookResultCopyWithImpl<$Res, _$BeOrderbookResultErrImpl>
    implements _$$BeOrderbookResultErrImplCopyWith<$Res> {
  __$$BeOrderbookResultErrImplCopyWithImpl(_$BeOrderbookResultErrImpl _value,
      $Res Function(_$BeOrderbookResultErrImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? err = null,
  }) {
    return _then(_$BeOrderbookResultErrImpl(
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

class _$BeOrderbookResultErrImpl
    with DiagnosticableTreeMixin
    implements _BeOrderbookResultErr {
  const _$BeOrderbookResultErrImpl(this.err);

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BeOrderbookResultErrImpl &&
            (identical(other.err, err) || other.err == err));
  }

  @override
  int get hashCode => Object.hash(runtimeType, err);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BeOrderbookResultErrImplCopyWith<_$BeOrderbookResultErrImpl>
      get copyWith =>
          __$$BeOrderbookResultErrImplCopyWithImpl<_$BeOrderbookResultErrImpl>(
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
      _$BeOrderbookResultErrImpl;

  BeError get err;
  @JsonKey(ignore: true)
  _$$BeOrderbookResultErrImplCopyWith<_$BeOrderbookResultErrImpl>
      get copyWith => throw _privateConstructorUsedError;
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
abstract class _$$BeBalancesResultImplCopyWith<$Res> {
  factory _$$BeBalancesResultImplCopyWith(_$BeBalancesResultImpl value,
          $Res Function(_$BeBalancesResultImpl) then) =
      __$$BeBalancesResultImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<BeBalance> balances});
}

/// @nodoc
class __$$BeBalancesResultImplCopyWithImpl<$Res>
    extends _$BeBalancesResultCopyWithImpl<$Res, _$BeBalancesResultImpl>
    implements _$$BeBalancesResultImplCopyWith<$Res> {
  __$$BeBalancesResultImplCopyWithImpl(_$BeBalancesResultImpl _value,
      $Res Function(_$BeBalancesResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? balances = null,
  }) {
    return _then(_$BeBalancesResultImpl(
      null == balances
          ? _value._balances
          : balances // ignore: cast_nullable_to_non_nullable
              as List<BeBalance>,
    ));
  }
}

/// @nodoc

class _$BeBalancesResultImpl
    with DiagnosticableTreeMixin
    implements _BeBalancesResult {
  const _$BeBalancesResultImpl(final List<BeBalance> balances)
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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BeBalancesResultImpl &&
            const DeepCollectionEquality().equals(other._balances, _balances));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_balances));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BeBalancesResultImplCopyWith<_$BeBalancesResultImpl> get copyWith =>
      __$$BeBalancesResultImplCopyWithImpl<_$BeBalancesResultImpl>(
          this, _$identity);

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
      _$BeBalancesResultImpl;

  List<BeBalance> get balances;
  @JsonKey(ignore: true)
  _$$BeBalancesResultImplCopyWith<_$BeBalancesResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BeBalancesResultErrImplCopyWith<$Res> {
  factory _$$BeBalancesResultErrImplCopyWith(_$BeBalancesResultErrImpl value,
          $Res Function(_$BeBalancesResultErrImpl) then) =
      __$$BeBalancesResultErrImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BeError err});

  $BeErrorCopyWith<$Res> get err;
}

/// @nodoc
class __$$BeBalancesResultErrImplCopyWithImpl<$Res>
    extends _$BeBalancesResultCopyWithImpl<$Res, _$BeBalancesResultErrImpl>
    implements _$$BeBalancesResultErrImplCopyWith<$Res> {
  __$$BeBalancesResultErrImplCopyWithImpl(_$BeBalancesResultErrImpl _value,
      $Res Function(_$BeBalancesResultErrImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? err = null,
  }) {
    return _then(_$BeBalancesResultErrImpl(
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

class _$BeBalancesResultErrImpl
    with DiagnosticableTreeMixin
    implements _BeBalancesResultErr {
  const _$BeBalancesResultErrImpl(this.err);

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BeBalancesResultErrImpl &&
            (identical(other.err, err) || other.err == err));
  }

  @override
  int get hashCode => Object.hash(runtimeType, err);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BeBalancesResultErrImplCopyWith<_$BeBalancesResultErrImpl> get copyWith =>
      __$$BeBalancesResultErrImplCopyWithImpl<_$BeBalancesResultErrImpl>(
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
      _$BeBalancesResultErrImpl;

  BeError get err;
  @JsonKey(ignore: true)
  _$$BeBalancesResultErrImplCopyWith<_$BeBalancesResultErrImpl> get copyWith =>
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
abstract class _$$BeBalanceResultImplCopyWith<$Res> {
  factory _$$BeBalanceResultImplCopyWith(_$BeBalanceResultImpl value,
          $Res Function(_$BeBalanceResultImpl) then) =
      __$$BeBalanceResultImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BeBalance? balance});
}

/// @nodoc
class __$$BeBalanceResultImplCopyWithImpl<$Res>
    extends _$BeBalanceResultCopyWithImpl<$Res, _$BeBalanceResultImpl>
    implements _$$BeBalanceResultImplCopyWith<$Res> {
  __$$BeBalanceResultImplCopyWithImpl(
      _$BeBalanceResultImpl _value, $Res Function(_$BeBalanceResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? balance = freezed,
  }) {
    return _then(_$BeBalanceResultImpl(
      freezed == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as BeBalance?,
    ));
  }
}

/// @nodoc

class _$BeBalanceResultImpl
    with DiagnosticableTreeMixin
    implements _BeBalanceResult {
  const _$BeBalanceResultImpl(this.balance);

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BeBalanceResultImpl &&
            (identical(other.balance, balance) || other.balance == balance));
  }

  @override
  int get hashCode => Object.hash(runtimeType, balance);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BeBalanceResultImplCopyWith<_$BeBalanceResultImpl> get copyWith =>
      __$$BeBalanceResultImplCopyWithImpl<_$BeBalanceResultImpl>(
          this, _$identity);

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
  const factory _BeBalanceResult(final BeBalance? balance) =
      _$BeBalanceResultImpl;

  BeBalance? get balance;
  @JsonKey(ignore: true)
  _$$BeBalanceResultImplCopyWith<_$BeBalanceResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BeBalanceResultErrImplCopyWith<$Res> {
  factory _$$BeBalanceResultErrImplCopyWith(_$BeBalanceResultErrImpl value,
          $Res Function(_$BeBalanceResultErrImpl) then) =
      __$$BeBalanceResultErrImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BeError err});

  $BeErrorCopyWith<$Res> get err;
}

/// @nodoc
class __$$BeBalanceResultErrImplCopyWithImpl<$Res>
    extends _$BeBalanceResultCopyWithImpl<$Res, _$BeBalanceResultErrImpl>
    implements _$$BeBalanceResultErrImplCopyWith<$Res> {
  __$$BeBalanceResultErrImplCopyWithImpl(_$BeBalanceResultErrImpl _value,
      $Res Function(_$BeBalanceResultErrImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? err = null,
  }) {
    return _then(_$BeBalanceResultErrImpl(
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

class _$BeBalanceResultErrImpl
    with DiagnosticableTreeMixin
    implements _BeBalanceResultErr {
  const _$BeBalanceResultErrImpl(this.err);

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BeBalanceResultErrImpl &&
            (identical(other.err, err) || other.err == err));
  }

  @override
  int get hashCode => Object.hash(runtimeType, err);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BeBalanceResultErrImplCopyWith<_$BeBalanceResultErrImpl> get copyWith =>
      __$$BeBalanceResultErrImplCopyWithImpl<_$BeBalanceResultErrImpl>(
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
  const factory _BeBalanceResultErr(final BeError err) =
      _$BeBalanceResultErrImpl;

  BeError get err;
  @JsonKey(ignore: true)
  _$$BeBalanceResultErrImplCopyWith<_$BeBalanceResultErrImpl> get copyWith =>
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
abstract class _$$BeCryptoDepositRecipientResultImplCopyWith<$Res> {
  factory _$$BeCryptoDepositRecipientResultImplCopyWith(
          _$BeCryptoDepositRecipientResultImpl value,
          $Res Function(_$BeCryptoDepositRecipientResultImpl) then) =
      __$$BeCryptoDepositRecipientResultImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String recipient, String asset, String? l2Network});
}

/// @nodoc
class __$$BeCryptoDepositRecipientResultImplCopyWithImpl<$Res>
    extends _$BeCryptoDepositRecipientResultCopyWithImpl<$Res,
        _$BeCryptoDepositRecipientResultImpl>
    implements _$$BeCryptoDepositRecipientResultImplCopyWith<$Res> {
  __$$BeCryptoDepositRecipientResultImplCopyWithImpl(
      _$BeCryptoDepositRecipientResultImpl _value,
      $Res Function(_$BeCryptoDepositRecipientResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recipient = null,
    Object? asset = null,
    Object? l2Network = freezed,
  }) {
    return _then(_$BeCryptoDepositRecipientResultImpl(
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

class _$BeCryptoDepositRecipientResultImpl
    with DiagnosticableTreeMixin
    implements _BeCryptoDepositRecipientResult {
  const _$BeCryptoDepositRecipientResultImpl(
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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BeCryptoDepositRecipientResultImpl &&
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
  _$$BeCryptoDepositRecipientResultImplCopyWith<
          _$BeCryptoDepositRecipientResultImpl>
      get copyWith => __$$BeCryptoDepositRecipientResultImplCopyWithImpl<
          _$BeCryptoDepositRecipientResultImpl>(this, _$identity);

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
      _$BeCryptoDepositRecipientResultImpl;

  String get recipient;
  String get asset;
  String? get l2Network;
  @JsonKey(ignore: true)
  _$$BeCryptoDepositRecipientResultImplCopyWith<
          _$BeCryptoDepositRecipientResultImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BeCryptoDepositRecipientResultErrImplCopyWith<$Res> {
  factory _$$BeCryptoDepositRecipientResultErrImplCopyWith(
          _$BeCryptoDepositRecipientResultErrImpl value,
          $Res Function(_$BeCryptoDepositRecipientResultErrImpl) then) =
      __$$BeCryptoDepositRecipientResultErrImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BeError err});

  $BeErrorCopyWith<$Res> get err;
}

/// @nodoc
class __$$BeCryptoDepositRecipientResultErrImplCopyWithImpl<$Res>
    extends _$BeCryptoDepositRecipientResultCopyWithImpl<$Res,
        _$BeCryptoDepositRecipientResultErrImpl>
    implements _$$BeCryptoDepositRecipientResultErrImplCopyWith<$Res> {
  __$$BeCryptoDepositRecipientResultErrImplCopyWithImpl(
      _$BeCryptoDepositRecipientResultErrImpl _value,
      $Res Function(_$BeCryptoDepositRecipientResultErrImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? err = null,
  }) {
    return _then(_$BeCryptoDepositRecipientResultErrImpl(
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

class _$BeCryptoDepositRecipientResultErrImpl
    with DiagnosticableTreeMixin
    implements _BeCryptoDepositRecipientResultErr {
  const _$BeCryptoDepositRecipientResultErrImpl(this.err);

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BeCryptoDepositRecipientResultErrImpl &&
            (identical(other.err, err) || other.err == err));
  }

  @override
  int get hashCode => Object.hash(runtimeType, err);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BeCryptoDepositRecipientResultErrImplCopyWith<
          _$BeCryptoDepositRecipientResultErrImpl>
      get copyWith => __$$BeCryptoDepositRecipientResultErrImplCopyWithImpl<
          _$BeCryptoDepositRecipientResultErrImpl>(this, _$identity);

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
      _$BeCryptoDepositRecipientResultErrImpl;

  BeError get err;
  @JsonKey(ignore: true)
  _$$BeCryptoDepositRecipientResultErrImplCopyWith<
          _$BeCryptoDepositRecipientResultErrImpl>
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
abstract class _$$BeFiatAccountNumberResultImplCopyWith<$Res> {
  factory _$$BeFiatAccountNumberResultImplCopyWith(
          _$BeFiatAccountNumberResultImpl value,
          $Res Function(_$BeFiatAccountNumberResultImpl) then) =
      __$$BeFiatAccountNumberResultImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BeFiatAccountNumber accountNumber});
}

/// @nodoc
class __$$BeFiatAccountNumberResultImplCopyWithImpl<$Res>
    extends _$BeFiatAccountNumberResultCopyWithImpl<$Res,
        _$BeFiatAccountNumberResultImpl>
    implements _$$BeFiatAccountNumberResultImplCopyWith<$Res> {
  __$$BeFiatAccountNumberResultImplCopyWithImpl(
      _$BeFiatAccountNumberResultImpl _value,
      $Res Function(_$BeFiatAccountNumberResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountNumber = null,
  }) {
    return _then(_$BeFiatAccountNumberResultImpl(
      null == accountNumber
          ? _value.accountNumber
          : accountNumber // ignore: cast_nullable_to_non_nullable
              as BeFiatAccountNumber,
    ));
  }
}

/// @nodoc

class _$BeFiatAccountNumberResultImpl
    with DiagnosticableTreeMixin
    implements _BeFiatAccountNumberResult {
  const _$BeFiatAccountNumberResultImpl(this.accountNumber);

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BeFiatAccountNumberResultImpl &&
            (identical(other.accountNumber, accountNumber) ||
                other.accountNumber == accountNumber));
  }

  @override
  int get hashCode => Object.hash(runtimeType, accountNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BeFiatAccountNumberResultImplCopyWith<_$BeFiatAccountNumberResultImpl>
      get copyWith => __$$BeFiatAccountNumberResultImplCopyWithImpl<
          _$BeFiatAccountNumberResultImpl>(this, _$identity);

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
          final BeFiatAccountNumber accountNumber) =
      _$BeFiatAccountNumberResultImpl;

  BeFiatAccountNumber get accountNumber;
  @JsonKey(ignore: true)
  _$$BeFiatAccountNumberResultImplCopyWith<_$BeFiatAccountNumberResultImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BeFiatAccountNumberResultErrImplCopyWith<$Res> {
  factory _$$BeFiatAccountNumberResultErrImplCopyWith(
          _$BeFiatAccountNumberResultErrImpl value,
          $Res Function(_$BeFiatAccountNumberResultErrImpl) then) =
      __$$BeFiatAccountNumberResultErrImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BeError err});

  $BeErrorCopyWith<$Res> get err;
}

/// @nodoc
class __$$BeFiatAccountNumberResultErrImplCopyWithImpl<$Res>
    extends _$BeFiatAccountNumberResultCopyWithImpl<$Res,
        _$BeFiatAccountNumberResultErrImpl>
    implements _$$BeFiatAccountNumberResultErrImplCopyWith<$Res> {
  __$$BeFiatAccountNumberResultErrImplCopyWithImpl(
      _$BeFiatAccountNumberResultErrImpl _value,
      $Res Function(_$BeFiatAccountNumberResultErrImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? err = null,
  }) {
    return _then(_$BeFiatAccountNumberResultErrImpl(
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

class _$BeFiatAccountNumberResultErrImpl
    with DiagnosticableTreeMixin
    implements _BeFiatAccountNumberResultErr {
  const _$BeFiatAccountNumberResultErrImpl(this.err);

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BeFiatAccountNumberResultErrImpl &&
            (identical(other.err, err) || other.err == err));
  }

  @override
  int get hashCode => Object.hash(runtimeType, err);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BeFiatAccountNumberResultErrImplCopyWith<
          _$BeFiatAccountNumberResultErrImpl>
      get copyWith => __$$BeFiatAccountNumberResultErrImplCopyWithImpl<
          _$BeFiatAccountNumberResultErrImpl>(this, _$identity);

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
      _$BeFiatAccountNumberResultErrImpl;

  BeError get err;
  @JsonKey(ignore: true)
  _$$BeFiatAccountNumberResultErrImplCopyWith<
          _$BeFiatAccountNumberResultErrImpl>
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
abstract class _$$BeDepositResultImplCopyWith<$Res> {
  factory _$$BeDepositResultImplCopyWith(_$BeDepositResultImpl value,
          $Res Function(_$BeDepositResultImpl) then) =
      __$$BeDepositResultImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BeBalanceUpdate deposit});
}

/// @nodoc
class __$$BeDepositResultImplCopyWithImpl<$Res>
    extends _$BeDepositResultCopyWithImpl<$Res, _$BeDepositResultImpl>
    implements _$$BeDepositResultImplCopyWith<$Res> {
  __$$BeDepositResultImplCopyWithImpl(
      _$BeDepositResultImpl _value, $Res Function(_$BeDepositResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deposit = null,
  }) {
    return _then(_$BeDepositResultImpl(
      null == deposit
          ? _value.deposit
          : deposit // ignore: cast_nullable_to_non_nullable
              as BeBalanceUpdate,
    ));
  }
}

/// @nodoc

class _$BeDepositResultImpl
    with DiagnosticableTreeMixin
    implements _BeDepositResult {
  const _$BeDepositResultImpl(this.deposit);

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BeDepositResultImpl &&
            (identical(other.deposit, deposit) || other.deposit == deposit));
  }

  @override
  int get hashCode => Object.hash(runtimeType, deposit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BeDepositResultImplCopyWith<_$BeDepositResultImpl> get copyWith =>
      __$$BeDepositResultImplCopyWithImpl<_$BeDepositResultImpl>(
          this, _$identity);

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
      _$BeDepositResultImpl;

  BeBalanceUpdate get deposit;
  @JsonKey(ignore: true)
  _$$BeDepositResultImplCopyWith<_$BeDepositResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BeFiatDepositResultErrImplCopyWith<$Res> {
  factory _$$BeFiatDepositResultErrImplCopyWith(
          _$BeFiatDepositResultErrImpl value,
          $Res Function(_$BeFiatDepositResultErrImpl) then) =
      __$$BeFiatDepositResultErrImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BeError err});

  $BeErrorCopyWith<$Res> get err;
}

/// @nodoc
class __$$BeFiatDepositResultErrImplCopyWithImpl<$Res>
    extends _$BeDepositResultCopyWithImpl<$Res, _$BeFiatDepositResultErrImpl>
    implements _$$BeFiatDepositResultErrImplCopyWith<$Res> {
  __$$BeFiatDepositResultErrImplCopyWithImpl(
      _$BeFiatDepositResultErrImpl _value,
      $Res Function(_$BeFiatDepositResultErrImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? err = null,
  }) {
    return _then(_$BeFiatDepositResultErrImpl(
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

class _$BeFiatDepositResultErrImpl
    with DiagnosticableTreeMixin
    implements _BeFiatDepositResultErr {
  const _$BeFiatDepositResultErrImpl(this.err);

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BeFiatDepositResultErrImpl &&
            (identical(other.err, err) || other.err == err));
  }

  @override
  int get hashCode => Object.hash(runtimeType, err);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BeFiatDepositResultErrImplCopyWith<_$BeFiatDepositResultErrImpl>
      get copyWith => __$$BeFiatDepositResultErrImplCopyWithImpl<
          _$BeFiatDepositResultErrImpl>(this, _$identity);

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
      _$BeFiatDepositResultErrImpl;

  BeError get err;
  @JsonKey(ignore: true)
  _$$BeFiatDepositResultErrImplCopyWith<_$BeFiatDepositResultErrImpl>
      get copyWith => throw _privateConstructorUsedError;
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
abstract class _$$BeDepositsResultImplCopyWith<$Res> {
  factory _$$BeDepositsResultImplCopyWith(_$BeDepositsResultImpl value,
          $Res Function(_$BeDepositsResultImpl) then) =
      __$$BeDepositsResultImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<BeBalanceUpdate> deposits, int offset, int limit, int total});
}

/// @nodoc
class __$$BeDepositsResultImplCopyWithImpl<$Res>
    extends _$BeDepositsResultCopyWithImpl<$Res, _$BeDepositsResultImpl>
    implements _$$BeDepositsResultImplCopyWith<$Res> {
  __$$BeDepositsResultImplCopyWithImpl(_$BeDepositsResultImpl _value,
      $Res Function(_$BeDepositsResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deposits = null,
    Object? offset = null,
    Object? limit = null,
    Object? total = null,
  }) {
    return _then(_$BeDepositsResultImpl(
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

class _$BeDepositsResultImpl
    with DiagnosticableTreeMixin
    implements _BeDepositsResult {
  const _$BeDepositsResultImpl(
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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BeDepositsResultImpl &&
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
  _$$BeDepositsResultImplCopyWith<_$BeDepositsResultImpl> get copyWith =>
      __$$BeDepositsResultImplCopyWithImpl<_$BeDepositsResultImpl>(
          this, _$identity);

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
  const factory _BeDepositsResult(
      final List<BeBalanceUpdate> deposits,
      final int offset,
      final int limit,
      final int total) = _$BeDepositsResultImpl;

  List<BeBalanceUpdate> get deposits;
  int get offset;
  int get limit;
  int get total;
  @JsonKey(ignore: true)
  _$$BeDepositsResultImplCopyWith<_$BeDepositsResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BeDepositsResultErrImplCopyWith<$Res> {
  factory _$$BeDepositsResultErrImplCopyWith(_$BeDepositsResultErrImpl value,
          $Res Function(_$BeDepositsResultErrImpl) then) =
      __$$BeDepositsResultErrImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BeError err});

  $BeErrorCopyWith<$Res> get err;
}

/// @nodoc
class __$$BeDepositsResultErrImplCopyWithImpl<$Res>
    extends _$BeDepositsResultCopyWithImpl<$Res, _$BeDepositsResultErrImpl>
    implements _$$BeDepositsResultErrImplCopyWith<$Res> {
  __$$BeDepositsResultErrImplCopyWithImpl(_$BeDepositsResultErrImpl _value,
      $Res Function(_$BeDepositsResultErrImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? err = null,
  }) {
    return _then(_$BeDepositsResultErrImpl(
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

class _$BeDepositsResultErrImpl
    with DiagnosticableTreeMixin
    implements _BeDepositsResultErr {
  const _$BeDepositsResultErrImpl(this.err);

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BeDepositsResultErrImpl &&
            (identical(other.err, err) || other.err == err));
  }

  @override
  int get hashCode => Object.hash(runtimeType, err);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BeDepositsResultErrImplCopyWith<_$BeDepositsResultErrImpl> get copyWith =>
      __$$BeDepositsResultErrImplCopyWithImpl<_$BeDepositsResultErrImpl>(
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
      _$BeDepositsResultErrImpl;

  BeError get err;
  @JsonKey(ignore: true)
  _$$BeDepositsResultErrImplCopyWith<_$BeDepositsResultErrImpl> get copyWith =>
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
abstract class _$$BeWithdrawalResultImplCopyWith<$Res> {
  factory _$$BeWithdrawalResultImplCopyWith(_$BeWithdrawalResultImpl value,
          $Res Function(_$BeWithdrawalResultImpl) then) =
      __$$BeWithdrawalResultImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BeBalanceUpdate withdrawal});
}

/// @nodoc
class __$$BeWithdrawalResultImplCopyWithImpl<$Res>
    extends _$BeWithdrawalResultCopyWithImpl<$Res, _$BeWithdrawalResultImpl>
    implements _$$BeWithdrawalResultImplCopyWith<$Res> {
  __$$BeWithdrawalResultImplCopyWithImpl(_$BeWithdrawalResultImpl _value,
      $Res Function(_$BeWithdrawalResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? withdrawal = null,
  }) {
    return _then(_$BeWithdrawalResultImpl(
      null == withdrawal
          ? _value.withdrawal
          : withdrawal // ignore: cast_nullable_to_non_nullable
              as BeBalanceUpdate,
    ));
  }
}

/// @nodoc

class _$BeWithdrawalResultImpl
    with DiagnosticableTreeMixin
    implements _BeWithdrawalResult {
  const _$BeWithdrawalResultImpl(this.withdrawal);

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BeWithdrawalResultImpl &&
            (identical(other.withdrawal, withdrawal) ||
                other.withdrawal == withdrawal));
  }

  @override
  int get hashCode => Object.hash(runtimeType, withdrawal);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BeWithdrawalResultImplCopyWith<_$BeWithdrawalResultImpl> get copyWith =>
      __$$BeWithdrawalResultImplCopyWithImpl<_$BeWithdrawalResultImpl>(
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
      _$BeWithdrawalResultImpl;

  BeBalanceUpdate get withdrawal;
  @JsonKey(ignore: true)
  _$$BeWithdrawalResultImplCopyWith<_$BeWithdrawalResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BeWithdrawalResultErrImplCopyWith<$Res> {
  factory _$$BeWithdrawalResultErrImplCopyWith(
          _$BeWithdrawalResultErrImpl value,
          $Res Function(_$BeWithdrawalResultErrImpl) then) =
      __$$BeWithdrawalResultErrImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BeError err});

  $BeErrorCopyWith<$Res> get err;
}

/// @nodoc
class __$$BeWithdrawalResultErrImplCopyWithImpl<$Res>
    extends _$BeWithdrawalResultCopyWithImpl<$Res, _$BeWithdrawalResultErrImpl>
    implements _$$BeWithdrawalResultErrImplCopyWith<$Res> {
  __$$BeWithdrawalResultErrImplCopyWithImpl(_$BeWithdrawalResultErrImpl _value,
      $Res Function(_$BeWithdrawalResultErrImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? err = null,
  }) {
    return _then(_$BeWithdrawalResultErrImpl(
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

class _$BeWithdrawalResultErrImpl
    with DiagnosticableTreeMixin
    implements _BeWithdrawalResultErr {
  const _$BeWithdrawalResultErrImpl(this.err);

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BeWithdrawalResultErrImpl &&
            (identical(other.err, err) || other.err == err));
  }

  @override
  int get hashCode => Object.hash(runtimeType, err);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BeWithdrawalResultErrImplCopyWith<_$BeWithdrawalResultErrImpl>
      get copyWith => __$$BeWithdrawalResultErrImplCopyWithImpl<
          _$BeWithdrawalResultErrImpl>(this, _$identity);

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
      _$BeWithdrawalResultErrImpl;

  BeError get err;
  @JsonKey(ignore: true)
  _$$BeWithdrawalResultErrImplCopyWith<_$BeWithdrawalResultErrImpl>
      get copyWith => throw _privateConstructorUsedError;
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
abstract class _$$BeWithdrawalsResultImplCopyWith<$Res> {
  factory _$$BeWithdrawalsResultImplCopyWith(_$BeWithdrawalsResultImpl value,
          $Res Function(_$BeWithdrawalsResultImpl) then) =
      __$$BeWithdrawalsResultImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<BeBalanceUpdate> withdrawals, int offset, int limit, int total});
}

/// @nodoc
class __$$BeWithdrawalsResultImplCopyWithImpl<$Res>
    extends _$BeWithdrawalsResultCopyWithImpl<$Res, _$BeWithdrawalsResultImpl>
    implements _$$BeWithdrawalsResultImplCopyWith<$Res> {
  __$$BeWithdrawalsResultImplCopyWithImpl(_$BeWithdrawalsResultImpl _value,
      $Res Function(_$BeWithdrawalsResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? withdrawals = null,
    Object? offset = null,
    Object? limit = null,
    Object? total = null,
  }) {
    return _then(_$BeWithdrawalsResultImpl(
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

class _$BeWithdrawalsResultImpl
    with DiagnosticableTreeMixin
    implements _BeWithdrawalsResult {
  const _$BeWithdrawalsResultImpl(final List<BeBalanceUpdate> withdrawals,
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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BeWithdrawalsResultImpl &&
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
  _$$BeWithdrawalsResultImplCopyWith<_$BeWithdrawalsResultImpl> get copyWith =>
      __$$BeWithdrawalsResultImplCopyWithImpl<_$BeWithdrawalsResultImpl>(
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
      final int total) = _$BeWithdrawalsResultImpl;

  List<BeBalanceUpdate> get withdrawals;
  int get offset;
  int get limit;
  int get total;
  @JsonKey(ignore: true)
  _$$BeWithdrawalsResultImplCopyWith<_$BeWithdrawalsResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BeWithdrawalsResultErrImplCopyWith<$Res> {
  factory _$$BeWithdrawalsResultErrImplCopyWith(
          _$BeWithdrawalsResultErrImpl value,
          $Res Function(_$BeWithdrawalsResultErrImpl) then) =
      __$$BeWithdrawalsResultErrImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BeError err});

  $BeErrorCopyWith<$Res> get err;
}

/// @nodoc
class __$$BeWithdrawalsResultErrImplCopyWithImpl<$Res>
    extends _$BeWithdrawalsResultCopyWithImpl<$Res,
        _$BeWithdrawalsResultErrImpl>
    implements _$$BeWithdrawalsResultErrImplCopyWith<$Res> {
  __$$BeWithdrawalsResultErrImplCopyWithImpl(
      _$BeWithdrawalsResultErrImpl _value,
      $Res Function(_$BeWithdrawalsResultErrImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? err = null,
  }) {
    return _then(_$BeWithdrawalsResultErrImpl(
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

class _$BeWithdrawalsResultErrImpl
    with DiagnosticableTreeMixin
    implements _BeWithdrawalsResultErr {
  const _$BeWithdrawalsResultErrImpl(this.err);

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BeWithdrawalsResultErrImpl &&
            (identical(other.err, err) || other.err == err));
  }

  @override
  int get hashCode => Object.hash(runtimeType, err);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BeWithdrawalsResultErrImplCopyWith<_$BeWithdrawalsResultErrImpl>
      get copyWith => __$$BeWithdrawalsResultErrImplCopyWithImpl<
          _$BeWithdrawalsResultErrImpl>(this, _$identity);

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
      _$BeWithdrawalsResultErrImpl;

  BeError get err;
  @JsonKey(ignore: true)
  _$$BeWithdrawalsResultErrImplCopyWith<_$BeWithdrawalsResultErrImpl>
      get copyWith => throw _privateConstructorUsedError;
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
abstract class _$$BeAddressBookResultImplCopyWith<$Res> {
  factory _$$BeAddressBookResultImplCopyWith(_$BeAddressBookResultImpl value,
          $Res Function(_$BeAddressBookResultImpl) then) =
      __$$BeAddressBookResultImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<BeAddressBookEntry> entries});
}

/// @nodoc
class __$$BeAddressBookResultImplCopyWithImpl<$Res>
    extends _$BeAddressBookResultCopyWithImpl<$Res, _$BeAddressBookResultImpl>
    implements _$$BeAddressBookResultImplCopyWith<$Res> {
  __$$BeAddressBookResultImplCopyWithImpl(_$BeAddressBookResultImpl _value,
      $Res Function(_$BeAddressBookResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entries = null,
  }) {
    return _then(_$BeAddressBookResultImpl(
      null == entries
          ? _value._entries
          : entries // ignore: cast_nullable_to_non_nullable
              as List<BeAddressBookEntry>,
    ));
  }
}

/// @nodoc

class _$BeAddressBookResultImpl
    with DiagnosticableTreeMixin
    implements _BeAddressBookResult {
  const _$BeAddressBookResultImpl(final List<BeAddressBookEntry> entries)
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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BeAddressBookResultImpl &&
            const DeepCollectionEquality().equals(other._entries, _entries));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_entries));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BeAddressBookResultImplCopyWith<_$BeAddressBookResultImpl> get copyWith =>
      __$$BeAddressBookResultImplCopyWithImpl<_$BeAddressBookResultImpl>(
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
      _$BeAddressBookResultImpl;

  List<BeAddressBookEntry> get entries;
  @JsonKey(ignore: true)
  _$$BeAddressBookResultImplCopyWith<_$BeAddressBookResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BeAddressBookResultErrImplCopyWith<$Res> {
  factory _$$BeAddressBookResultErrImplCopyWith(
          _$BeAddressBookResultErrImpl value,
          $Res Function(_$BeAddressBookResultErrImpl) then) =
      __$$BeAddressBookResultErrImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BeError err});

  $BeErrorCopyWith<$Res> get err;
}

/// @nodoc
class __$$BeAddressBookResultErrImplCopyWithImpl<$Res>
    extends _$BeAddressBookResultCopyWithImpl<$Res,
        _$BeAddressBookResultErrImpl>
    implements _$$BeAddressBookResultErrImplCopyWith<$Res> {
  __$$BeAddressBookResultErrImplCopyWithImpl(
      _$BeAddressBookResultErrImpl _value,
      $Res Function(_$BeAddressBookResultErrImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? err = null,
  }) {
    return _then(_$BeAddressBookResultErrImpl(
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

class _$BeAddressBookResultErrImpl
    with DiagnosticableTreeMixin
    implements _BeAddressBookResultErr {
  const _$BeAddressBookResultErrImpl(this.err);

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BeAddressBookResultErrImpl &&
            (identical(other.err, err) || other.err == err));
  }

  @override
  int get hashCode => Object.hash(runtimeType, err);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BeAddressBookResultErrImplCopyWith<_$BeAddressBookResultErrImpl>
      get copyWith => __$$BeAddressBookResultErrImplCopyWithImpl<
          _$BeAddressBookResultErrImpl>(this, _$identity);

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
      _$BeAddressBookResultErrImpl;

  BeError get err;
  @JsonKey(ignore: true)
  _$$BeAddressBookResultErrImplCopyWith<_$BeAddressBookResultErrImpl>
      get copyWith => throw _privateConstructorUsedError;
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
abstract class _$$BeBrokerOrderResultImplCopyWith<$Res> {
  factory _$$BeBrokerOrderResultImplCopyWith(_$BeBrokerOrderResultImpl value,
          $Res Function(_$BeBrokerOrderResultImpl) then) =
      __$$BeBrokerOrderResultImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BeBrokerOrder order});
}

/// @nodoc
class __$$BeBrokerOrderResultImplCopyWithImpl<$Res>
    extends _$BeBrokerOrderResultCopyWithImpl<$Res, _$BeBrokerOrderResultImpl>
    implements _$$BeBrokerOrderResultImplCopyWith<$Res> {
  __$$BeBrokerOrderResultImplCopyWithImpl(_$BeBrokerOrderResultImpl _value,
      $Res Function(_$BeBrokerOrderResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? order = null,
  }) {
    return _then(_$BeBrokerOrderResultImpl(
      null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as BeBrokerOrder,
    ));
  }
}

/// @nodoc

class _$BeBrokerOrderResultImpl
    with DiagnosticableTreeMixin
    implements _BeBrokerOrderResult {
  const _$BeBrokerOrderResultImpl(this.order);

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BeBrokerOrderResultImpl &&
            (identical(other.order, order) || other.order == order));
  }

  @override
  int get hashCode => Object.hash(runtimeType, order);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BeBrokerOrderResultImplCopyWith<_$BeBrokerOrderResultImpl> get copyWith =>
      __$$BeBrokerOrderResultImplCopyWithImpl<_$BeBrokerOrderResultImpl>(
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
      _$BeBrokerOrderResultImpl;

  BeBrokerOrder get order;
  @JsonKey(ignore: true)
  _$$BeBrokerOrderResultImplCopyWith<_$BeBrokerOrderResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BeBrokerOrderResultErrImplCopyWith<$Res> {
  factory _$$BeBrokerOrderResultErrImplCopyWith(
          _$BeBrokerOrderResultErrImpl value,
          $Res Function(_$BeBrokerOrderResultErrImpl) then) =
      __$$BeBrokerOrderResultErrImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BeError err});

  $BeErrorCopyWith<$Res> get err;
}

/// @nodoc
class __$$BeBrokerOrderResultErrImplCopyWithImpl<$Res>
    extends _$BeBrokerOrderResultCopyWithImpl<$Res,
        _$BeBrokerOrderResultErrImpl>
    implements _$$BeBrokerOrderResultErrImplCopyWith<$Res> {
  __$$BeBrokerOrderResultErrImplCopyWithImpl(
      _$BeBrokerOrderResultErrImpl _value,
      $Res Function(_$BeBrokerOrderResultErrImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? err = null,
  }) {
    return _then(_$BeBrokerOrderResultErrImpl(
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

class _$BeBrokerOrderResultErrImpl
    with DiagnosticableTreeMixin
    implements _BeBrokerOrderResultErr {
  const _$BeBrokerOrderResultErrImpl(this.err);

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BeBrokerOrderResultErrImpl &&
            (identical(other.err, err) || other.err == err));
  }

  @override
  int get hashCode => Object.hash(runtimeType, err);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BeBrokerOrderResultErrImplCopyWith<_$BeBrokerOrderResultErrImpl>
      get copyWith => __$$BeBrokerOrderResultErrImplCopyWithImpl<
          _$BeBrokerOrderResultErrImpl>(this, _$identity);

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
      _$BeBrokerOrderResultErrImpl;

  BeError get err;
  @JsonKey(ignore: true)
  _$$BeBrokerOrderResultErrImplCopyWith<_$BeBrokerOrderResultErrImpl>
      get copyWith => throw _privateConstructorUsedError;
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
abstract class _$$BeBrokerOrdersResultImplCopyWith<$Res> {
  factory _$$BeBrokerOrdersResultImplCopyWith(_$BeBrokerOrdersResultImpl value,
          $Res Function(_$BeBrokerOrdersResultImpl) then) =
      __$$BeBrokerOrdersResultImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<BeBrokerOrder> orders, int offset, int limit, int total});
}

/// @nodoc
class __$$BeBrokerOrdersResultImplCopyWithImpl<$Res>
    extends _$BeBrokerOrdersResultCopyWithImpl<$Res, _$BeBrokerOrdersResultImpl>
    implements _$$BeBrokerOrdersResultImplCopyWith<$Res> {
  __$$BeBrokerOrdersResultImplCopyWithImpl(_$BeBrokerOrdersResultImpl _value,
      $Res Function(_$BeBrokerOrdersResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orders = null,
    Object? offset = null,
    Object? limit = null,
    Object? total = null,
  }) {
    return _then(_$BeBrokerOrdersResultImpl(
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

class _$BeBrokerOrdersResultImpl
    with DiagnosticableTreeMixin
    implements _BeBrokerOrdersResult {
  const _$BeBrokerOrdersResultImpl(
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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BeBrokerOrdersResultImpl &&
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
  _$$BeBrokerOrdersResultImplCopyWith<_$BeBrokerOrdersResultImpl>
      get copyWith =>
          __$$BeBrokerOrdersResultImplCopyWithImpl<_$BeBrokerOrdersResultImpl>(
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
      final int total) = _$BeBrokerOrdersResultImpl;

  List<BeBrokerOrder> get orders;
  int get offset;
  int get limit;
  int get total;
  @JsonKey(ignore: true)
  _$$BeBrokerOrdersResultImplCopyWith<_$BeBrokerOrdersResultImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BeBrokerOrdersResultErrImplCopyWith<$Res> {
  factory _$$BeBrokerOrdersResultErrImplCopyWith(
          _$BeBrokerOrdersResultErrImpl value,
          $Res Function(_$BeBrokerOrdersResultErrImpl) then) =
      __$$BeBrokerOrdersResultErrImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BeError err});

  $BeErrorCopyWith<$Res> get err;
}

/// @nodoc
class __$$BeBrokerOrdersResultErrImplCopyWithImpl<$Res>
    extends _$BeBrokerOrdersResultCopyWithImpl<$Res,
        _$BeBrokerOrdersResultErrImpl>
    implements _$$BeBrokerOrdersResultErrImplCopyWith<$Res> {
  __$$BeBrokerOrdersResultErrImplCopyWithImpl(
      _$BeBrokerOrdersResultErrImpl _value,
      $Res Function(_$BeBrokerOrdersResultErrImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? err = null,
  }) {
    return _then(_$BeBrokerOrdersResultErrImpl(
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

class _$BeBrokerOrdersResultErrImpl
    with DiagnosticableTreeMixin
    implements _BeBrokerOrdersResultErr {
  const _$BeBrokerOrdersResultErrImpl(this.err);

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BeBrokerOrdersResultErrImpl &&
            (identical(other.err, err) || other.err == err));
  }

  @override
  int get hashCode => Object.hash(runtimeType, err);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BeBrokerOrdersResultErrImplCopyWith<_$BeBrokerOrdersResultErrImpl>
      get copyWith => __$$BeBrokerOrdersResultErrImplCopyWithImpl<
          _$BeBrokerOrdersResultErrImpl>(this, _$identity);

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
      _$BeBrokerOrdersResultErrImpl;

  BeError get err;
  @JsonKey(ignore: true)
  _$$BeBrokerOrdersResultErrImplCopyWith<_$BeBrokerOrdersResultErrImpl>
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
abstract class _$$BeRemitPaymentMethodsResultImplCopyWith<$Res> {
  factory _$$BeRemitPaymentMethodsResultImplCopyWith(
          _$BeRemitPaymentMethodsResultImpl value,
          $Res Function(_$BeRemitPaymentMethodsResultImpl) then) =
      __$$BeRemitPaymentMethodsResultImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {Map<BePaymentMethodCategory, List<BePaymentMethod>> paymentMethods});
}

/// @nodoc
class __$$BeRemitPaymentMethodsResultImplCopyWithImpl<$Res>
    extends _$BeRemitPaymentMethodsResultCopyWithImpl<$Res,
        _$BeRemitPaymentMethodsResultImpl>
    implements _$$BeRemitPaymentMethodsResultImplCopyWith<$Res> {
  __$$BeRemitPaymentMethodsResultImplCopyWithImpl(
      _$BeRemitPaymentMethodsResultImpl _value,
      $Res Function(_$BeRemitPaymentMethodsResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentMethods = null,
  }) {
    return _then(_$BeRemitPaymentMethodsResultImpl(
      null == paymentMethods
          ? _value._paymentMethods
          : paymentMethods // ignore: cast_nullable_to_non_nullable
              as Map<BePaymentMethodCategory, List<BePaymentMethod>>,
    ));
  }
}

/// @nodoc

class _$BeRemitPaymentMethodsResultImpl
    with DiagnosticableTreeMixin
    implements _BeRemitPaymentMethodsResult {
  const _$BeRemitPaymentMethodsResultImpl(
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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BeRemitPaymentMethodsResultImpl &&
            const DeepCollectionEquality()
                .equals(other._paymentMethods, _paymentMethods));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_paymentMethods));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BeRemitPaymentMethodsResultImplCopyWith<_$BeRemitPaymentMethodsResultImpl>
      get copyWith => __$$BeRemitPaymentMethodsResultImplCopyWithImpl<
          _$BeRemitPaymentMethodsResultImpl>(this, _$identity);

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
          paymentMethods) = _$BeRemitPaymentMethodsResultImpl;

  Map<BePaymentMethodCategory, List<BePaymentMethod>> get paymentMethods;
  @JsonKey(ignore: true)
  _$$BeRemitPaymentMethodsResultImplCopyWith<_$BeRemitPaymentMethodsResultImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BeRemitPaymentMethodsResultErrImplCopyWith<$Res> {
  factory _$$BeRemitPaymentMethodsResultErrImplCopyWith(
          _$BeRemitPaymentMethodsResultErrImpl value,
          $Res Function(_$BeRemitPaymentMethodsResultErrImpl) then) =
      __$$BeRemitPaymentMethodsResultErrImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BeError err});

  $BeErrorCopyWith<$Res> get err;
}

/// @nodoc
class __$$BeRemitPaymentMethodsResultErrImplCopyWithImpl<$Res>
    extends _$BeRemitPaymentMethodsResultCopyWithImpl<$Res,
        _$BeRemitPaymentMethodsResultErrImpl>
    implements _$$BeRemitPaymentMethodsResultErrImplCopyWith<$Res> {
  __$$BeRemitPaymentMethodsResultErrImplCopyWithImpl(
      _$BeRemitPaymentMethodsResultErrImpl _value,
      $Res Function(_$BeRemitPaymentMethodsResultErrImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? err = null,
  }) {
    return _then(_$BeRemitPaymentMethodsResultErrImpl(
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

class _$BeRemitPaymentMethodsResultErrImpl
    with DiagnosticableTreeMixin
    implements _BeRemitPaymentMethodsResultErr {
  const _$BeRemitPaymentMethodsResultErrImpl(this.err);

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BeRemitPaymentMethodsResultErrImpl &&
            (identical(other.err, err) || other.err == err));
  }

  @override
  int get hashCode => Object.hash(runtimeType, err);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BeRemitPaymentMethodsResultErrImplCopyWith<
          _$BeRemitPaymentMethodsResultErrImpl>
      get copyWith => __$$BeRemitPaymentMethodsResultErrImplCopyWithImpl<
          _$BeRemitPaymentMethodsResultErrImpl>(this, _$identity);

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
      _$BeRemitPaymentMethodsResultErrImpl;

  BeError get err;
  @JsonKey(ignore: true)
  _$$BeRemitPaymentMethodsResultErrImplCopyWith<
          _$BeRemitPaymentMethodsResultErrImpl>
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
abstract class _$$BeRemitInvoiceResultImplCopyWith<$Res> {
  factory _$$BeRemitInvoiceResultImplCopyWith(_$BeRemitInvoiceResultImpl value,
          $Res Function(_$BeRemitInvoiceResultImpl) then) =
      __$$BeRemitInvoiceResultImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {BeRemit remit, BeRemitInvoice invoice, BeBalanceUpdate? withdrawal});
}

/// @nodoc
class __$$BeRemitInvoiceResultImplCopyWithImpl<$Res>
    extends _$BeRemitInvoiceResultCopyWithImpl<$Res, _$BeRemitInvoiceResultImpl>
    implements _$$BeRemitInvoiceResultImplCopyWith<$Res> {
  __$$BeRemitInvoiceResultImplCopyWithImpl(_$BeRemitInvoiceResultImpl _value,
      $Res Function(_$BeRemitInvoiceResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? remit = null,
    Object? invoice = null,
    Object? withdrawal = freezed,
  }) {
    return _then(_$BeRemitInvoiceResultImpl(
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

class _$BeRemitInvoiceResultImpl
    with DiagnosticableTreeMixin
    implements _BeRemitInvoiceResult {
  const _$BeRemitInvoiceResultImpl(this.remit, this.invoice, this.withdrawal);

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BeRemitInvoiceResultImpl &&
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
  _$$BeRemitInvoiceResultImplCopyWith<_$BeRemitInvoiceResultImpl>
      get copyWith =>
          __$$BeRemitInvoiceResultImplCopyWithImpl<_$BeRemitInvoiceResultImpl>(
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
      final BeBalanceUpdate? withdrawal) = _$BeRemitInvoiceResultImpl;

  BeRemit get remit;
  BeRemitInvoice get invoice;
  BeBalanceUpdate? get withdrawal;
  @JsonKey(ignore: true)
  _$$BeRemitInvoiceResultImplCopyWith<_$BeRemitInvoiceResultImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BeRemitInvoiceResultErrImplCopyWith<$Res> {
  factory _$$BeRemitInvoiceResultErrImplCopyWith(
          _$BeRemitInvoiceResultErrImpl value,
          $Res Function(_$BeRemitInvoiceResultErrImpl) then) =
      __$$BeRemitInvoiceResultErrImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BeError err});

  $BeErrorCopyWith<$Res> get err;
}

/// @nodoc
class __$$BeRemitInvoiceResultErrImplCopyWithImpl<$Res>
    extends _$BeRemitInvoiceResultCopyWithImpl<$Res,
        _$BeRemitInvoiceResultErrImpl>
    implements _$$BeRemitInvoiceResultErrImplCopyWith<$Res> {
  __$$BeRemitInvoiceResultErrImplCopyWithImpl(
      _$BeRemitInvoiceResultErrImpl _value,
      $Res Function(_$BeRemitInvoiceResultErrImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? err = null,
  }) {
    return _then(_$BeRemitInvoiceResultErrImpl(
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

class _$BeRemitInvoiceResultErrImpl
    with DiagnosticableTreeMixin
    implements _BeRemitInvoiceResultErr {
  const _$BeRemitInvoiceResultErrImpl(this.err);

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BeRemitInvoiceResultErrImpl &&
            (identical(other.err, err) || other.err == err));
  }

  @override
  int get hashCode => Object.hash(runtimeType, err);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BeRemitInvoiceResultErrImplCopyWith<_$BeRemitInvoiceResultErrImpl>
      get copyWith => __$$BeRemitInvoiceResultErrImplCopyWithImpl<
          _$BeRemitInvoiceResultErrImpl>(this, _$identity);

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
      _$BeRemitInvoiceResultErrImpl;

  BeError get err;
  @JsonKey(ignore: true)
  _$$BeRemitInvoiceResultErrImplCopyWith<_$BeRemitInvoiceResultErrImpl>
      get copyWith => throw _privateConstructorUsedError;
}
