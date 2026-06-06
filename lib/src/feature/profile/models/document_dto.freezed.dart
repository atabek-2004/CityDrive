// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'document_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DocumentDTO _$DocumentDTOFromJson(Map<String, dynamic> json) {
  return _DocumentDTO.fromJson(json);
}

/// @nodoc
mixin _$DocumentDTO {
  int? get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;
  String? get content => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this DocumentDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DocumentDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DocumentDTOCopyWith<DocumentDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DocumentDTOCopyWith<$Res> {
  factory $DocumentDTOCopyWith(
          DocumentDTO value, $Res Function(DocumentDTO) then) =
      _$DocumentDTOCopyWithImpl<$Res, DocumentDTO>;
  @useResult
  $Res call(
      {int? id,
      String? title,
      String? url,
      String? content,
      String? type,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt});
}

/// @nodoc
class _$DocumentDTOCopyWithImpl<$Res, $Val extends DocumentDTO>
    implements $DocumentDTOCopyWith<$Res> {
  _$DocumentDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DocumentDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? url = freezed,
    Object? content = freezed,
    Object? type = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DocumentDTOImplCopyWith<$Res>
    implements $DocumentDTOCopyWith<$Res> {
  factory _$$DocumentDTOImplCopyWith(
          _$DocumentDTOImpl value, $Res Function(_$DocumentDTOImpl) then) =
      __$$DocumentDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? title,
      String? url,
      String? content,
      String? type,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt});
}

/// @nodoc
class __$$DocumentDTOImplCopyWithImpl<$Res>
    extends _$DocumentDTOCopyWithImpl<$Res, _$DocumentDTOImpl>
    implements _$$DocumentDTOImplCopyWith<$Res> {
  __$$DocumentDTOImplCopyWithImpl(
      _$DocumentDTOImpl _value, $Res Function(_$DocumentDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of DocumentDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? url = freezed,
    Object? content = freezed,
    Object? type = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$DocumentDTOImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DocumentDTOImpl implements _DocumentDTO {
  const _$DocumentDTOImpl(
      {this.id,
      this.title,
      this.url,
      this.content,
      this.type,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt});

  factory _$DocumentDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$DocumentDTOImplFromJson(json);

  @override
  final int? id;
  @override
  final String? title;
  @override
  final String? url;
  @override
  final String? content;
  @override
  final String? type;
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  @override
  String toString() {
    return 'DocumentDTO(id: $id, title: $title, url: $url, content: $content, type: $type, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DocumentDTOImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, title, url, content, type, createdAt, updatedAt);

  /// Create a copy of DocumentDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DocumentDTOImplCopyWith<_$DocumentDTOImpl> get copyWith =>
      __$$DocumentDTOImplCopyWithImpl<_$DocumentDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DocumentDTOImplToJson(
      this,
    );
  }
}

abstract class _DocumentDTO implements DocumentDTO {
  const factory _DocumentDTO(
          {final int? id,
          final String? title,
          final String? url,
          final String? content,
          final String? type,
          @JsonKey(name: 'created_at') final String? createdAt,
          @JsonKey(name: 'updated_at') final String? updatedAt}) =
      _$DocumentDTOImpl;

  factory _DocumentDTO.fromJson(Map<String, dynamic> json) =
      _$DocumentDTOImpl.fromJson;

  @override
  int? get id;
  @override
  String? get title;
  @override
  String? get url;
  @override
  String? get content;
  @override
  String? get type;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  String? get updatedAt;

  /// Create a copy of DocumentDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DocumentDTOImplCopyWith<_$DocumentDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
