// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'remote_action.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RemoteAction _$RemoteActionFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'pushRoute':
      return PushRouteAction.fromJson(json);
    case 'invalid':
      return InvalidRemoteAction.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'RemoteAction',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$RemoteAction {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String routeName) pushRoute,
    required TResult Function() invalid,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String routeName)? pushRoute,
    TResult? Function()? invalid,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String routeName)? pushRoute,
    TResult Function()? invalid,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PushRouteAction value) pushRoute,
    required TResult Function(InvalidRemoteAction value) invalid,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PushRouteAction value)? pushRoute,
    TResult? Function(InvalidRemoteAction value)? invalid,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PushRouteAction value)? pushRoute,
    TResult Function(InvalidRemoteAction value)? invalid,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RemoteActionCopyWith<$Res> {
  factory $RemoteActionCopyWith(
          RemoteAction value, $Res Function(RemoteAction) then) =
      _$RemoteActionCopyWithImpl<$Res, RemoteAction>;
}

/// @nodoc
class _$RemoteActionCopyWithImpl<$Res, $Val extends RemoteAction>
    implements $RemoteActionCopyWith<$Res> {
  _$RemoteActionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$PushRouteActionImplCopyWith<$Res> {
  factory _$$PushRouteActionImplCopyWith(_$PushRouteActionImpl value,
          $Res Function(_$PushRouteActionImpl) then) =
      __$$PushRouteActionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String routeName});
}

/// @nodoc
class __$$PushRouteActionImplCopyWithImpl<$Res>
    extends _$RemoteActionCopyWithImpl<$Res, _$PushRouteActionImpl>
    implements _$$PushRouteActionImplCopyWith<$Res> {
  __$$PushRouteActionImplCopyWithImpl(
      _$PushRouteActionImpl _value, $Res Function(_$PushRouteActionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? routeName = null,
  }) {
    return _then(_$PushRouteActionImpl(
      routeName: null == routeName
          ? _value.routeName
          : routeName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PushRouteActionImpl extends PushRouteAction {
  const _$PushRouteActionImpl({required this.routeName, final String? $type})
      : $type = $type ?? 'pushRoute',
        super._();

  factory _$PushRouteActionImpl.fromJson(Map<String, dynamic> json) =>
      _$$PushRouteActionImplFromJson(json);

  @override
  final String routeName;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'RemoteAction.pushRoute(routeName: $routeName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PushRouteActionImpl &&
            (identical(other.routeName, routeName) ||
                other.routeName == routeName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, routeName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PushRouteActionImplCopyWith<_$PushRouteActionImpl> get copyWith =>
      __$$PushRouteActionImplCopyWithImpl<_$PushRouteActionImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String routeName) pushRoute,
    required TResult Function() invalid,
  }) {
    return pushRoute(routeName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String routeName)? pushRoute,
    TResult? Function()? invalid,
  }) {
    return pushRoute?.call(routeName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String routeName)? pushRoute,
    TResult Function()? invalid,
    required TResult orElse(),
  }) {
    if (pushRoute != null) {
      return pushRoute(routeName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PushRouteAction value) pushRoute,
    required TResult Function(InvalidRemoteAction value) invalid,
  }) {
    return pushRoute(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PushRouteAction value)? pushRoute,
    TResult? Function(InvalidRemoteAction value)? invalid,
  }) {
    return pushRoute?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PushRouteAction value)? pushRoute,
    TResult Function(InvalidRemoteAction value)? invalid,
    required TResult orElse(),
  }) {
    if (pushRoute != null) {
      return pushRoute(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$PushRouteActionImplToJson(
      this,
    );
  }
}

abstract class PushRouteAction extends RemoteAction {
  const factory PushRouteAction({required final String routeName}) =
      _$PushRouteActionImpl;
  const PushRouteAction._() : super._();

  factory PushRouteAction.fromJson(Map<String, dynamic> json) =
      _$PushRouteActionImpl.fromJson;

  String get routeName;
  @JsonKey(ignore: true)
  _$$PushRouteActionImplCopyWith<_$PushRouteActionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InvalidRemoteActionImplCopyWith<$Res> {
  factory _$$InvalidRemoteActionImplCopyWith(_$InvalidRemoteActionImpl value,
          $Res Function(_$InvalidRemoteActionImpl) then) =
      __$$InvalidRemoteActionImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InvalidRemoteActionImplCopyWithImpl<$Res>
    extends _$RemoteActionCopyWithImpl<$Res, _$InvalidRemoteActionImpl>
    implements _$$InvalidRemoteActionImplCopyWith<$Res> {
  __$$InvalidRemoteActionImplCopyWithImpl(_$InvalidRemoteActionImpl _value,
      $Res Function(_$InvalidRemoteActionImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$InvalidRemoteActionImpl extends InvalidRemoteAction {
  const _$InvalidRemoteActionImpl({final String? $type})
      : $type = $type ?? 'invalid',
        super._();

  factory _$InvalidRemoteActionImpl.fromJson(Map<String, dynamic> json) =>
      _$$InvalidRemoteActionImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'RemoteAction.invalid()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvalidRemoteActionImpl);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String routeName) pushRoute,
    required TResult Function() invalid,
  }) {
    return invalid();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String routeName)? pushRoute,
    TResult? Function()? invalid,
  }) {
    return invalid?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String routeName)? pushRoute,
    TResult Function()? invalid,
    required TResult orElse(),
  }) {
    if (invalid != null) {
      return invalid();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PushRouteAction value) pushRoute,
    required TResult Function(InvalidRemoteAction value) invalid,
  }) {
    return invalid(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PushRouteAction value)? pushRoute,
    TResult? Function(InvalidRemoteAction value)? invalid,
  }) {
    return invalid?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PushRouteAction value)? pushRoute,
    TResult Function(InvalidRemoteAction value)? invalid,
    required TResult orElse(),
  }) {
    if (invalid != null) {
      return invalid(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$InvalidRemoteActionImplToJson(
      this,
    );
  }
}

abstract class InvalidRemoteAction extends RemoteAction {
  const factory InvalidRemoteAction() = _$InvalidRemoteActionImpl;
  const InvalidRemoteAction._() : super._();

  factory InvalidRemoteAction.fromJson(Map<String, dynamic> json) =
      _$InvalidRemoteActionImpl.fromJson;
}
