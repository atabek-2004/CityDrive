// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'product_payload.freezed.dart';
// part 'product_payload.g.dart';

// @freezed
// class ProductPayload with _$ProductPayload {
//   const factory ProductPayload({
//     @JsonKey(includeIfNull: false) String? name,
//     @JsonKey(includeIfNull: false) String? description,
//     @JsonKey(includeIfNull: false) String? price,
//     @JsonKey(name: 'discount_price', includeIfNull: false) String? discount,
//     @JsonKey(name: 'product_count', includeIfNull: false) int? count,
//     @JsonKey(name: 'catalog_id', includeIfNull: false) int? catalogId,
//     @JsonKey(name: 'subcatalog_id', includeIfNull: false) int? subcatalogId,
//     @JsonKey(includeIfNull: false) int? installment,
//     @JsonKey(name: 'color_id', includeIfNull: false) int? colorId,
//     @JsonKey(name: 'character_options[]') List<int>? characterOptions,
//     @JsonKey(name: 'characters[]') List<int>? characters,
//     // @JsonKey(includeIfNull: false) int? recommendation,
//   }) = _ProductPayload;

//   factory ProductPayload.fromJson(Map<String, dynamic> json) => _$ProductPayloadFromJson(json);
// }
