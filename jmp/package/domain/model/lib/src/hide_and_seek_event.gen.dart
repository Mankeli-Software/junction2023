// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hide_and_seek_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HideAndSeekEvent _$HideAndSeekEventFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'revealLocation':
      return _HideAndSeekEvent.fromJson(json);
    case 'startCountdown':
      return _StartGame.fromJson(json);
    case 'endCountdown':
      return _EndGame.fromJson(json);
    case 'endGame':
      return _EndGame.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'HideAndSeekEvent',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$HideAndSeekEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String revealUserId) revealLocation,
    required TResult Function() startCountdown,
    required TResult Function() endCountdown,
    required TResult Function() endGame,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String revealUserId)? revealLocation,
    TResult? Function()? startCountdown,
    TResult? Function()? endCountdown,
    TResult? Function()? endGame,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String revealUserId)? revealLocation,
    TResult Function()? startCountdown,
    TResult Function()? endCountdown,
    TResult Function()? endGame,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_HideAndSeekEvent value) revealLocation,
    required TResult Function(_StartGame value) startCountdown,
    required TResult Function(_EndGame value) endCountdown,
    required TResult Function(_EndGame value) endGame,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_HideAndSeekEvent value)? revealLocation,
    TResult? Function(_StartGame value)? startCountdown,
    TResult? Function(_EndGame value)? endCountdown,
    TResult? Function(_EndGame value)? endGame,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_HideAndSeekEvent value)? revealLocation,
    TResult Function(_StartGame value)? startCountdown,
    TResult Function(_EndGame value)? endCountdown,
    TResult Function(_EndGame value)? endGame,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HideAndSeekEventCopyWith<$Res> {
  factory $HideAndSeekEventCopyWith(
          HideAndSeekEvent value, $Res Function(HideAndSeekEvent) then) =
      _$HideAndSeekEventCopyWithImpl<$Res, HideAndSeekEvent>;
}

/// @nodoc
class _$HideAndSeekEventCopyWithImpl<$Res, $Val extends HideAndSeekEvent>
    implements $HideAndSeekEventCopyWith<$Res> {
  _$HideAndSeekEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$HideAndSeekEventImplCopyWith<$Res> {
  factory _$$HideAndSeekEventImplCopyWith(_$HideAndSeekEventImpl value,
          $Res Function(_$HideAndSeekEventImpl) then) =
      __$$HideAndSeekEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String revealUserId});
}

/// @nodoc
class __$$HideAndSeekEventImplCopyWithImpl<$Res>
    extends _$HideAndSeekEventCopyWithImpl<$Res, _$HideAndSeekEventImpl>
    implements _$$HideAndSeekEventImplCopyWith<$Res> {
  __$$HideAndSeekEventImplCopyWithImpl(_$HideAndSeekEventImpl _value,
      $Res Function(_$HideAndSeekEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? revealUserId = null,
  }) {
    return _then(_$HideAndSeekEventImpl(
      revealUserId: null == revealUserId
          ? _value.revealUserId
          : revealUserId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HideAndSeekEventImpl implements _HideAndSeekEvent {
  const _$HideAndSeekEventImpl(
      {required this.revealUserId, final String? $type})
      : $type = $type ?? 'revealLocation';

  factory _$HideAndSeekEventImpl.fromJson(Map<String, dynamic> json) =>
      _$$HideAndSeekEventImplFromJson(json);

  @override
  final String revealUserId;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'HideAndSeekEvent.revealLocation(revealUserId: $revealUserId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HideAndSeekEventImpl &&
            (identical(other.revealUserId, revealUserId) ||
                other.revealUserId == revealUserId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, revealUserId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HideAndSeekEventImplCopyWith<_$HideAndSeekEventImpl> get copyWith =>
      __$$HideAndSeekEventImplCopyWithImpl<_$HideAndSeekEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String revealUserId) revealLocation,
    required TResult Function() startCountdown,
    required TResult Function() endCountdown,
    required TResult Function() endGame,
  }) {
    return revealLocation(revealUserId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String revealUserId)? revealLocation,
    TResult? Function()? startCountdown,
    TResult? Function()? endCountdown,
    TResult? Function()? endGame,
  }) {
    return revealLocation?.call(revealUserId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String revealUserId)? revealLocation,
    TResult Function()? startCountdown,
    TResult Function()? endCountdown,
    TResult Function()? endGame,
    required TResult orElse(),
  }) {
    if (revealLocation != null) {
      return revealLocation(revealUserId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_HideAndSeekEvent value) revealLocation,
    required TResult Function(_StartGame value) startCountdown,
    required TResult Function(_EndGame value) endCountdown,
    required TResult Function(_EndGame value) endGame,
  }) {
    return revealLocation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_HideAndSeekEvent value)? revealLocation,
    TResult? Function(_StartGame value)? startCountdown,
    TResult? Function(_EndGame value)? endCountdown,
    TResult? Function(_EndGame value)? endGame,
  }) {
    return revealLocation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_HideAndSeekEvent value)? revealLocation,
    TResult Function(_StartGame value)? startCountdown,
    TResult Function(_EndGame value)? endCountdown,
    TResult Function(_EndGame value)? endGame,
    required TResult orElse(),
  }) {
    if (revealLocation != null) {
      return revealLocation(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$HideAndSeekEventImplToJson(
      this,
    );
  }
}

abstract class _HideAndSeekEvent implements HideAndSeekEvent {
  const factory _HideAndSeekEvent({required final String revealUserId}) =
      _$HideAndSeekEventImpl;

  factory _HideAndSeekEvent.fromJson(Map<String, dynamic> json) =
      _$HideAndSeekEventImpl.fromJson;

  String get revealUserId;
  @JsonKey(ignore: true)
  _$$HideAndSeekEventImplCopyWith<_$HideAndSeekEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StartGameImplCopyWith<$Res> {
  factory _$$StartGameImplCopyWith(
          _$StartGameImpl value, $Res Function(_$StartGameImpl) then) =
      __$$StartGameImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartGameImplCopyWithImpl<$Res>
    extends _$HideAndSeekEventCopyWithImpl<$Res, _$StartGameImpl>
    implements _$$StartGameImplCopyWith<$Res> {
  __$$StartGameImplCopyWithImpl(
      _$StartGameImpl _value, $Res Function(_$StartGameImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$StartGameImpl implements _StartGame {
  const _$StartGameImpl({final String? $type})
      : $type = $type ?? 'startCountdown';

  factory _$StartGameImpl.fromJson(Map<String, dynamic> json) =>
      _$$StartGameImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'HideAndSeekEvent.startCountdown()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartGameImpl);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String revealUserId) revealLocation,
    required TResult Function() startCountdown,
    required TResult Function() endCountdown,
    required TResult Function() endGame,
  }) {
    return startCountdown();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String revealUserId)? revealLocation,
    TResult? Function()? startCountdown,
    TResult? Function()? endCountdown,
    TResult? Function()? endGame,
  }) {
    return startCountdown?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String revealUserId)? revealLocation,
    TResult Function()? startCountdown,
    TResult Function()? endCountdown,
    TResult Function()? endGame,
    required TResult orElse(),
  }) {
    if (startCountdown != null) {
      return startCountdown();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_HideAndSeekEvent value) revealLocation,
    required TResult Function(_StartGame value) startCountdown,
    required TResult Function(_EndGame value) endCountdown,
    required TResult Function(_EndGame value) endGame,
  }) {
    return startCountdown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_HideAndSeekEvent value)? revealLocation,
    TResult? Function(_StartGame value)? startCountdown,
    TResult? Function(_EndGame value)? endCountdown,
    TResult? Function(_EndGame value)? endGame,
  }) {
    return startCountdown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_HideAndSeekEvent value)? revealLocation,
    TResult Function(_StartGame value)? startCountdown,
    TResult Function(_EndGame value)? endCountdown,
    TResult Function(_EndGame value)? endGame,
    required TResult orElse(),
  }) {
    if (startCountdown != null) {
      return startCountdown(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$StartGameImplToJson(
      this,
    );
  }
}

abstract class _StartGame implements HideAndSeekEvent {
  const factory _StartGame() = _$StartGameImpl;

  factory _StartGame.fromJson(Map<String, dynamic> json) =
      _$StartGameImpl.fromJson;
}

/// @nodoc
abstract class _$$EndGameImplCopyWith<$Res> {
  factory _$$EndGameImplCopyWith(
          _$EndGameImpl value, $Res Function(_$EndGameImpl) then) =
      __$$EndGameImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EndGameImplCopyWithImpl<$Res>
    extends _$HideAndSeekEventCopyWithImpl<$Res, _$EndGameImpl>
    implements _$$EndGameImplCopyWith<$Res> {
  __$$EndGameImplCopyWithImpl(
      _$EndGameImpl _value, $Res Function(_$EndGameImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$EndGameImpl implements _EndGame {
  const _$EndGameImpl({final String? $type}) : $type = $type ?? 'endCountdown';

  factory _$EndGameImpl.fromJson(Map<String, dynamic> json) =>
      _$$EndGameImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'HideAndSeekEvent.endCountdown()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$EndGameImpl);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String revealUserId) revealLocation,
    required TResult Function() startCountdown,
    required TResult Function() endCountdown,
    required TResult Function() endGame,
  }) {
    return endCountdown();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String revealUserId)? revealLocation,
    TResult? Function()? startCountdown,
    TResult? Function()? endCountdown,
    TResult? Function()? endGame,
  }) {
    return endCountdown?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String revealUserId)? revealLocation,
    TResult Function()? startCountdown,
    TResult Function()? endCountdown,
    TResult Function()? endGame,
    required TResult orElse(),
  }) {
    if (endCountdown != null) {
      return endCountdown();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_HideAndSeekEvent value) revealLocation,
    required TResult Function(_StartGame value) startCountdown,
    required TResult Function(_EndGame value) endCountdown,
    required TResult Function(_EndGame value) endGame,
  }) {
    return endCountdown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_HideAndSeekEvent value)? revealLocation,
    TResult? Function(_StartGame value)? startCountdown,
    TResult? Function(_EndGame value)? endCountdown,
    TResult? Function(_EndGame value)? endGame,
  }) {
    return endCountdown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_HideAndSeekEvent value)? revealLocation,
    TResult Function(_StartGame value)? startCountdown,
    TResult Function(_EndGame value)? endCountdown,
    TResult Function(_EndGame value)? endGame,
    required TResult orElse(),
  }) {
    if (endCountdown != null) {
      return endCountdown(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$EndGameImplToJson(
      this,
    );
  }
}

abstract class _EndGame implements HideAndSeekEvent {
  const factory _EndGame() = _$EndGameImpl;

  factory _EndGame.fromJson(Map<String, dynamic> json) = _$EndGameImpl.fromJson;
}

/// @nodoc
abstract class _$$EndGameImplCopyWith<$Res> {
  factory _$$EndGameImplCopyWith(
          _$EndGameImpl value, $Res Function(_$EndGameImpl) then) =
      __$$EndGameImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EndGameImplCopyWithImpl<$Res>
    extends _$HideAndSeekEventCopyWithImpl<$Res, _$EndGameImpl>
    implements _$$EndGameImplCopyWith<$Res> {
  __$$EndGameImplCopyWithImpl(
      _$EndGameImpl _value, $Res Function(_$EndGameImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$EndGameImpl implements _EndGame {
  const _$EndGameImpl({final String? $type}) : $type = $type ?? 'endGame';

  factory _$EndGameImpl.fromJson(Map<String, dynamic> json) =>
      _$$EndGameImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'HideAndSeekEvent.endGame()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$EndGameImpl);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String revealUserId) revealLocation,
    required TResult Function() startCountdown,
    required TResult Function() endCountdown,
    required TResult Function() endGame,
  }) {
    return endGame();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String revealUserId)? revealLocation,
    TResult? Function()? startCountdown,
    TResult? Function()? endCountdown,
    TResult? Function()? endGame,
  }) {
    return endGame?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String revealUserId)? revealLocation,
    TResult Function()? startCountdown,
    TResult Function()? endCountdown,
    TResult Function()? endGame,
    required TResult orElse(),
  }) {
    if (endGame != null) {
      return endGame();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_HideAndSeekEvent value) revealLocation,
    required TResult Function(_StartGame value) startCountdown,
    required TResult Function(_EndGame value) endCountdown,
    required TResult Function(_EndGame value) endGame,
  }) {
    return endGame(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_HideAndSeekEvent value)? revealLocation,
    TResult? Function(_StartGame value)? startCountdown,
    TResult? Function(_EndGame value)? endCountdown,
    TResult? Function(_EndGame value)? endGame,
  }) {
    return endGame?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_HideAndSeekEvent value)? revealLocation,
    TResult Function(_StartGame value)? startCountdown,
    TResult Function(_EndGame value)? endCountdown,
    TResult Function(_EndGame value)? endGame,
    required TResult orElse(),
  }) {
    if (endGame != null) {
      return endGame(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$EndGameImplToJson(
      this,
    );
  }
}

abstract class _EndGame implements HideAndSeekEvent {
  const factory _EndGame() = _$EndGameImpl;

  factory _EndGame.fromJson(Map<String, dynamic> json) = _$EndGameImpl.fromJson;
}
