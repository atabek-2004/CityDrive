import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ikidz/src/feature/auth/models/user_dto.dart';

part 'order_dto.freezed.dart';
part 'order_dto.g.dart';

@freezed
class OrderDTO with _$OrderDTO {
  const factory OrderDTO({
    int? id,
    @JsonKey(name: 'order_id') int? orderId,
    @JsonKey(name: 'product_id') int? productId,
    @JsonKey(name: 'result_price') double? resultPrice,
    int? quantity,
    @JsonKey(name: 'status_id') int? statusId,
    @JsonKey(name: 'user_id') int? userId,
    @JsonKey(name: 'partner_id') int? partnerId,
    @JsonKey(name: 'chat_id') int? chatId,
    int? installment,
    String? date,
    String? time,
    @JsonKey(name: 'delivery_type') String? deliveryType,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
    ProductDTO? product,
    OrderWithAddressDTO? order,
    @JsonKey(name: 'partner_address') AddressDTO? partnerAddress,
    UserDTO? user,
  }) = _OrderDTO;

  factory OrderDTO.fromJson(Map<String, dynamic> json) => _$OrderDTOFromJson(json);
}

@freezed
class ProductDTO with _$ProductDTO {
  const factory ProductDTO({
    int? id,
    String? name,
    String? description,
    double? price,
    @JsonKey(name: 'catalog_id') int? catalogId,
    @JsonKey(name: 'subcatalog_id') int? subcatalogId,
    int? installment,
    @JsonKey(name: 'color_id') int? colorId,
    @JsonKey(name: 'partner_id') int? partnerId,
    int? recommendation,
    @JsonKey(name: 'recommendation_date') String? recommendationDate,
    @JsonKey(name: 'auto_extend') int? autoExtend,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  }) = _ProductDTO;

  factory ProductDTO.fromJson(Map<String, dynamic> json) => _$ProductDTOFromJson(json);
}

@freezed
class OrderWithAddressDTO with _$OrderWithAddressDTO {
  const factory OrderWithAddressDTO({
    int? id,
    @JsonKey(name: 'address_id') int? addressId,
    @JsonKey(name: 'delivery_type') String? deliveryType,
    @JsonKey(name: 'payment_type') String? paymentType,
    @JsonKey(name: 'used_bonus') int? usedBonus,
    String? promocode,
    @JsonKey(name: 'sum_products_price') double? sumProductsPrice,
    @JsonKey(name: 'delivery_price') double? deliveryPrice,
    @JsonKey(name: 'total_price') double? totalPrice,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
    AddressDTO? address,
  }) = _OrderWithAddressDTO;

  factory OrderWithAddressDTO.fromJson(Map<String, dynamic> json) => _$OrderWithAddressDTOFromJson(json);
}

@freezed
class AddressDTO with _$AddressDTO {
  const factory AddressDTO({
    int? id,
    String? street,
    @JsonKey(name: 'house_number') String? houseNumber,
    @JsonKey(name: 'apartment_number') String? apartmentNumber,
    @JsonKey(name: 'entrance_number') String? entranceNumber,
    String? floor,
    @JsonKey(name: 'additional_comment') String? additionalComment,
    @JsonKey(name: 'user_id') int? userId,
    String? address,
    String? phone,
    String? time,
    int? partnerId,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    int? active,
  }) = _AddressDTO;

  factory AddressDTO.fromJson(Map<String, dynamic> json) => _$AddressDTOFromJson(json);
}
