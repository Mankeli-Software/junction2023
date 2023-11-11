import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_details.g.dart';
part 'game_details.gen.dart';

/// {@template gamedetails}
/// A representation of the apps gamedetailss information.
/// {@endtemplate}
@freezed
class GameDetails with _$GameDetails {
  /// {@macro gamedetails}
  const factory GameDetails({
    /// The gamedetails unique identifier
    required String id,

    /// The gamedetails email address
    required String imgageUrl,

    /// The gamedetails display name
    required String title,

    /// The gamedetails subtitle
    @Default('') String subtitle,

    /// The gamedetails description
    @Default('') decription,

    /// Sensor types available for the game
    @Default([]) List<SensorTypes> sensorTypes,

    /// Vertical alignment for the image
    @Default(0) double verticalAlignment,
  }) = _GameDetails;

  const GameDetails._();

  /// {@macro gamedetails}
  factory GameDetails.fromJson(Map<String, dynamic> json) => _$GameDetailsFromJson(json);

  /// A empty gamedetails to represent empty gamedetails
  static const empty = GameDetails(id: '', title: '', imgageUrl: '');

  /// {@macro gamedetails_extension}
  ///
  /// [isEmpty] tells whether the [GameDetails] is empty
  bool get isEmpty => this == GameDetails.empty;

  /// {@macro gamedetails}
  ///
  /// [isNotEmpty] tells whether the [GameDetails] is not empty
  bool get isNotEmpty => !isEmpty;
}

/// {@template sensor_types}
/// Defines all the sensor types that are supported by the app
/// {@endtemplate}
enum SensorTypes {
  /// {@macro game_details}
  haptic,

  /// {@macro game_details}
  location,

  /// {@macro game_details}
  accelerometer,

  /// {@macro game_details}
  gyroscope,

  /// {@macro game_details}
  compass,

  /// {@macro game_details}
  microphone,
}
