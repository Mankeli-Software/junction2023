// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'balance_game.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BalanceGameState {
  BalanceGameStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BalanceGameStateCopyWith<BalanceGameState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BalanceGameStateCopyWith<$Res> {
  factory $BalanceGameStateCopyWith(
          BalanceGameState value, $Res Function(BalanceGameState) then) =
      _$BalanceGameStateCopyWithImpl<$Res, BalanceGameState>;
  @useResult
  $Res call({BalanceGameStatus status});
}

/// @nodoc
class _$BalanceGameStateCopyWithImpl<$Res, $Val extends BalanceGameState>
    implements $BalanceGameStateCopyWith<$Res> {
  _$BalanceGameStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BalanceGameStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BalanceGameStateImplCopyWith<$Res>
    implements $BalanceGameStateCopyWith<$Res> {
  factory _$$BalanceGameStateImplCopyWith(_$BalanceGameStateImpl value,
          $Res Function(_$BalanceGameStateImpl) then) =
      __$$BalanceGameStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BalanceGameStatus status});
}

/// @nodoc
class __$$BalanceGameStateImplCopyWithImpl<$Res>
    extends _$BalanceGameStateCopyWithImpl<$Res, _$BalanceGameStateImpl>
    implements _$$BalanceGameStateImplCopyWith<$Res> {
  __$$BalanceGameStateImplCopyWithImpl(_$BalanceGameStateImpl _value,
      $Res Function(_$BalanceGameStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
  }) {
    return _then(_$BalanceGameStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BalanceGameStatus,
    ));
  }
}

/// @nodoc

class _$BalanceGameStateImpl implements _BalanceGameState {
  const _$BalanceGameStateImpl({this.status = BalanceGameStatus.initializing});

  @override
  @JsonKey()
  final BalanceGameStatus status;

  @override
  String toString() {
    return 'BalanceGameState(status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BalanceGameStateImpl &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BalanceGameStateImplCopyWith<_$BalanceGameStateImpl> get copyWith =>
      __$$BalanceGameStateImplCopyWithImpl<_$BalanceGameStateImpl>(
          this, _$identity);
}

abstract class _BalanceGameState implements BalanceGameState {
  const factory _BalanceGameState({final BalanceGameStatus status}) =
      _$BalanceGameStateImpl;

  @override
  BalanceGameStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$BalanceGameStateImplCopyWith<_$BalanceGameStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
