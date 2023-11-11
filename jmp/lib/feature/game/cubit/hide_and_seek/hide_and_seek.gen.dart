// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hide_and_seek.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HideAndSeekState {
  HideAndSeekStatus get status => throw _privateConstructorUsedError;
  CompassEvent? get compassEvent => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HideAndSeekStateCopyWith<HideAndSeekState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HideAndSeekStateCopyWith<$Res> {
  factory $HideAndSeekStateCopyWith(
          HideAndSeekState value, $Res Function(HideAndSeekState) then) =
      _$HideAndSeekStateCopyWithImpl<$Res, HideAndSeekState>;
  @useResult
  $Res call({HideAndSeekStatus status, CompassEvent? compassEvent});
}

/// @nodoc
class _$HideAndSeekStateCopyWithImpl<$Res, $Val extends HideAndSeekState>
    implements $HideAndSeekStateCopyWith<$Res> {
  _$HideAndSeekStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? compassEvent = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as HideAndSeekStatus,
      compassEvent: freezed == compassEvent
          ? _value.compassEvent
          : compassEvent // ignore: cast_nullable_to_non_nullable
              as CompassEvent?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HideAndSeekStateImplCopyWith<$Res>
    implements $HideAndSeekStateCopyWith<$Res> {
  factory _$$HideAndSeekStateImplCopyWith(_$HideAndSeekStateImpl value,
          $Res Function(_$HideAndSeekStateImpl) then) =
      __$$HideAndSeekStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({HideAndSeekStatus status, CompassEvent? compassEvent});
}

/// @nodoc
class __$$HideAndSeekStateImplCopyWithImpl<$Res>
    extends _$HideAndSeekStateCopyWithImpl<$Res, _$HideAndSeekStateImpl>
    implements _$$HideAndSeekStateImplCopyWith<$Res> {
  __$$HideAndSeekStateImplCopyWithImpl(_$HideAndSeekStateImpl _value,
      $Res Function(_$HideAndSeekStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? compassEvent = freezed,
  }) {
    return _then(_$HideAndSeekStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as HideAndSeekStatus,
      compassEvent: freezed == compassEvent
          ? _value.compassEvent
          : compassEvent // ignore: cast_nullable_to_non_nullable
              as CompassEvent?,
    ));
  }
}

/// @nodoc

class _$HideAndSeekStateImpl implements _HideAndSeekState {
  const _$HideAndSeekStateImpl(
      {this.status = HideAndSeekStatus.lobby, this.compassEvent});

  @override
  @JsonKey()
  final HideAndSeekStatus status;
  @override
  final CompassEvent? compassEvent;

  @override
  String toString() {
    return 'HideAndSeekState(status: $status, compassEvent: $compassEvent)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HideAndSeekStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.compassEvent, compassEvent) ||
                other.compassEvent == compassEvent));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, compassEvent);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HideAndSeekStateImplCopyWith<_$HideAndSeekStateImpl> get copyWith =>
      __$$HideAndSeekStateImplCopyWithImpl<_$HideAndSeekStateImpl>(
          this, _$identity);
}

abstract class _HideAndSeekState implements HideAndSeekState {
  const factory _HideAndSeekState(
      {final HideAndSeekStatus status,
      final CompassEvent? compassEvent}) = _$HideAndSeekStateImpl;

  @override
  HideAndSeekStatus get status;
  @override
  CompassEvent? get compassEvent;
  @override
  @JsonKey(ignore: true)
  _$$HideAndSeekStateImplCopyWith<_$HideAndSeekStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
