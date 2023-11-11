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
  HideAndSeekGameState? get state => throw _privateConstructorUsedError;
  CompassEvent? get compassEvent => throw _privateConstructorUsedError;
  List<LatLng> get showLocations => throw _privateConstructorUsedError;
  Duration get seekerCountdown => throw _privateConstructorUsedError;
  LatLng? get ownLocation => throw _privateConstructorUsedError;
  double get distanceToClosest => throw _privateConstructorUsedError;

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
  $Res call(
      {HideAndSeekStatus status,
      HideAndSeekGameState? state,
      CompassEvent? compassEvent,
      List<LatLng> showLocations,
      Duration seekerCountdown,
      LatLng? ownLocation,
      double distanceToClosest});
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
    Object? state = freezed,
    Object? compassEvent = freezed,
    Object? showLocations = null,
    Object? seekerCountdown = null,
    Object? ownLocation = freezed,
    Object? distanceToClosest = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as HideAndSeekStatus,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as HideAndSeekGameState?,
      compassEvent: freezed == compassEvent
          ? _value.compassEvent
          : compassEvent // ignore: cast_nullable_to_non_nullable
              as CompassEvent?,
      showLocations: null == showLocations
          ? _value.showLocations
          : showLocations // ignore: cast_nullable_to_non_nullable
              as List<LatLng>,
      seekerCountdown: null == seekerCountdown
          ? _value.seekerCountdown
          : seekerCountdown // ignore: cast_nullable_to_non_nullable
              as Duration,
      ownLocation: freezed == ownLocation
          ? _value.ownLocation
          : ownLocation // ignore: cast_nullable_to_non_nullable
              as LatLng?,
      distanceToClosest: null == distanceToClosest
          ? _value.distanceToClosest
          : distanceToClosest // ignore: cast_nullable_to_non_nullable
              as double,
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
  $Res call(
      {HideAndSeekStatus status,
      HideAndSeekGameState? state,
      CompassEvent? compassEvent,
      List<LatLng> showLocations,
      Duration seekerCountdown,
      LatLng? ownLocation,
      double distanceToClosest});
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
    Object? state = freezed,
    Object? compassEvent = freezed,
    Object? showLocations = null,
    Object? seekerCountdown = null,
    Object? ownLocation = freezed,
    Object? distanceToClosest = null,
  }) {
    return _then(_$HideAndSeekStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as HideAndSeekStatus,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as HideAndSeekGameState?,
      compassEvent: freezed == compassEvent
          ? _value.compassEvent
          : compassEvent // ignore: cast_nullable_to_non_nullable
              as CompassEvent?,
      showLocations: null == showLocations
          ? _value._showLocations
          : showLocations // ignore: cast_nullable_to_non_nullable
              as List<LatLng>,
      seekerCountdown: null == seekerCountdown
          ? _value.seekerCountdown
          : seekerCountdown // ignore: cast_nullable_to_non_nullable
              as Duration,
      ownLocation: freezed == ownLocation
          ? _value.ownLocation
          : ownLocation // ignore: cast_nullable_to_non_nullable
              as LatLng?,
      distanceToClosest: null == distanceToClosest
          ? _value.distanceToClosest
          : distanceToClosest // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$HideAndSeekStateImpl implements _HideAndSeekState {
  const _$HideAndSeekStateImpl(
      {this.status = HideAndSeekStatus.lobby,
      this.state,
      this.compassEvent,
      final List<LatLng> showLocations = const [],
      this.seekerCountdown = Duration.zero,
      this.ownLocation,
      this.distanceToClosest = 1000})
      : _showLocations = showLocations;

  @override
  @JsonKey()
  final HideAndSeekStatus status;
  @override
  final HideAndSeekGameState? state;
  @override
  final CompassEvent? compassEvent;
  final List<LatLng> _showLocations;
  @override
  @JsonKey()
  List<LatLng> get showLocations {
    if (_showLocations is EqualUnmodifiableListView) return _showLocations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_showLocations);
  }

  @override
  @JsonKey()
  final Duration seekerCountdown;
  @override
  final LatLng? ownLocation;
  @override
  @JsonKey()
  final double distanceToClosest;

  @override
  String toString() {
    return 'HideAndSeekState(status: $status, state: $state, compassEvent: $compassEvent, showLocations: $showLocations, seekerCountdown: $seekerCountdown, ownLocation: $ownLocation, distanceToClosest: $distanceToClosest)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HideAndSeekStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.compassEvent, compassEvent) ||
                other.compassEvent == compassEvent) &&
            const DeepCollectionEquality()
                .equals(other._showLocations, _showLocations) &&
            (identical(other.seekerCountdown, seekerCountdown) ||
                other.seekerCountdown == seekerCountdown) &&
            (identical(other.ownLocation, ownLocation) ||
                other.ownLocation == ownLocation) &&
            (identical(other.distanceToClosest, distanceToClosest) ||
                other.distanceToClosest == distanceToClosest));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      state,
      compassEvent,
      const DeepCollectionEquality().hash(_showLocations),
      seekerCountdown,
      ownLocation,
      distanceToClosest);

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
      final HideAndSeekGameState? state,
      final CompassEvent? compassEvent,
      final List<LatLng> showLocations,
      final Duration seekerCountdown,
      final LatLng? ownLocation,
      final double distanceToClosest}) = _$HideAndSeekStateImpl;

  @override
  HideAndSeekStatus get status;
  @override
  HideAndSeekGameState? get state;
  @override
  CompassEvent? get compassEvent;
  @override
  List<LatLng> get showLocations;
  @override
  Duration get seekerCountdown;
  @override
  LatLng? get ownLocation;
  @override
  double get distanceToClosest;
  @override
  @JsonKey(ignore: true)
  _$$HideAndSeekStateImplCopyWith<_$HideAndSeekStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
