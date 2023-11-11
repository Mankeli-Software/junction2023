// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GameState _$GameStateFromJson(Map<String, dynamic> json) {
  return HideAndSeekGameState.fromJson(json);
}

/// @nodoc
mixin _$GameState {
  String? get sessionId => throw _privateConstructorUsedError;
  String get creatorId => throw _privateConstructorUsedError;
  List<HideAndSeekPlayerData> get playerData =>
      throw _privateConstructorUsedError;
  GameStatus get status => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? sessionId, String creatorId,
            List<HideAndSeekPlayerData> playerData, GameStatus status)
        hideAndSeek,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? sessionId, String creatorId,
            List<HideAndSeekPlayerData> playerData, GameStatus status)?
        hideAndSeek,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? sessionId, String creatorId,
            List<HideAndSeekPlayerData> playerData, GameStatus status)?
        hideAndSeek,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HideAndSeekGameState value) hideAndSeek,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HideAndSeekGameState value)? hideAndSeek,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HideAndSeekGameState value)? hideAndSeek,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GameStateCopyWith<GameState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameStateCopyWith<$Res> {
  factory $GameStateCopyWith(GameState value, $Res Function(GameState) then) =
      _$GameStateCopyWithImpl<$Res, GameState>;
  @useResult
  $Res call(
      {String? sessionId,
      String creatorId,
      List<HideAndSeekPlayerData> playerData,
      GameStatus status});
}

/// @nodoc
class _$GameStateCopyWithImpl<$Res, $Val extends GameState>
    implements $GameStateCopyWith<$Res> {
  _$GameStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionId = freezed,
    Object? creatorId = null,
    Object? playerData = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      sessionId: freezed == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String?,
      creatorId: null == creatorId
          ? _value.creatorId
          : creatorId // ignore: cast_nullable_to_non_nullable
              as String,
      playerData: null == playerData
          ? _value.playerData
          : playerData // ignore: cast_nullable_to_non_nullable
              as List<HideAndSeekPlayerData>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as GameStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HideAndSeekGameStateImplCopyWith<$Res>
    implements $GameStateCopyWith<$Res> {
  factory _$$HideAndSeekGameStateImplCopyWith(_$HideAndSeekGameStateImpl value,
          $Res Function(_$HideAndSeekGameStateImpl) then) =
      __$$HideAndSeekGameStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? sessionId,
      String creatorId,
      List<HideAndSeekPlayerData> playerData,
      GameStatus status});
}

/// @nodoc
class __$$HideAndSeekGameStateImplCopyWithImpl<$Res>
    extends _$GameStateCopyWithImpl<$Res, _$HideAndSeekGameStateImpl>
    implements _$$HideAndSeekGameStateImplCopyWith<$Res> {
  __$$HideAndSeekGameStateImplCopyWithImpl(_$HideAndSeekGameStateImpl _value,
      $Res Function(_$HideAndSeekGameStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionId = freezed,
    Object? creatorId = null,
    Object? playerData = null,
    Object? status = null,
  }) {
    return _then(_$HideAndSeekGameStateImpl(
      sessionId: freezed == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String?,
      creatorId: null == creatorId
          ? _value.creatorId
          : creatorId // ignore: cast_nullable_to_non_nullable
              as String,
      playerData: null == playerData
          ? _value._playerData
          : playerData // ignore: cast_nullable_to_non_nullable
              as List<HideAndSeekPlayerData>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as GameStatus,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HideAndSeekGameStateImpl implements HideAndSeekGameState {
  const _$HideAndSeekGameStateImpl(
      {this.sessionId,
      required this.creatorId,
      final List<HideAndSeekPlayerData> playerData = const [],
      this.status = GameStatus.lobby})
      : _playerData = playerData;

  factory _$HideAndSeekGameStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$HideAndSeekGameStateImplFromJson(json);

  @override
  final String? sessionId;
  @override
  final String creatorId;
  final List<HideAndSeekPlayerData> _playerData;
  @override
  @JsonKey()
  List<HideAndSeekPlayerData> get playerData {
    if (_playerData is EqualUnmodifiableListView) return _playerData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_playerData);
  }

  @override
  @JsonKey()
  final GameStatus status;

  @override
  String toString() {
    return 'GameState.hideAndSeek(sessionId: $sessionId, creatorId: $creatorId, playerData: $playerData, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HideAndSeekGameStateImpl &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.creatorId, creatorId) ||
                other.creatorId == creatorId) &&
            const DeepCollectionEquality()
                .equals(other._playerData, _playerData) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, sessionId, creatorId,
      const DeepCollectionEquality().hash(_playerData), status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HideAndSeekGameStateImplCopyWith<_$HideAndSeekGameStateImpl>
      get copyWith =>
          __$$HideAndSeekGameStateImplCopyWithImpl<_$HideAndSeekGameStateImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? sessionId, String creatorId,
            List<HideAndSeekPlayerData> playerData, GameStatus status)
        hideAndSeek,
  }) {
    return hideAndSeek(sessionId, creatorId, playerData, status);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? sessionId, String creatorId,
            List<HideAndSeekPlayerData> playerData, GameStatus status)?
        hideAndSeek,
  }) {
    return hideAndSeek?.call(sessionId, creatorId, playerData, status);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? sessionId, String creatorId,
            List<HideAndSeekPlayerData> playerData, GameStatus status)?
        hideAndSeek,
    required TResult orElse(),
  }) {
    if (hideAndSeek != null) {
      return hideAndSeek(sessionId, creatorId, playerData, status);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HideAndSeekGameState value) hideAndSeek,
  }) {
    return hideAndSeek(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HideAndSeekGameState value)? hideAndSeek,
  }) {
    return hideAndSeek?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HideAndSeekGameState value)? hideAndSeek,
    required TResult orElse(),
  }) {
    if (hideAndSeek != null) {
      return hideAndSeek(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$HideAndSeekGameStateImplToJson(
      this,
    );
  }
}

abstract class HideAndSeekGameState implements GameState {
  const factory HideAndSeekGameState(
      {final String? sessionId,
      required final String creatorId,
      final List<HideAndSeekPlayerData> playerData,
      final GameStatus status}) = _$HideAndSeekGameStateImpl;

  factory HideAndSeekGameState.fromJson(Map<String, dynamic> json) =
      _$HideAndSeekGameStateImpl.fromJson;

  @override
  String? get sessionId;
  @override
  String get creatorId;
  @override
  List<HideAndSeekPlayerData> get playerData;
  @override
  GameStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$HideAndSeekGameStateImplCopyWith<_$HideAndSeekGameStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
