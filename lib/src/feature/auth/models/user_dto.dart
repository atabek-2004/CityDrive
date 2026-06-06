import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:city_drive/src/feature/auth/models/common_dto.dart';

part 'user_dto.freezed.dart';
part 'user_dto.g.dart';

@freezed
class UserDTO with _$UserDTO {
  const factory UserDTO({
    String? message,
    String? lang,
    int? id,
    @JsonKey(name: 'full_name') String? fullName,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    @JsonKey(name: 'birth_date') String? birthDate,
    @JsonKey(name: 'password_confirmation') String? passwordConfirmation,
    @JsonKey(name: 'city_id') int? cityId,
    String? phone,
    String? password,
    String? token,
    String? role,
    @JsonKey(name: 'isApproved') bool? isApproved,
    @JsonKey(name: 'device_token') String? deviceToken,
    @JsonKey(name: 'device_type') String? deviceType,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _UserDTO;

  factory UserDTO.fromJson(Map<String, dynamic> json) =>
      _$UserDTOFromJson(json);
}
