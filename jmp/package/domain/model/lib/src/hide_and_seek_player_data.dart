// ignore_for_file: invalid_annotation_target

import 'package:cloud_firestore_platform_interface/cloud_firestore_platform_interface.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'hide_and_seek_player_data.g.dart';
part 'hide_and_seek_player_data.gen.dart';

/// {@template hide_and_seek_player_data}
/// The data of a single hide and seek player
/// {@endtemplate}
@freezed
class HideAndSeekPlayerData with _$HideAndSeekPlayerData {
  /// {@macro hide_and_seek_player_data}
  const factory HideAndSeekPlayerData({
    required String playerId,
    required HideAndSeekRole role,
    @Default(false) bool found,
    @GeoPointConverter() GeoPoint? location,
  }) = _HideAndSeekPlayerData;

  const HideAndSeekPlayerData._();

  /// {@macro hide_and_seek_player_data}
  factory HideAndSeekPlayerData.fromJson(Map<String, dynamic> json) =>
      _$HideAndSeekPlayerDataFromJson(json);
}

/// {@template hide_and_seek_role}
/// The role of a hide and seek player
/// {@endtemplate}
enum HideAndSeekRole {
  /// {@macro hide_and_seek_role}
  seeker,

  /// {@macro hide_and_seek_role}
  hider,
}

/// {@template geo_point_converter}
///
/// {@endtemplate}
class GeoPointConverter implements JsonConverter<GeoPoint, GeoPoint> {
  /// {@macro geo_point_converter}
  const GeoPointConverter();

  @override
  GeoPoint fromJson(GeoPoint geoPoint) {
    return geoPoint;
  }

  @override
  GeoPoint toJson(GeoPoint geoPoint) => geoPoint;
}
