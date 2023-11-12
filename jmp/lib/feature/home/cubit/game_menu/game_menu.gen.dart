// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_menu.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GameMenuState {
  GameMenuStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GameMenuStateCopyWith<GameMenuState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameMenuStateCopyWith<$Res> {
  factory $GameMenuStateCopyWith(
          GameMenuState value, $Res Function(GameMenuState) then) =
      _$GameMenuStateCopyWithImpl<$Res, GameMenuState>;
  @useResult
  $Res call({GameMenuStatus status});
}

/// @nodoc
class _$GameMenuStateCopyWithImpl<$Res, $Val extends GameMenuState>
    implements $GameMenuStateCopyWith<$Res> {
  _$GameMenuStateCopyWithImpl(this._value, this._then);

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
              as GameMenuStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GameMenuStateImplCopyWith<$Res>
    implements $GameMenuStateCopyWith<$Res> {
  factory _$$GameMenuStateImplCopyWith(
          _$GameMenuStateImpl value, $Res Function(_$GameMenuStateImpl) then) =
      __$$GameMenuStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({GameMenuStatus status});
}

/// @nodoc
class __$$GameMenuStateImplCopyWithImpl<$Res>
    extends _$GameMenuStateCopyWithImpl<$Res, _$GameMenuStateImpl>
    implements _$$GameMenuStateImplCopyWith<$Res> {
  __$$GameMenuStateImplCopyWithImpl(
      _$GameMenuStateImpl _value, $Res Function(_$GameMenuStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
  }) {
    return _then(_$GameMenuStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as GameMenuStatus,
    ));
  }
}

/// @nodoc

class _$GameMenuStateImpl implements _GameMenuState {
  const _$GameMenuStateImpl({this.status = GameMenuStatus.initializing});

  @override
  @JsonKey()
  final GameMenuStatus status;

  @override
  String toString() {
    return 'GameMenuState(status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameMenuStateImpl &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GameMenuStateImplCopyWith<_$GameMenuStateImpl> get copyWith =>
      __$$GameMenuStateImplCopyWithImpl<_$GameMenuStateImpl>(this, _$identity);
}

abstract class _GameMenuState implements GameMenuState {
  const factory _GameMenuState({final GameMenuStatus status}) =
      _$GameMenuStateImpl;

  @override
  GameMenuStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$GameMenuStateImplCopyWith<_$GameMenuStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
