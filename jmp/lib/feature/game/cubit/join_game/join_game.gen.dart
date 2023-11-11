// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'join_game.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$JoinGameState {
  JoinGameStatus get status => throw _privateConstructorUsedError;
  ReaderStaus get readerStatus => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $JoinGameStateCopyWith<JoinGameState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JoinGameStateCopyWith<$Res> {
  factory $JoinGameStateCopyWith(
          JoinGameState value, $Res Function(JoinGameState) then) =
      _$JoinGameStateCopyWithImpl<$Res, JoinGameState>;
  @useResult
  $Res call({JoinGameStatus status, ReaderStaus readerStatus});
}

/// @nodoc
class _$JoinGameStateCopyWithImpl<$Res, $Val extends JoinGameState>
    implements $JoinGameStateCopyWith<$Res> {
  _$JoinGameStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? readerStatus = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as JoinGameStatus,
      readerStatus: null == readerStatus
          ? _value.readerStatus
          : readerStatus // ignore: cast_nullable_to_non_nullable
              as ReaderStaus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$JoinGameStateImplCopyWith<$Res>
    implements $JoinGameStateCopyWith<$Res> {
  factory _$$JoinGameStateImplCopyWith(
          _$JoinGameStateImpl value, $Res Function(_$JoinGameStateImpl) then) =
      __$$JoinGameStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({JoinGameStatus status, ReaderStaus readerStatus});
}

/// @nodoc
class __$$JoinGameStateImplCopyWithImpl<$Res>
    extends _$JoinGameStateCopyWithImpl<$Res, _$JoinGameStateImpl>
    implements _$$JoinGameStateImplCopyWith<$Res> {
  __$$JoinGameStateImplCopyWithImpl(
      _$JoinGameStateImpl _value, $Res Function(_$JoinGameStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? readerStatus = null,
  }) {
    return _then(_$JoinGameStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as JoinGameStatus,
      readerStatus: null == readerStatus
          ? _value.readerStatus
          : readerStatus // ignore: cast_nullable_to_non_nullable
              as ReaderStaus,
    ));
  }
}

/// @nodoc

class _$JoinGameStateImpl implements _JoinGameState {
  const _$JoinGameStateImpl(
      {this.status = JoinGameStatus.initializing,
      this.readerStatus = ReaderStaus.scanning});

  @override
  @JsonKey()
  final JoinGameStatus status;
  @override
  @JsonKey()
  final ReaderStaus readerStatus;

  @override
  String toString() {
    return 'JoinGameState(status: $status, readerStatus: $readerStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JoinGameStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.readerStatus, readerStatus) ||
                other.readerStatus == readerStatus));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, readerStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$JoinGameStateImplCopyWith<_$JoinGameStateImpl> get copyWith =>
      __$$JoinGameStateImplCopyWithImpl<_$JoinGameStateImpl>(this, _$identity);
}

abstract class _JoinGameState implements JoinGameState {
  const factory _JoinGameState(
      {final JoinGameStatus status,
      final ReaderStaus readerStatus}) = _$JoinGameStateImpl;

  @override
  JoinGameStatus get status;
  @override
  ReaderStaus get readerStatus;
  @override
  @JsonKey(ignore: true)
  _$$JoinGameStateImplCopyWith<_$JoinGameStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
