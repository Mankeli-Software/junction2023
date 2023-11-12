// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GameDetailsImpl _$$GameDetailsImplFromJson(Map<String, dynamic> json) =>
    _$GameDetailsImpl(
      id: json['id'] as String,
      imgageUrl: json['imgageUrl'] as String,
      title: json['title'] as String,
      subtitle: json['subtitle'] as String? ?? '',
      decription: json['decription'] as String? ?? '',
      sensorTypes: (json['sensorTypes'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$SensorTypesEnumMap, e))
              .toList() ??
          const [],
      verticalAlignment: (json['verticalAlignment'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$$GameDetailsImplToJson(_$GameDetailsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'imgageUrl': instance.imgageUrl,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'decription': instance.decription,
      'sensorTypes':
          instance.sensorTypes.map((e) => _$SensorTypesEnumMap[e]!).toList(),
      'verticalAlignment': instance.verticalAlignment,
    };

const _$SensorTypesEnumMap = {
  SensorTypes.haptic: 'haptic',
  SensorTypes.location: 'location',
  SensorTypes.accelerometer: 'accelerometer',
  SensorTypes.gyroscope: 'gyroscope',
  SensorTypes.compass: 'compass',
  SensorTypes.microphone: 'microphone',
};
