// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'action_game.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ActionGameState {
  ActionGameStatus get status => throw _privateConstructorUsedError;
  int get currentProgress => throw _privateConstructorUsedError;
  int get requiredProgress => throw _privateConstructorUsedError;
  Duration get timeLeft => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ActionGameStateCopyWith<ActionGameState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActionGameStateCopyWith<$Res> {
  factory $ActionGameStateCopyWith(
          ActionGameState value, $Res Function(ActionGameState) then) =
      _$ActionGameStateCopyWithImpl<$Res, ActionGameState>;
  @useResult
  $Res call(
      {ActionGameStatus status,
      int currentProgress,
      int requiredProgress,
      Duration timeLeft});
}

/// @nodoc
class _$ActionGameStateCopyWithImpl<$Res, $Val extends ActionGameState>
    implements $ActionGameStateCopyWith<$Res> {
  _$ActionGameStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? currentProgress = null,
    Object? requiredProgress = null,
    Object? timeLeft = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ActionGameStatus,
      currentProgress: null == currentProgress
          ? _value.currentProgress
          : currentProgress // ignore: cast_nullable_to_non_nullable
              as int,
      requiredProgress: null == requiredProgress
          ? _value.requiredProgress
          : requiredProgress // ignore: cast_nullable_to_non_nullable
              as int,
      timeLeft: null == timeLeft
          ? _value.timeLeft
          : timeLeft // ignore: cast_nullable_to_non_nullable
              as Duration,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ActionGameStateImplCopyWith<$Res>
    implements $ActionGameStateCopyWith<$Res> {
  factory _$$ActionGameStateImplCopyWith(_$ActionGameStateImpl value,
          $Res Function(_$ActionGameStateImpl) then) =
      __$$ActionGameStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ActionGameStatus status,
      int currentProgress,
      int requiredProgress,
      Duration timeLeft});
}

/// @nodoc
class __$$ActionGameStateImplCopyWithImpl<$Res>
    extends _$ActionGameStateCopyWithImpl<$Res, _$ActionGameStateImpl>
    implements _$$ActionGameStateImplCopyWith<$Res> {
  __$$ActionGameStateImplCopyWithImpl(
      _$ActionGameStateImpl _value, $Res Function(_$ActionGameStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? currentProgress = null,
    Object? requiredProgress = null,
    Object? timeLeft = null,
  }) {
    return _then(_$ActionGameStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ActionGameStatus,
      currentProgress: null == currentProgress
          ? _value.currentProgress
          : currentProgress // ignore: cast_nullable_to_non_nullable
              as int,
      requiredProgress: null == requiredProgress
          ? _value.requiredProgress
          : requiredProgress // ignore: cast_nullable_to_non_nullable
              as int,
      timeLeft: null == timeLeft
          ? _value.timeLeft
          : timeLeft // ignore: cast_nullable_to_non_nullable
              as Duration,
    ));
  }
}

/// @nodoc

class _$ActionGameStateImpl implements _ActionGameState {
  const _$ActionGameStateImpl(
      {this.status = ActionGameStatus.initializing,
      this.currentProgress = 1,
      this.requiredProgress = 30,
      this.timeLeft = const Duration(minutes: 1)});

  @override
  @JsonKey()
  final ActionGameStatus status;
  @override
  @JsonKey()
  final int currentProgress;
  @override
  @JsonKey()
  final int requiredProgress;
  @override
  @JsonKey()
  final Duration timeLeft;

  @override
  String toString() {
    return 'ActionGameState(status: $status, currentProgress: $currentProgress, requiredProgress: $requiredProgress, timeLeft: $timeLeft)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActionGameStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.currentProgress, currentProgress) ||
                other.currentProgress == currentProgress) &&
            (identical(other.requiredProgress, requiredProgress) ||
                other.requiredProgress == requiredProgress) &&
            (identical(other.timeLeft, timeLeft) ||
                other.timeLeft == timeLeft));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, status, currentProgress, requiredProgress, timeLeft);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ActionGameStateImplCopyWith<_$ActionGameStateImpl> get copyWith =>
      __$$ActionGameStateImplCopyWithImpl<_$ActionGameStateImpl>(
          this, _$identity);
}

abstract class _ActionGameState implements ActionGameState {
  const factory _ActionGameState(
      {final ActionGameStatus status,
      final int currentProgress,
      final int requiredProgress,
      final Duration timeLeft}) = _$ActionGameStateImpl;

  @override
  ActionGameStatus get status;
  @override
  int get currentProgress;
  @override
  int get requiredProgress;
  @override
  Duration get timeLeft;
  @override
  @JsonKey(ignore: true)
  _$$ActionGameStateImplCopyWith<_$ActionGameStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
