// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GameDetails _$GameDetailsFromJson(Map<String, dynamic> json) {
  return _GameDetails.fromJson(json);
}

/// @nodoc
mixin _$GameDetails {
  /// The gamedetails unique identifier
  String get id => throw _privateConstructorUsedError;

  /// The gamedetails email address
  String get imgageUrl => throw _privateConstructorUsedError;

  /// The gamedetails display name
  String get title => throw _privateConstructorUsedError;

  /// The gamedetails subtitle
  String get subtitle => throw _privateConstructorUsedError;

  /// The gamedetails description
  String get decription => throw _privateConstructorUsedError;

  /// Sensor types available for the game
  List<SensorTypes> get sensorTypes => throw _privateConstructorUsedError;

  /// Vertical alignment for the image
  double get verticalAlignment => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GameDetailsCopyWith<GameDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameDetailsCopyWith<$Res> {
  factory $GameDetailsCopyWith(
          GameDetails value, $Res Function(GameDetails) then) =
      _$GameDetailsCopyWithImpl<$Res, GameDetails>;
  @useResult
  $Res call(
      {String id,
      String imgageUrl,
      String title,
      String subtitle,
      String decription,
      List<SensorTypes> sensorTypes,
      double verticalAlignment});
}

/// @nodoc
class _$GameDetailsCopyWithImpl<$Res, $Val extends GameDetails>
    implements $GameDetailsCopyWith<$Res> {
  _$GameDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? imgageUrl = null,
    Object? title = null,
    Object? subtitle = null,
    Object? decription = null,
    Object? sensorTypes = null,
    Object? verticalAlignment = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      imgageUrl: null == imgageUrl
          ? _value.imgageUrl
          : imgageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      subtitle: null == subtitle
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String,
      decription: null == decription
          ? _value.decription
          : decription // ignore: cast_nullable_to_non_nullable
              as String,
      sensorTypes: null == sensorTypes
          ? _value.sensorTypes
          : sensorTypes // ignore: cast_nullable_to_non_nullable
              as List<SensorTypes>,
      verticalAlignment: null == verticalAlignment
          ? _value.verticalAlignment
          : verticalAlignment // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GameDetailsImplCopyWith<$Res>
    implements $GameDetailsCopyWith<$Res> {
  factory _$$GameDetailsImplCopyWith(
          _$GameDetailsImpl value, $Res Function(_$GameDetailsImpl) then) =
      __$$GameDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String imgageUrl,
      String title,
      String subtitle,
      String decription,
      List<SensorTypes> sensorTypes,
      double verticalAlignment});
}

/// @nodoc
class __$$GameDetailsImplCopyWithImpl<$Res>
    extends _$GameDetailsCopyWithImpl<$Res, _$GameDetailsImpl>
    implements _$$GameDetailsImplCopyWith<$Res> {
  __$$GameDetailsImplCopyWithImpl(
      _$GameDetailsImpl _value, $Res Function(_$GameDetailsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? imgageUrl = null,
    Object? title = null,
    Object? subtitle = null,
    Object? decription = null,
    Object? sensorTypes = null,
    Object? verticalAlignment = null,
  }) {
    return _then(_$GameDetailsImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      imgageUrl: null == imgageUrl
          ? _value.imgageUrl
          : imgageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      subtitle: null == subtitle
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String,
      decription: null == decription
          ? _value.decription
          : decription // ignore: cast_nullable_to_non_nullable
              as String,
      sensorTypes: null == sensorTypes
          ? _value._sensorTypes
          : sensorTypes // ignore: cast_nullable_to_non_nullable
              as List<SensorTypes>,
      verticalAlignment: null == verticalAlignment
          ? _value.verticalAlignment
          : verticalAlignment // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GameDetailsImpl extends _GameDetails {
  const _$GameDetailsImpl(
      {required this.id,
      required this.imgageUrl,
      required this.title,
      this.subtitle = '',
      this.decription = '',
      final List<SensorTypes> sensorTypes = const [],
      this.verticalAlignment = 0})
      : _sensorTypes = sensorTypes,
        super._();

  factory _$GameDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$GameDetailsImplFromJson(json);

  /// The gamedetails unique identifier
  @override
  final String id;

  /// The gamedetails email address
  @override
  final String imgageUrl;

  /// The gamedetails display name
  @override
  final String title;

  /// The gamedetails subtitle
  @override
  @JsonKey()
  final String subtitle;

  /// The gamedetails description
  @override
  @JsonKey()
  final String decription;

  /// Sensor types available for the game
  final List<SensorTypes> _sensorTypes;

  /// Sensor types available for the game
  @override
  @JsonKey()
  List<SensorTypes> get sensorTypes {
    if (_sensorTypes is EqualUnmodifiableListView) return _sensorTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sensorTypes);
  }

  /// Vertical alignment for the image
  @override
  @JsonKey()
  final double verticalAlignment;

  @override
  String toString() {
    return 'GameDetails(id: $id, imgageUrl: $imgageUrl, title: $title, subtitle: $subtitle, decription: $decription, sensorTypes: $sensorTypes, verticalAlignment: $verticalAlignment)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameDetailsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.imgageUrl, imgageUrl) ||
                other.imgageUrl == imgageUrl) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subtitle, subtitle) ||
                other.subtitle == subtitle) &&
            (identical(other.decription, decription) ||
                other.decription == decription) &&
            const DeepCollectionEquality()
                .equals(other._sensorTypes, _sensorTypes) &&
            (identical(other.verticalAlignment, verticalAlignment) ||
                other.verticalAlignment == verticalAlignment));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      imgageUrl,
      title,
      subtitle,
      decription,
      const DeepCollectionEquality().hash(_sensorTypes),
      verticalAlignment);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GameDetailsImplCopyWith<_$GameDetailsImpl> get copyWith =>
      __$$GameDetailsImplCopyWithImpl<_$GameDetailsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GameDetailsImplToJson(
      this,
    );
  }
}

abstract class _GameDetails extends GameDetails {
  const factory _GameDetails(
      {required final String id,
      required final String imgageUrl,
      required final String title,
      final String subtitle,
      final String decription,
      final List<SensorTypes> sensorTypes,
      final double verticalAlignment}) = _$GameDetailsImpl;
  const _GameDetails._() : super._();

  factory _GameDetails.fromJson(Map<String, dynamic> json) =
      _$GameDetailsImpl.fromJson;

  @override

  /// The gamedetails unique identifier
  String get id;
  @override

  /// The gamedetails email address
  String get imgageUrl;
  @override

  /// The gamedetails display name
  String get title;
  @override

  /// The gamedetails subtitle
  String get subtitle;
  @override

  /// The gamedetails description
  String get decription;
  @override

  /// Sensor types available for the game
  List<SensorTypes> get sensorTypes;
  @override

  /// Vertical alignment for the image
  double get verticalAlignment;
  @override
  @JsonKey(ignore: true)
  _$$GameDetailsImplCopyWith<_$GameDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
