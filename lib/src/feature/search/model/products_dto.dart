// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:ikidz/src/feature/search/model/catalog_dto.dart';

// part 'products_dto.freezed.dart';
// part 'products_dto.g.dart';

// @freezed
// class ProductsWithCatalogDTO with _$ProductsWithCatalogDTO {
//   const factory ProductsWithCatalogDTO({
//     @JsonKey(name: 'catalog_id') int? catalogId,
//     @JsonKey(name: 'catalog_name') String? catalogName,
//     List<ProductDTO>? products,
//   }) = _ProductsWithCatalogDTO;

//   factory ProductsWithCatalogDTO.fromJson(Map<String, dynamic> json) => _$ProductsWithCatalogDTOFromJson(json);
// }

// @freezed
// class ProductDTO with _$ProductDTO {
//   const factory ProductDTO({
//     int? id,
//     String? name,
//     String? description,
//     int? discount,
//     int? price,
//     @JsonKey(name: 'product_count') int? count,
//     @JsonKey(name: 'catalog_id') int? catalogId,
//     @JsonKey(name: 'subcatalog_id') int? subcatalogId,
//     @JsonKey(name: 'discount_price') int? discountPrice,
//     int? installment,
//     @JsonKey(name: 'color_id') int? colorId,
//     @JsonKey(name: 'partner_id') int? partnerId,
//     int? recommendation,
//     SubcatalogDTO? color,
//     @JsonKey(name: 'created_at') String? createdAt,
//     @JsonKey(name: 'updated_at') String? updatedAt,
//     List<ImageDTO>? images,
//     CatalogDTO? catalog,
//     SubcatalogDTO? subcatalog,
//     @JsonKey(name: 'character_products') List<CharacterProductsDTO>? characterProducts,
//   }) = _ProductDTO;

//   factory ProductDTO.fromJson(Map<String, dynamic> json) => _$ProductDTOFromJson(json);
// }

// @freezed
// class CharacterProductsDTO with _$CharacterProductsDTO {
//   const factory CharacterProductsDTO({
//     int? id,
//     SubcatalogDTO? characteristic,
//     @JsonKey(name: 'character_option') ParametersDTO? characterOption,
//   }) = _CharacterProductsDTO;

//   factory CharacterProductsDTO.fromJson(Map<String, dynamic> json) => _$CharacterProductsDTOFromJson(json);
// }

// @freezed
// class CatalogDetailsDTO with _$CatalogDetailsDTO {
//   const factory CatalogDetailsDTO({
//     int? id,
//     String? name,
//     String? photo,
//     @JsonKey(name: 'is_hit') int? isHit,
//   }) = _CatalogDetailsDTO;

//   factory CatalogDetailsDTO.fromJson(Map<String, dynamic> json) => _$CatalogDetailsDTOFromJson(json);
// }

// @freezed
// class SubCatalogDetailsDTO with _$SubCatalogDetailsDTO {
//   const factory SubCatalogDetailsDTO({
//     int? id,
//     String? name,
//     @JsonKey(name: 'catalog_id') int? catalogId,
//   }) = _SubCatalogDetailsDTO;

//   factory SubCatalogDetailsDTO.fromJson(Map<String, dynamic> json) => _$SubCatalogDetailsDTOFromJson(json);
// }

// @freezed
// class ImageDTO with _$ImageDTO {
//   const factory ImageDTO({
//     int? id,
//     @JsonKey(name: 'product_id') int? productId,
//     String? image,
//     @JsonKey(name: 'created_at') String? createdAt,
//     @JsonKey(name: 'updated_at') String? updatedAt,
//   }) = _ImageDTO;

//   factory ImageDTO.fromJson(Map<String, dynamic> json) => _$ImageDTOFromJson(json);
// }
