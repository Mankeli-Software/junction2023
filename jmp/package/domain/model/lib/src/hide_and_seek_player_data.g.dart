// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hide_and_seek_player_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HideAndSeekPlayerDataImpl _$$HideAndSeekPlayerDataImplFromJson(
        Map<String, dynamic> json) =>
    _$HideAndSeekPlayerDataImpl(
      playerId: json['playerId'] as String,
      role: $enumDecode(_$HideAndSeekRoleEnumMap, json['role']),
      found: json['found'] as bool? ?? false,
      location: _$JsonConverterFromJson<GeoPoint, GeoPoint>(
          json['location'], const GeoPointConverter().fromJson),
    );

Map<String, dynamic> _$$HideAndSeekPlayerDataImplToJson(
        _$HideAndSeekPlayerDataImpl instance) =>
    <String, dynamic>{
      'playerId': instance.playerId,
      'role': _$HideAndSeekRoleEnumMap[instance.role]!,
      'found': instance.found,
      'location': _$JsonConverterToJson<GeoPoint, GeoPoint>(
          instance.location, const GeoPointConverter().toJson),
    };

const _$HideAndSeekRoleEnumMap = {
  HideAndSeekRole.seeker: 'seeker',
  HideAndSeekRole.hider: 'hider',
};

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
