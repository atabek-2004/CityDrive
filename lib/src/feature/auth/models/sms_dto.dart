import 'package:freezed_annotation/freezed_annotation.dart';

part 'sms_dto.freezed.dart';
part 'sms_dto.g.dart';

/// This [SmsDTO] class will be used for objects such as the city, the student's class, etc
@freezed
class SmsDTO with _$SmsDTO {
  const factory SmsDTO({
    
    String? message,
    @JsonKey(name: 'debug_code') String? debugCode,
    @JsonKey(name: 'expires_in_minutes') int? expiresInMinutes,
  }) = _SmsDTO;

  factory SmsDTO.fromJson(Map<String, dynamic> json) => _$SmsDTOFromJson(json);
}
