// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'balance_dto.freezed.dart';
part 'balance_dto.g.dart';

@freezed
class BalanceDTO with _$BalanceDTO {
  const factory BalanceDTO({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'wallet_id') int? walletId,
    @JsonKey(name: 'amount') int? amount,
    @JsonKey(name: 'type') String? type,
    @JsonKey(name: 'description') String? description,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  }) = _BalanceDTO;

  factory BalanceDTO.fromJson(Map<String, dynamic> json) =>
      _$BalanceDTOFromJson(json);
}
