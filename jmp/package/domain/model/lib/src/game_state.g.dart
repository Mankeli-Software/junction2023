// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HideAndSeekGameStateImpl _$$HideAndSeekGameStateImplFromJson(
        Map<String, dynamic> json) =>
    _$HideAndSeekGameStateImpl(
      sessionId: json['sessionId'] as String?,
      creatorId: json['creatorId'] as String,
      playerData: (json['playerData'] as List<dynamic>?)
              ?.map((e) =>
                  HideAndSeekPlayerData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      status: $enumDecodeNullable(_$GameStatusEnumMap, json['status']) ??
          GameStatus.lobby,
    );

Map<String, dynamic> _$$HideAndSeekGameStateImplToJson(
        _$HideAndSeekGameStateImpl instance) =>
    <String, dynamic>{
      'sessionId': instance.sessionId,
      'creatorId': instance.creatorId,
      'playerData': instance.playerData,
      'status': _$GameStatusEnumMap[instance.status]!,
    };

const _$GameStatusEnumMap = {
  GameStatus.lobby: 'lobby',
  GameStatus.playing: 'playing',
  GameStatus.finished: 'finished',
};
