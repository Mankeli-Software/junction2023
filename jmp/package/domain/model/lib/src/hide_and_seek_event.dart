import 'package:freezed_annotation/freezed_annotation.dart';

part 'hide_and_seek_event.g.dart';
part 'hide_and_seek_event.gen.dart';

/// {@template hide_and_seek_event}
/// A hide and seek event that may occur
/// {@endtemplate}
@freezed
class HideAndSeekEvent with _$HideAndSeekEvent {
  /// {@macro hide_and_seek_event}
  const factory HideAndSeekEvent.revealLocation({
    required String revealUserId,
  }) = _HideAndSeekEvent;

  /// {@macro hide_and_seek_event}
  const factory HideAndSeekEvent.startCountdown() = _StartGame;

  /// {@macro hide_and_seek_event}
  const factory HideAndSeekEvent.endCountdown() = _EndGame;

  /// {@macro hide_and_seek_event}
  const factory HideAndSeekEvent.endGame() = _EndGame;

  /// {@macro hide_and_seek_event}
  factory HideAndSeekEvent.fromJson(Map<String, dynamic> json) =>
      _$HideAndSeekEventFromJson(json);
}
