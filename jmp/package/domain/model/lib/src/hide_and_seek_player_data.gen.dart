// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hide_and_seek_player_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HideAndSeekPlayerData _$HideAndSeekPlayerDataFromJson(
    Map<String, dynamic> json) {
  return _HideAndSeekPlayerData.fromJson(json);
}

/// @nodoc
mixin _$HideAndSeekPlayerData {
  String get playerId => throw _privateConstructorUsedError;
  HideAndSeekRole get role => throw _privateConstructorUsedError;
  bool get found => throw _privateConstructorUsedError;
  @GeoPointConverter()
  GeoPoint? get location => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HideAndSeekPlayerDataCopyWith<HideAndSeekPlayerData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HideAndSeekPlayerDataCopyWith<$Res> {
  factory $HideAndSeekPlayerDataCopyWith(HideAndSeekPlayerData value,
          $Res Function(HideAndSeekPlayerData) then) =
      _$HideAndSeekPlayerDataCopyWithImpl<$Res, HideAndSeekPlayerData>;
  @useResult
  $Res call(
      {String playerId,
      HideAndSeekRole role,
      bool found,
      @GeoPointConverter() GeoPoint? location});
}

/// @nodoc
class _$HideAndSeekPlayerDataCopyWithImpl<$Res,
        $Val extends HideAndSeekPlayerData>
    implements $HideAndSeekPlayerDataCopyWith<$Res> {
  _$HideAndSeekPlayerDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? playerId = null,
    Object? role = null,
    Object? found = null,
    Object? location = freezed,
  }) {
    return _then(_value.copyWith(
      playerId: null == playerId
          ? _value.playerId
          : playerId // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as HideAndSeekRole,
      found: null == found
          ? _value.found
          : found // ignore: cast_nullable_to_non_nullable
              as bool,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as GeoPoint?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HideAndSeekPlayerDataImplCopyWith<$Res>
    implements $HideAndSeekPlayerDataCopyWith<$Res> {
  factory _$$HideAndSeekPlayerDataImplCopyWith(
          _$HideAndSeekPlayerDataImpl value,
          $Res Function(_$HideAndSeekPlayerDataImpl) then) =
      __$$HideAndSeekPlayerDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String playerId,
      HideAndSeekRole role,
      bool found,
      @GeoPointConverter() GeoPoint? location});
}

/// @nodoc
class __$$HideAndSeekPlayerDataImplCopyWithImpl<$Res>
    extends _$HideAndSeekPlayerDataCopyWithImpl<$Res,
        _$HideAndSeekPlayerDataImpl>
    implements _$$HideAndSeekPlayerDataImplCopyWith<$Res> {
  __$$HideAndSeekPlayerDataImplCopyWithImpl(_$HideAndSeekPlayerDataImpl _value,
      $Res Function(_$HideAndSeekPlayerDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? playerId = null,
    Object? role = null,
    Object? found = null,
    Object? location = freezed,
  }) {
    return _then(_$HideAndSeekPlayerDataImpl(
      playerId: null == playerId
          ? _value.playerId
          : playerId // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as HideAndSeekRole,
      found: null == found
          ? _value.found
          : found // ignore: cast_nullable_to_non_nullable
              as bool,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as GeoPoint?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HideAndSeekPlayerDataImpl extends _HideAndSeekPlayerData {
  const _$HideAndSeekPlayerDataImpl(
      {required this.playerId,
      required this.role,
      this.found = false,
      @GeoPointConverter() this.location})
      : super._();

  factory _$HideAndSeekPlayerDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$HideAndSeekPlayerDataImplFromJson(json);

  @override
  final String playerId;
  @override
  final HideAndSeekRole role;
  @override
  @JsonKey()
  final bool found;
  @override
  @GeoPointConverter()
  final GeoPoint? location;

  @override
  String toString() {
    return 'HideAndSeekPlayerData(playerId: $playerId, role: $role, found: $found, location: $location)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HideAndSeekPlayerDataImpl &&
            (identical(other.playerId, playerId) ||
                other.playerId == playerId) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.found, found) || other.found == found) &&
            (identical(other.location, location) ||
                other.location == location));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, playerId, role, found, location);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HideAndSeekPlayerDataImplCopyWith<_$HideAndSeekPlayerDataImpl>
      get copyWith => __$$HideAndSeekPlayerDataImplCopyWithImpl<
          _$HideAndSeekPlayerDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HideAndSeekPlayerDataImplToJson(
      this,
    );
  }
}

abstract class _HideAndSeekPlayerData extends HideAndSeekPlayerData {
  const factory _HideAndSeekPlayerData(
          {required final String playerId,
          required final HideAndSeekRole role,
          final bool found,
          @GeoPointConverter() final GeoPoint? location}) =
      _$HideAndSeekPlayerDataImpl;
  const _HideAndSeekPlayerData._() : super._();

  factory _HideAndSeekPlayerData.fromJson(Map<String, dynamic> json) =
      _$HideAndSeekPlayerDataImpl.fromJson;

  @override
  String get playerId;
  @override
  HideAndSeekRole get role;
  @override
  bool get found;
  @override
  @GeoPointConverter()
  GeoPoint? get location;
  @override
  @JsonKey(ignore: true)
  _$$HideAndSeekPlayerDataImplCopyWith<_$HideAndSeekPlayerDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}
