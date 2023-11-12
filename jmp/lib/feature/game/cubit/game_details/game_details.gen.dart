// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GameDetailsState {
  GameDetailsStatus get status => throw _privateConstructorUsedError;
  double? get scrollOffset => throw _privateConstructorUsedError;
  bool get titleIsDown => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GameDetailsStateCopyWith<GameDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameDetailsStateCopyWith<$Res> {
  factory $GameDetailsStateCopyWith(
          GameDetailsState value, $Res Function(GameDetailsState) then) =
      _$GameDetailsStateCopyWithImpl<$Res, GameDetailsState>;
  @useResult
  $Res call({GameDetailsStatus status, double? scrollOffset, bool titleIsDown});
}

/// @nodoc
class _$GameDetailsStateCopyWithImpl<$Res, $Val extends GameDetailsState>
    implements $GameDetailsStateCopyWith<$Res> {
  _$GameDetailsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? scrollOffset = freezed,
    Object? titleIsDown = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as GameDetailsStatus,
      scrollOffset: freezed == scrollOffset
          ? _value.scrollOffset
          : scrollOffset // ignore: cast_nullable_to_non_nullable
              as double?,
      titleIsDown: null == titleIsDown
          ? _value.titleIsDown
          : titleIsDown // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GameDetailsStateImplCopyWith<$Res>
    implements $GameDetailsStateCopyWith<$Res> {
  factory _$$GameDetailsStateImplCopyWith(_$GameDetailsStateImpl value,
          $Res Function(_$GameDetailsStateImpl) then) =
      __$$GameDetailsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({GameDetailsStatus status, double? scrollOffset, bool titleIsDown});
}

/// @nodoc
class __$$GameDetailsStateImplCopyWithImpl<$Res>
    extends _$GameDetailsStateCopyWithImpl<$Res, _$GameDetailsStateImpl>
    implements _$$GameDetailsStateImplCopyWith<$Res> {
  __$$GameDetailsStateImplCopyWithImpl(_$GameDetailsStateImpl _value,
      $Res Function(_$GameDetailsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? scrollOffset = freezed,
    Object? titleIsDown = null,
  }) {
    return _then(_$GameDetailsStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as GameDetailsStatus,
      scrollOffset: freezed == scrollOffset
          ? _value.scrollOffset
          : scrollOffset // ignore: cast_nullable_to_non_nullable
              as double?,
      titleIsDown: null == titleIsDown
          ? _value.titleIsDown
          : titleIsDown // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$GameDetailsStateImpl implements _GameDetailsState {
  const _$GameDetailsStateImpl(
      {this.status = GameDetailsStatus.initializing,
      this.scrollOffset = 0,
      this.titleIsDown = true});

  @override
  @JsonKey()
  final GameDetailsStatus status;
  @override
  @JsonKey()
  final double? scrollOffset;
  @override
  @JsonKey()
  final bool titleIsDown;

  @override
  String toString() {
    return 'GameDetailsState(status: $status, scrollOffset: $scrollOffset, titleIsDown: $titleIsDown)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameDetailsStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.scrollOffset, scrollOffset) ||
                other.scrollOffset == scrollOffset) &&
            (identical(other.titleIsDown, titleIsDown) ||
                other.titleIsDown == titleIsDown));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, status, scrollOffset, titleIsDown);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GameDetailsStateImplCopyWith<_$GameDetailsStateImpl> get copyWith =>
      __$$GameDetailsStateImplCopyWithImpl<_$GameDetailsStateImpl>(
          this, _$identity);
}

abstract class _GameDetailsState implements GameDetailsState {
  const factory _GameDetailsState(
      {final GameDetailsStatus status,
      final double? scrollOffset,
      final bool titleIsDown}) = _$GameDetailsStateImpl;

  @override
  GameDetailsStatus get status;
  @override
  double? get scrollOffset;
  @override
  bool get titleIsDown;
  @override
  @JsonKey(ignore: true)
  _$$GameDetailsStateImplCopyWith<_$GameDetailsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
