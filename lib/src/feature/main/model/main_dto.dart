import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ikidz/src/feature/search/model/schedule_dto.dart';

part 'main_dto.freezed.dart';
part 'main_dto.g.dart';

@freezed
class MainDTO with _$MainDTO {
  const factory MainDTO({
    List<CategoryDTO>? categories,
    List<CentersDTO>? centers,
  }) = _MainDTO;

  factory MainDTO.fromJson(Map<String, dynamic> json) =>
      _$MainDTOFromJson(json);
}

@freezed
class CategoryDTO with _$CategoryDTO {
  const factory CategoryDTO({
    int? id,
    String? title,
    String? color,
    String? description,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  }) = _CategoryDTO;

  factory CategoryDTO.fromJson(Map<String, dynamic> json) =>
      _$CategoryDTOFromJson(json);
}

@freezed
class CentersDTO with _$CentersDTO {
  const factory CentersDTO({
    int? id,
    String? name,
    String? address,
    String? description,
    double? latitude,
    double? longitude,
    String? logo,
    String? banner,
    String? color,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
    @JsonKey(name: 'is_active') int? isActivet,
    List<BannerDTO>? banners,
    List<ActivityDTO>? activities,
  }) = _CentersDTO;

  factory CentersDTO.fromJson(Map<String, dynamic> json) =>
      _$CentersDTOFromJson(json);
}

@freezed
class BannerDTO with _$BannerDTO {
  const factory BannerDTO({
    int? id,
    String? title,
    String? image,
  }) = _BannerDTO;

  factory BannerDTO.fromJson(Map<String, dynamic> json) =>
      _$BannerDTOFromJson(json);
}
