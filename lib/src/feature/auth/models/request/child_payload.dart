

// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'child_payload.freezed.dart';
part 'child_payload.g.dart';

@freezed
class ChildPayload with _$ChildPayload {
  const factory ChildPayload({
     @JsonKey(includeIfNull: false, name: 'full_name') String? fullName,
     @JsonKey(includeIfNull: false, name: 'birth_date') String? birthDate,
    
     @JsonKey(includeIfNull: false) String? gender,
   
  }) = _ChildPayload;

  factory ChildPayload.fromJson(Map<String, dynamic> json) => _$ChildPayloadFromJson(json);
}
