

// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_payload.freezed.dart';
part 'user_payload.g.dart';

@freezed
class UserPayload with _$UserPayload {
  const factory UserPayload({
     @JsonKey(includeIfNull: false, name: 'full_name') String? fullName,
     @JsonKey(includeIfNull: false, name: 'birth_date') String? birthDate,
     @JsonKey(includeIfNull: false, name: 'city_id') int? cityId,
     @JsonKey(includeIfNull: false) String? phone,
    @JsonKey(includeIfNull: false) String? password,
    @JsonKey(includeIfNull: false, name: 'password_confirmation') String? passwordConfirmation,


    @JsonKey(includeIfNull: false, name: 'device_type') String? deviceType,
    @JsonKey(includeIfNull: false, name: 'device_token') String? deviceToken,
    @JsonKey(includeIfNull: false) String? lang,
  }) = _UserPayload;

  factory UserPayload.fromJson(Map<String, dynamic> json) => _$UserPayloadFromJson(json);
}
