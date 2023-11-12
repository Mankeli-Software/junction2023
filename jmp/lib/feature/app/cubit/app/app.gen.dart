// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppState {
  /// {@macro startup_logic_status}
  StartupLogicStatus get startupLogicStatus =>
      throw _privateConstructorUsedError;

  /// This is where we keep track of the current lifecycle state of the app. Whether we're in
  /// the foreground, background, or somewhere in between, this is the place to be.
  AppLifecycleState get lifecycleState => throw _privateConstructorUsedError;
  User get currentUser => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppStateCopyWith<AppState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppStateCopyWith<$Res> {
  factory $AppStateCopyWith(AppState value, $Res Function(AppState) then) =
      _$AppStateCopyWithImpl<$Res, AppState>;
  @useResult
  $Res call(
      {StartupLogicStatus startupLogicStatus,
      AppLifecycleState lifecycleState,
      User currentUser});

  $UserCopyWith<$Res> get currentUser;
}

/// @nodoc
class _$AppStateCopyWithImpl<$Res, $Val extends AppState>
    implements $AppStateCopyWith<$Res> {
  _$AppStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startupLogicStatus = null,
    Object? lifecycleState = null,
    Object? currentUser = null,
  }) {
    return _then(_value.copyWith(
      startupLogicStatus: null == startupLogicStatus
          ? _value.startupLogicStatus
          : startupLogicStatus // ignore: cast_nullable_to_non_nullable
              as StartupLogicStatus,
      lifecycleState: null == lifecycleState
          ? _value.lifecycleState
          : lifecycleState // ignore: cast_nullable_to_non_nullable
              as AppLifecycleState,
      currentUser: null == currentUser
          ? _value.currentUser
          : currentUser // ignore: cast_nullable_to_non_nullable
              as User,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get currentUser {
    return $UserCopyWith<$Res>(_value.currentUser, (value) {
      return _then(_value.copyWith(currentUser: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AppStateImplCopyWith<$Res>
    implements $AppStateCopyWith<$Res> {
  factory _$$AppStateImplCopyWith(
          _$AppStateImpl value, $Res Function(_$AppStateImpl) then) =
      __$$AppStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {StartupLogicStatus startupLogicStatus,
      AppLifecycleState lifecycleState,
      User currentUser});

  @override
  $UserCopyWith<$Res> get currentUser;
}

/// @nodoc
class __$$AppStateImplCopyWithImpl<$Res>
    extends _$AppStateCopyWithImpl<$Res, _$AppStateImpl>
    implements _$$AppStateImplCopyWith<$Res> {
  __$$AppStateImplCopyWithImpl(
      _$AppStateImpl _value, $Res Function(_$AppStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startupLogicStatus = null,
    Object? lifecycleState = null,
    Object? currentUser = null,
  }) {
    return _then(_$AppStateImpl(
      startupLogicStatus: null == startupLogicStatus
          ? _value.startupLogicStatus
          : startupLogicStatus // ignore: cast_nullable_to_non_nullable
              as StartupLogicStatus,
      lifecycleState: null == lifecycleState
          ? _value.lifecycleState
          : lifecycleState // ignore: cast_nullable_to_non_nullable
              as AppLifecycleState,
      currentUser: null == currentUser
          ? _value.currentUser
          : currentUser // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }
}

/// @nodoc

class _$AppStateImpl implements _AppState {
  const _$AppStateImpl(
      {this.startupLogicStatus = StartupLogicStatus.running,
      this.lifecycleState = AppLifecycleState.detached,
      this.currentUser = User.empty});

  /// {@macro startup_logic_status}
  @override
  @JsonKey()
  final StartupLogicStatus startupLogicStatus;

  /// This is where we keep track of the current lifecycle state of the app. Whether we're in
  /// the foreground, background, or somewhere in between, this is the place to be.
  @override
  @JsonKey()
  final AppLifecycleState lifecycleState;
  @override
  @JsonKey()
  final User currentUser;

  @override
  String toString() {
    return 'AppState(startupLogicStatus: $startupLogicStatus, lifecycleState: $lifecycleState, currentUser: $currentUser)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppStateImpl &&
            (identical(other.startupLogicStatus, startupLogicStatus) ||
                other.startupLogicStatus == startupLogicStatus) &&
            (identical(other.lifecycleState, lifecycleState) ||
                other.lifecycleState == lifecycleState) &&
            (identical(other.currentUser, currentUser) ||
                other.currentUser == currentUser));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, startupLogicStatus, lifecycleState, currentUser);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppStateImplCopyWith<_$AppStateImpl> get copyWith =>
      __$$AppStateImplCopyWithImpl<_$AppStateImpl>(this, _$identity);
}

abstract class _AppState implements AppState {
  const factory _AppState(
      {final StartupLogicStatus startupLogicStatus,
      final AppLifecycleState lifecycleState,
      final User currentUser}) = _$AppStateImpl;

  @override

  /// {@macro startup_logic_status}
  StartupLogicStatus get startupLogicStatus;
  @override

  /// This is where we keep track of the current lifecycle state of the app. Whether we're in
  /// the foreground, background, or somewhere in between, this is the place to be.
  AppLifecycleState get lifecycleState;
  @override
  User get currentUser;
  @override
  @JsonKey(ignore: true)
  _$$AppStateImplCopyWith<_$AppStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
