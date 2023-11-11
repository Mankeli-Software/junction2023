// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'authentication.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthenticationState {
  /// {@macro authentication_type}
  AuthenticationType get type => throw _privateConstructorUsedError;

  /// A formz input for the email address
  EmailFormz get email => throw _privateConstructorUsedError;

  /// A formz input for the password
  PasswordFormz get password => throw _privateConstructorUsedError;

  /// A formz status for the email
  FormzStatus get emailStatus => throw _privateConstructorUsedError;

  /// A formz status for the password(s)
  FormzStatus get passwordStatus => throw _privateConstructorUsedError;

  /// A formz status for the password reset
  FormzStatus get passwordResetStatus => throw _privateConstructorUsedError;

  /// The status of [AuthenticationRepository]s failures.
  AuthenticationFailureStatus get failureStatus =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthenticationStateCopyWith<AuthenticationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthenticationStateCopyWith<$Res> {
  factory $AuthenticationStateCopyWith(
          AuthenticationState value, $Res Function(AuthenticationState) then) =
      _$AuthenticationStateCopyWithImpl<$Res, AuthenticationState>;
  @useResult
  $Res call(
      {AuthenticationType type,
      EmailFormz email,
      PasswordFormz password,
      FormzStatus emailStatus,
      FormzStatus passwordStatus,
      FormzStatus passwordResetStatus,
      AuthenticationFailureStatus failureStatus});
}

/// @nodoc
class _$AuthenticationStateCopyWithImpl<$Res, $Val extends AuthenticationState>
    implements $AuthenticationStateCopyWith<$Res> {
  _$AuthenticationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? email = null,
    Object? password = null,
    Object? emailStatus = null,
    Object? passwordStatus = null,
    Object? passwordResetStatus = null,
    Object? failureStatus = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as AuthenticationType,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as EmailFormz,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as PasswordFormz,
      emailStatus: null == emailStatus
          ? _value.emailStatus
          : emailStatus // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      passwordStatus: null == passwordStatus
          ? _value.passwordStatus
          : passwordStatus // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      passwordResetStatus: null == passwordResetStatus
          ? _value.passwordResetStatus
          : passwordResetStatus // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      failureStatus: null == failureStatus
          ? _value.failureStatus
          : failureStatus // ignore: cast_nullable_to_non_nullable
              as AuthenticationFailureStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthenticationStateImplCopyWith<$Res>
    implements $AuthenticationStateCopyWith<$Res> {
  factory _$$AuthenticationStateImplCopyWith(_$AuthenticationStateImpl value,
          $Res Function(_$AuthenticationStateImpl) then) =
      __$$AuthenticationStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AuthenticationType type,
      EmailFormz email,
      PasswordFormz password,
      FormzStatus emailStatus,
      FormzStatus passwordStatus,
      FormzStatus passwordResetStatus,
      AuthenticationFailureStatus failureStatus});
}

/// @nodoc
class __$$AuthenticationStateImplCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res, _$AuthenticationStateImpl>
    implements _$$AuthenticationStateImplCopyWith<$Res> {
  __$$AuthenticationStateImplCopyWithImpl(_$AuthenticationStateImpl _value,
      $Res Function(_$AuthenticationStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? email = null,
    Object? password = null,
    Object? emailStatus = null,
    Object? passwordStatus = null,
    Object? passwordResetStatus = null,
    Object? failureStatus = null,
  }) {
    return _then(_$AuthenticationStateImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as AuthenticationType,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as EmailFormz,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as PasswordFormz,
      emailStatus: null == emailStatus
          ? _value.emailStatus
          : emailStatus // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      passwordStatus: null == passwordStatus
          ? _value.passwordStatus
          : passwordStatus // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      passwordResetStatus: null == passwordResetStatus
          ? _value.passwordResetStatus
          : passwordResetStatus // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      failureStatus: null == failureStatus
          ? _value.failureStatus
          : failureStatus // ignore: cast_nullable_to_non_nullable
              as AuthenticationFailureStatus,
    ));
  }
}

/// @nodoc

class _$AuthenticationStateImpl implements _AuthenticationState {
  const _$AuthenticationStateImpl(
      {this.type = AuthenticationType.unknown,
      this.email = const EmailFormz.pure(),
      this.password = const PasswordFormz.pure(),
      this.emailStatus = FormzStatus.pure,
      this.passwordStatus = FormzStatus.pure,
      this.passwordResetStatus = FormzStatus.valid,
      this.failureStatus = AuthenticationFailureStatus.unknown});

  /// {@macro authentication_type}
  @override
  @JsonKey()
  final AuthenticationType type;

  /// A formz input for the email address
  @override
  @JsonKey()
  final EmailFormz email;

  /// A formz input for the password
  @override
  @JsonKey()
  final PasswordFormz password;

  /// A formz status for the email
  @override
  @JsonKey()
  final FormzStatus emailStatus;

  /// A formz status for the password(s)
  @override
  @JsonKey()
  final FormzStatus passwordStatus;

  /// A formz status for the password reset
  @override
  @JsonKey()
  final FormzStatus passwordResetStatus;

  /// The status of [AuthenticationRepository]s failures.
  @override
  @JsonKey()
  final AuthenticationFailureStatus failureStatus;

  @override
  String toString() {
    return 'AuthenticationState(type: $type, email: $email, password: $password, emailStatus: $emailStatus, passwordStatus: $passwordStatus, passwordResetStatus: $passwordResetStatus, failureStatus: $failureStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthenticationStateImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.emailStatus, emailStatus) ||
                other.emailStatus == emailStatus) &&
            (identical(other.passwordStatus, passwordStatus) ||
                other.passwordStatus == passwordStatus) &&
            (identical(other.passwordResetStatus, passwordResetStatus) ||
                other.passwordResetStatus == passwordResetStatus) &&
            (identical(other.failureStatus, failureStatus) ||
                other.failureStatus == failureStatus));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type, email, password,
      emailStatus, passwordStatus, passwordResetStatus, failureStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthenticationStateImplCopyWith<_$AuthenticationStateImpl> get copyWith =>
      __$$AuthenticationStateImplCopyWithImpl<_$AuthenticationStateImpl>(
          this, _$identity);
}

abstract class _AuthenticationState implements AuthenticationState {
  const factory _AuthenticationState(
          {final AuthenticationType type,
          final EmailFormz email,
          final PasswordFormz password,
          final FormzStatus emailStatus,
          final FormzStatus passwordStatus,
          final FormzStatus passwordResetStatus,
          final AuthenticationFailureStatus failureStatus}) =
      _$AuthenticationStateImpl;

  @override

  /// {@macro authentication_type}
  AuthenticationType get type;
  @override

  /// A formz input for the email address
  EmailFormz get email;
  @override

  /// A formz input for the password
  PasswordFormz get password;
  @override

  /// A formz status for the email
  FormzStatus get emailStatus;
  @override

  /// A formz status for the password(s)
  FormzStatus get passwordStatus;
  @override

  /// A formz status for the password reset
  FormzStatus get passwordResetStatus;
  @override

  /// The status of [AuthenticationRepository]s failures.
  AuthenticationFailureStatus get failureStatus;
  @override
  @JsonKey(ignore: true)
  _$$AuthenticationStateImplCopyWith<_$AuthenticationStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
