import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ikidz/src/feature/auth/presentation/widgets/string_to_int_converter.dart';

part 'subscription_dto.freezed.dart';
part 'subscription_dto.g.dart';

@freezed
class SubscriptionDTO with _$SubscriptionDTO {
  const factory SubscriptionDTO({
    required int id,
    String? title,
    @StringToIntConverter() int? price,
    @StringToIntConverter()
    @JsonKey(name: 'discounted_price')
    int? discountedPrice,
    @StringToIntConverter()
    @JsonKey(name: 'discount_percent')
    int? discountPercent,
    @StringToIntConverter() @JsonKey(name: 'is_active') int? isActive,
    @JsonKey(name: 'title_kk') String? titleKK,
    @JsonKey(name: 'title_en') String? titleEN,
    @JsonKey(name: 'duration_months') int? durationMonths,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  }) = _SubscriptionDTO;

  factory SubscriptionDTO.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionDTOFromJson(json);
}
