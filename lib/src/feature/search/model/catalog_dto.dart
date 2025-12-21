// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'catalog_dto.freezed.dart';
// part 'catalog_dto.g.dart';

// @freezed
// class CatalogDTO with _$CatalogDTO {
//   const factory CatalogDTO({
//     int? id,
//     String? name,
//     String? photo,
//     @JsonKey(name: 'is_hit') int? isHit,
//     List<SubcatalogDTO>? subcatalog,
//   }) = _CatalogDTO;

//   factory CatalogDTO.fromJson(Map<String, dynamic> json) => _$CatalogDTOFromJson(json);
// }

// @freezed
// class SubcatalogDTO with _$SubcatalogDTO {
//   const factory SubcatalogDTO({
//     int? id,
//     String? name,
//     @JsonKey(name: 'catalog_id') int? catalogId,
//     List<ParametersDTO>? parameters,
//   }) = _SubcatalogDTO;

//   factory SubcatalogDTO.fromJson(Map<String, dynamic> json) => _$SubcatalogDTOFromJson(json);
// }

// @freezed
// class ParametersDTO with _$ParametersDTO {
//   const factory ParametersDTO({
//     int? id,
//     String? name,
//     @JsonKey(name: 'characteristic_id') int? characteristicId,
//     ParametersDTO? parameters,
//   }) = _ParametersDTO;

//   factory ParametersDTO.fromJson(Map<String, dynamic> json) => _$ParametersDTOFromJson(json);
// }
