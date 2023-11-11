import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:model/model.dart';

part 'game_state.g.dart';
part 'game_state.gen.dart';

/// {@template game_state}
/// The state of the game that all of the players listen to
/// {@endtemplate}
@Freezed(
  fromJson: true,
  toJson: true,
)
class GameState with _$GameState {
  /// {@macro game_state}
  const factory GameState.hideAndSeek({
    String? sessionId,
    required String creatorId,
    @Default([]) List<HideAndSeekPlayerData> playerData,
    @Default(GameStatus.lobby) GameStatus status,
  }) = HideAndSeekGameState;

  /// {@macro game_state}
  factory GameState.fromData(String id, Map<String, dynamic> data) =>
      _$GameStateFromJson(data).copyWith(sessionId: id);

  /// Whether the user is seeker or not
  bool isSeeker(User user) {
    final seeker = playerData
        .where(
          (pd) => pd.role == HideAndSeekRole.seeker,
        )
        .firstOrNull;

    return user.id == seeker?.playerId;
  }
}

/// {@template game_status}
enum GameStatus {
  /// {@macro game_status}
  lobby,

  /// {@macro game_status}
  playing,

  /// {@macro game_status}
  finished,
}
