import 'package:flutter/foundation.dart';
import 'package:ikidz/src/core/rest_client/rest_client.dart';
import 'package:ikidz/src/core/utils/talker_logger_util.dart';
import 'package:ikidz/src/feature/main/model/main_dto.dart';

abstract interface class IMainRemoteDS {
  Future<List<CategoryDTO>> categories();
  Future<List<CentersDTO>> newCenters({required int perPage});

  Future<CentersDTO> centerDetail({required int id});

  Future<List<BannerDTO>> banners();
}

class MainRemoteDSImpl implements IMainRemoteDS {
  const MainRemoteDSImpl({
    required this.restClient,
  });
  final IRestClient restClient;

  @override
  Future<List<CategoryDTO>> categories() async {
    try {
      final Map<String, dynamic> response = await restClient.get(
        'categories',
        queryParams: {},
      );

      if (response['data'] == null) {
        throw Exception();
      }
      final list = await compute<List<dynamic>, List<CategoryDTO>>(
        (list) => list
            .map(
              (e) => CategoryDTO.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        response['data'] as List,
      );
      return list;
    } catch (e, st) {
      TalkerLoggerUtil.talker.error('#categories - $e', e, st);
      rethrow;
    }
  }

  @override
  Future<List<CentersDTO>> newCenters({required int perPage}) async {
    try {
      final Map<String, dynamic> response = await restClient.get(
        'new-centers',
        queryParams: {
          'per_page': perPage,
        },
      );

      if (response['items'] == null) {
        throw Exception();
      }
      final list = await compute<List<dynamic>, List<CentersDTO>>(
        (list) => list
            .map(
              (e) => CentersDTO.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        response['items'] as List,
      );
      return list;
    } catch (e, st) {
      TalkerLoggerUtil.talker.error('#newCenters - $e', e, st);
      rethrow;
    }
  }

  @override
  Future<CentersDTO> centerDetail({
    required int id,
  }) async {
    try {
      final Map<String, dynamic> response = await restClient.get(
        'centers/$id',
        queryParams: {},
      );

      return CentersDTO.fromJson(response);
    } catch (e, st) {
      TalkerLoggerUtil.talker.error('#centerDetail - $e', e, st);
      rethrow;
    }
  }

  @override
  Future<List<BannerDTO>> banners() async {
    try {
      final Map<String, dynamic> response = await restClient.get(
        'banners',
        queryParams: {},
      );

      if (response['data'] == null) {
        throw Exception();
      }
      final list = await compute<List<dynamic>, List<BannerDTO>>(
        (list) => list
            .map(
              (e) => BannerDTO.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        response['data'] as List,
      );
      return list;
    } catch (e, st) {
      TalkerLoggerUtil.talker.error('#banners - $e', e, st);
      rethrow;
    }
  }
}
