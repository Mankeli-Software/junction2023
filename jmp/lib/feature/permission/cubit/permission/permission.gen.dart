// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'permission.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PermissionState {
  /// The scope of the permissions which are to be requested for the given feature.
  List<Permission> get permissionScope => throw _privateConstructorUsedError;

  /// Permissions that are denied or limited by the user
  List<Permission> get permissionsToGrant => throw _privateConstructorUsedError;

  /// Permissions that are permanentlydenied by the user
  List<Permission> get permanentlyDeniedPermissions =>
      throw _privateConstructorUsedError;

  /// Permissions that are restricted by the phone (parental controls etc.)
  List<Permission> get restrictedPermissions =>
      throw _privateConstructorUsedError;

  /// {@macro permission_state_status}
  PermissionStateStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PermissionStateCopyWith<PermissionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PermissionStateCopyWith<$Res> {
  factory $PermissionStateCopyWith(
          PermissionState value, $Res Function(PermissionState) then) =
      _$PermissionStateCopyWithImpl<$Res, PermissionState>;
  @useResult
  $Res call(
      {List<Permission> permissionScope,
      List<Permission> permissionsToGrant,
      List<Permission> permanentlyDeniedPermissions,
      List<Permission> restrictedPermissions,
      PermissionStateStatus status});
}

/// @nodoc
class _$PermissionStateCopyWithImpl<$Res, $Val extends PermissionState>
    implements $PermissionStateCopyWith<$Res> {
  _$PermissionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? permissionScope = null,
    Object? permissionsToGrant = null,
    Object? permanentlyDeniedPermissions = null,
    Object? restrictedPermissions = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      permissionScope: null == permissionScope
          ? _value.permissionScope
          : permissionScope // ignore: cast_nullable_to_non_nullable
              as List<Permission>,
      permissionsToGrant: null == permissionsToGrant
          ? _value.permissionsToGrant
          : permissionsToGrant // ignore: cast_nullable_to_non_nullable
              as List<Permission>,
      permanentlyDeniedPermissions: null == permanentlyDeniedPermissions
          ? _value.permanentlyDeniedPermissions
          : permanentlyDeniedPermissions // ignore: cast_nullable_to_non_nullable
              as List<Permission>,
      restrictedPermissions: null == restrictedPermissions
          ? _value.restrictedPermissions
          : restrictedPermissions // ignore: cast_nullable_to_non_nullable
              as List<Permission>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PermissionStateStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PermissionStateImplCopyWith<$Res>
    implements $PermissionStateCopyWith<$Res> {
  factory _$$PermissionStateImplCopyWith(_$PermissionStateImpl value,
          $Res Function(_$PermissionStateImpl) then) =
      __$$PermissionStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Permission> permissionScope,
      List<Permission> permissionsToGrant,
      List<Permission> permanentlyDeniedPermissions,
      List<Permission> restrictedPermissions,
      PermissionStateStatus status});
}

/// @nodoc
class __$$PermissionStateImplCopyWithImpl<$Res>
    extends _$PermissionStateCopyWithImpl<$Res, _$PermissionStateImpl>
    implements _$$PermissionStateImplCopyWith<$Res> {
  __$$PermissionStateImplCopyWithImpl(
      _$PermissionStateImpl _value, $Res Function(_$PermissionStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? permissionScope = null,
    Object? permissionsToGrant = null,
    Object? permanentlyDeniedPermissions = null,
    Object? restrictedPermissions = null,
    Object? status = null,
  }) {
    return _then(_$PermissionStateImpl(
      permissionScope: null == permissionScope
          ? _value._permissionScope
          : permissionScope // ignore: cast_nullable_to_non_nullable
              as List<Permission>,
      permissionsToGrant: null == permissionsToGrant
          ? _value._permissionsToGrant
          : permissionsToGrant // ignore: cast_nullable_to_non_nullable
              as List<Permission>,
      permanentlyDeniedPermissions: null == permanentlyDeniedPermissions
          ? _value._permanentlyDeniedPermissions
          : permanentlyDeniedPermissions // ignore: cast_nullable_to_non_nullable
              as List<Permission>,
      restrictedPermissions: null == restrictedPermissions
          ? _value._restrictedPermissions
          : restrictedPermissions // ignore: cast_nullable_to_non_nullable
              as List<Permission>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PermissionStateStatus,
    ));
  }
}

/// @nodoc

class _$PermissionStateImpl implements _PermissionState {
  const _$PermissionStateImpl(
      {final List<Permission> permissionScope = const [],
      final List<Permission> permissionsToGrant = const [],
      final List<Permission> permanentlyDeniedPermissions = const [],
      final List<Permission> restrictedPermissions = const [],
      this.status = PermissionStateStatus.fetching})
      : _permissionScope = permissionScope,
        _permissionsToGrant = permissionsToGrant,
        _permanentlyDeniedPermissions = permanentlyDeniedPermissions,
        _restrictedPermissions = restrictedPermissions;

  /// The scope of the permissions which are to be requested for the given feature.
  final List<Permission> _permissionScope;

  /// The scope of the permissions which are to be requested for the given feature.
  @override
  @JsonKey()
  List<Permission> get permissionScope {
    if (_permissionScope is EqualUnmodifiableListView) return _permissionScope;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_permissionScope);
  }

  /// Permissions that are denied or limited by the user
  final List<Permission> _permissionsToGrant;

  /// Permissions that are denied or limited by the user
  @override
  @JsonKey()
  List<Permission> get permissionsToGrant {
    if (_permissionsToGrant is EqualUnmodifiableListView)
      return _permissionsToGrant;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_permissionsToGrant);
  }

  /// Permissions that are permanentlydenied by the user
  final List<Permission> _permanentlyDeniedPermissions;

  /// Permissions that are permanentlydenied by the user
  @override
  @JsonKey()
  List<Permission> get permanentlyDeniedPermissions {
    if (_permanentlyDeniedPermissions is EqualUnmodifiableListView)
      return _permanentlyDeniedPermissions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_permanentlyDeniedPermissions);
  }

  /// Permissions that are restricted by the phone (parental controls etc.)
  final List<Permission> _restrictedPermissions;

  /// Permissions that are restricted by the phone (parental controls etc.)
  @override
  @JsonKey()
  List<Permission> get restrictedPermissions {
    if (_restrictedPermissions is EqualUnmodifiableListView)
      return _restrictedPermissions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_restrictedPermissions);
  }

  /// {@macro permission_state_status}
  @override
  @JsonKey()
  final PermissionStateStatus status;

  @override
  String toString() {
    return 'PermissionState(permissionScope: $permissionScope, permissionsToGrant: $permissionsToGrant, permanentlyDeniedPermissions: $permanentlyDeniedPermissions, restrictedPermissions: $restrictedPermissions, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PermissionStateImpl &&
            const DeepCollectionEquality()
                .equals(other._permissionScope, _permissionScope) &&
            const DeepCollectionEquality()
                .equals(other._permissionsToGrant, _permissionsToGrant) &&
            const DeepCollectionEquality().equals(
                other._permanentlyDeniedPermissions,
                _permanentlyDeniedPermissions) &&
            const DeepCollectionEquality()
                .equals(other._restrictedPermissions, _restrictedPermissions) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_permissionScope),
      const DeepCollectionEquality().hash(_permissionsToGrant),
      const DeepCollectionEquality().hash(_permanentlyDeniedPermissions),
      const DeepCollectionEquality().hash(_restrictedPermissions),
      status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PermissionStateImplCopyWith<_$PermissionStateImpl> get copyWith =>
      __$$PermissionStateImplCopyWithImpl<_$PermissionStateImpl>(
          this, _$identity);
}

abstract class _PermissionState implements PermissionState {
  const factory _PermissionState(
      {final List<Permission> permissionScope,
      final List<Permission> permissionsToGrant,
      final List<Permission> permanentlyDeniedPermissions,
      final List<Permission> restrictedPermissions,
      final PermissionStateStatus status}) = _$PermissionStateImpl;

  @override

  /// The scope of the permissions which are to be requested for the given feature.
  List<Permission> get permissionScope;
  @override

  /// Permissions that are denied or limited by the user
  List<Permission> get permissionsToGrant;
  @override

  /// Permissions that are permanentlydenied by the user
  List<Permission> get permanentlyDeniedPermissions;
  @override

  /// Permissions that are restricted by the phone (parental controls etc.)
  List<Permission> get restrictedPermissions;
  @override

  /// {@macro permission_state_status}
  PermissionStateStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$PermissionStateImplCopyWith<_$PermissionStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
