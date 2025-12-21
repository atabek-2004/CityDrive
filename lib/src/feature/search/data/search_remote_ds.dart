import 'package:flutter/foundation.dart';
import 'package:ikidz/src/core/rest_client/src/dio_rest_client/rest_client_dio.dart';
import 'package:ikidz/src/core/utils/talker_logger_util.dart';
import 'package:ikidz/src/feature/main/model/main_dto.dart';
import 'package:ikidz/src/feature/search/model/schedule_dto.dart';

abstract interface class ISearchRemoteDS {
  // Future createProduct({
  //   required ProductPayload payload,
  //   List<File>? imageFile,
  // });

  // Future editProduct({
  //   required int id,
  //   required ProductPayload payload,
  //   List<File>? imageFile,
  // });

  // Future deleteProduct({
  //   required int id,
  // });

  // Future deleteImage({
  //   required int id,
  //   required int productId,
  // });

  // Future adverticeProduct({
  //   required int id,
  //   required int day,
  //   required int autoExtend,
  //   required String price,
  // });

  // Future<List<CatalogDTO>> getCatalog();
  // Future<List<ProductsWithCatalogDTO>> getProducts();
  // Future<List<SubcatalogDTO>> getCharacteristics();

  // Future<int> newsLikeOrUnlike({
  //   required int newsId,
  // });

  Future<List<CentersDTO>> ceneters();

  Future<List<CentersDTO>> searchSection({required String q});

  Future<List<ScheduleDTO>> scheduleCenter(
      {required int id, required int dayOfWeek});

  Future<ScheduleItemsDTO> upcomingEvents({required int perPage});

  Future<List<ActivityDTO>> activities({required int categoryId});

  Future<List<CentersDTO>> centersActivity({required int centerActivityId});
}

class ProductRemoteDSImpl implements ISearchRemoteDS {
  const ProductRemoteDSImpl({
    required this.restClient,
  });
  final IRestClient restClient;

  // @override
  // Future createProduct({
  //   required ProductPayload payload,
  //   List<File>? imageFile,
  // }) async {
  //   try {
  //     final FormData formData = FormData.fromMap(payload.toJson());
  //     if (imageFile != null) {
  //       //  log(photo.length.toString());
  //       for (int i = 0; i < imageFile.length; i++) {
  //         formData.files.add(
  //           MapEntry(
  //             'images[]',
  //             await MultipartFile.fromFile(imageFile[i].path),
  //           ),
  //         );
  //       }
  //     }

  //     await restClient.post(
  //       '/partner/products/create',
  //       body: formData,
  //     );
  //   } catch (e, st) {
  //     TalkerLoggerUtil.talker.error('#updateProfile - $e', e, st);
  //     rethrow;
  //   }
  // }

  // @override
  // Future editProduct({
  //   required int id,
  //   required ProductPayload payload,
  //   List<File>? imageFile,
  // }) async {
  //   try {
  //     final FormData formData = FormData.fromMap(payload.toJson());
  //     if (imageFile != null) {
  //       //  log(photo.length.toString());
  //       for (int i = 0; i < imageFile.length; i++) {
  //         formData.files.add(
  //           MapEntry(
  //             'images[]',
  //             await MultipartFile.fromFile(imageFile[i].path),
  //           ),
  //         );
  //       }
  //     }

  //     await restClient.post(
  //       '/partner/products/update/$id',
  //       body: formData,
  //     );
  //   } catch (e, st) {
  //     TalkerLoggerUtil.talker.error('#updateProfile - $e', e, st);
  //     rethrow;
  //   }
  // }

  // @override
  // Future deleteProduct({
  //   required int id,
  // }) async {
  //   try {
  //     await restClient.delete(
  //       '/partner/products/destroy/$id',
  //       body: {},
  //     );
  //   } catch (e, st) {
  //     TalkerLoggerUtil.talker.error('#updateProfile - $e', e, st);
  //     rethrow;
  //   }
  // }

  // @override
  // Future adverticeProduct({
  //   required int id,
  //   required int day,
  //   required int autoExtend,
  //   required String price,
  // }) async {
  //   try {
  //     await restClient.post(
  //       '/partner/products/ad/$id',
  //       body: {
  //         'day': day,
  //         'auto_extend': autoExtend,
  //       },
  //     );
  //   } catch (e, st) {
  //     TalkerLoggerUtil.talker.error('#updateProfile - $e', e, st);
  //     rethrow;
  //   }
  // }

  // @override
  // Future deleteImage({
  //   required int id,
  //   required int productId,
  // }) async {
  //   try {
  //     await restClient.delete(
  //       '/partner/products/delete/$productId/$id',
  //       body: {},
  //     );
  //   } catch (e, st) {
  //     TalkerLoggerUtil.talker.error('#updateProfile - $e', e, st);
  //     rethrow;
  //   }
  // }

  // @override
  // Future<List<CatalogDTO>> getCatalog() async {
  //   try {
  //     final Map<String, dynamic> response = await restClient.get(
  //       '/catalog',
  //     );

  //     if (response['data'] == null) {
  //       throw Exception();
  //     }
  //     final list = await compute<List<dynamic>, List<CatalogDTO>>(
  //       (list) => list
  //           .map(
  //             (e) => CatalogDTO.fromJson(e as Map<String, dynamic>),
  //           )
  //           .toList(),
  //       response['data'] as List,
  //     );
  //     return list;
  //   } catch (e, st) {
  //     TalkerLoggerUtil.talker.error('#getNews - $e', e, st);
  //     rethrow;
  //   }
  // }

  // @override
  // Future<List<ProductsWithCatalogDTO>> getProducts() async {
  //   try {
  //     final Map<String, dynamic> response = await restClient.get(
  //       '/partner/products',
  //     );

  //     if (response['data'] == null) {
  //       throw Exception();
  //     }
  //     final list = await compute<List<dynamic>, List<ProductsWithCatalogDTO>>(
  //       (list) => list
  //           .map(
  //             (e) => ProductsWithCatalogDTO.fromJson(e as Map<String, dynamic>),
  //           )
  //           .toList(),
  //       response['data'] as List,
  //     );
  //     return list;
  //   } catch (e, st) {
  //     TalkerLoggerUtil.talker.error('#getNews - $e', e, st);
  //     rethrow;
  //   }
  // }

  // @override
  // Future<List<SubcatalogDTO>> getCharacteristics() async {
  //   try {
  //     final Map<String, dynamic> response = await restClient.get(
  //       '/characteristics',
  //     );

  //     if (response['data'] == null) {
  //       throw Exception();
  //     }
  //     final list = await compute<List<dynamic>, List<SubcatalogDTO>>(
  //       (list) => list
  //           .map(
  //             (e) => SubcatalogDTO.fromJson(e as Map<String, dynamic>),
  //           )
  //           .toList(),
  //       response['data'] as List,
  //     );
  //     return list;
  //   } catch (e, st) {
  //     TalkerLoggerUtil.talker.error('#getCharacteristics- $e', e, st);
  //     rethrow;
  //   }
  // }

  // @override
  // Future<int> newsLikeOrUnlike({
  //   required int newsId,
  // }) async {
  //   try {
  //     final Map<String, dynamic> response = await restClient.post(
  //       '/v1/news/$newsId/like',
  //       body: null,
  //     );

  //     if (response.containsKey('like') && response['like'] is int) {
  //       return response['like'] as int;
  //     } else {
  //       throw WrongResponseTypeException(
  //         message:
  //             '''Unexpected response body type: ${response.runtimeType}\n$response''',
  //       );
  //     }
  //   } catch (e, st) {
  //     TalkerLoggerUtil.talker.error('#newsLikeOrUnlike - $e', e, st);
  //     rethrow;
  //   }
  // }

  @override
  Future<List<CentersDTO>> searchSection({required String q}) async {
    try {
      final Map<String, dynamic> response = await restClient.get(
        'search',
        queryParams: {
          'q': q,
        },
      );

      if (response['data'] == null) {
        throw Exception();
      }
      final list = await compute<List<dynamic>, List<CentersDTO>>(
        (list) => list
            .map(
              (e) => CentersDTO.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        response['data'] as List,
      );
      return list;
    } catch (e, st) {
      TalkerLoggerUtil.talker.error('#searchSection - $e', e, st);
      rethrow;
    }
  }

  @override
  Future<List<CentersDTO>> ceneters() async {
    try {
      final Map<String, dynamic> response = await restClient.get(
        'centers',
        queryParams: {},
      );

      if (response['data'] == null) {
        throw Exception();
      }
      final list = await compute<List<dynamic>, List<CentersDTO>>(
        (list) => list
            .map(
              (e) => CentersDTO.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        response['data'] as List,
      );
      return list;
    } catch (e, st) {
      TalkerLoggerUtil.talker.error('#ceneters - $e', e, st);
      rethrow;
    }
  }

  @override
  Future<List<ScheduleDTO>> scheduleCenter(
      {required int id, required int dayOfWeek}) async {
    try {
      final Map<String, dynamic> response = await restClient.get(
        'centers/schedule/$id',
        queryParams: {
          'day_of_week': dayOfWeek,
        },
      );

      if (response['data'] == null) {
        throw Exception();
      }
      final list = await compute<List<dynamic>, List<ScheduleDTO>>(
        (list) => list
            .map(
              (e) => ScheduleDTO.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        response['data'] as List,
      );
      return list;
    } catch (e, st) {
      TalkerLoggerUtil.talker.error('#scheduleCenter - $e', e, st);
      rethrow;
    }
  }

  @override
  Future<ScheduleItemsDTO> upcomingEvents({required int perPage}) async {
    try {
      final Map<String, dynamic> response = await restClient.get(
        'upcoming-events',
        queryParams: {
          'per_page': perPage,
        },
      );

      return await compute<Map<String, dynamic>, ScheduleItemsDTO>(
        ScheduleItemsDTO.fromJson,
        response,
      );
    } catch (e, st) {
      TalkerLoggerUtil.talker.error('#upcomingEvents - $e', e, st);
      rethrow;
    }
  }

  @override
  Future<List<ActivityDTO>> activities({required int categoryId}) async {
    try {
      final Map<String, dynamic> response = await restClient.get(
        'categories/$categoryId/activities',
        queryParams: {},
      );

      if (response['data'] == null) {
        throw Exception();
      }
      final list = await compute<List<dynamic>, List<ActivityDTO>>(
        (list) => list
            .map(
              (e) => ActivityDTO.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        response['data'] as List,
      );
      return list;
    } catch (e, st) {
      TalkerLoggerUtil.talker.error('#activities - $e', e, st);
      rethrow;
    }
  }

  @override
  Future<List<CentersDTO>> centersActivity({required int centerActivityId}) async {
    try {
      final Map<String, dynamic> response = await restClient.get(
        'centers-activity/$centerActivityId',
        queryParams: {},
      );

      if (response['data'] == null) {
        throw Exception();
      }
      final list = await compute<List<dynamic>, List<CentersDTO>>(
        (list) => list
            .map(
              (e) => CentersDTO.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        response['data'] as List,
      );
      return list;
    } catch (e, st) {
      TalkerLoggerUtil.talker.error('#centersActivity - $e', e, st);
      rethrow;
    }
  }
}
