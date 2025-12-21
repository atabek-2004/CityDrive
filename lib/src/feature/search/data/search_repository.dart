import 'package:ikidz/src/feature/main/model/main_dto.dart';
import 'package:ikidz/src/feature/search/data/search_remote_ds.dart';

import 'package:ikidz/src/feature/search/model/schedule_dto.dart';

abstract interface class ISearchRepository {
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

  // Future<List<CatalogDTO>> getCatalog();
  // Future<List<ProductsWithCatalogDTO>> getProducts();
  // Future<List<SubcatalogDTO>> getCharacteristics();

  // Future<int> newsLikeOrUnlike({
  //   required int newsId,
  // });

  // Future adverticeProduct({
  //   required int id,
  //   required int day,
  //   required int autoExtend,
  //   required String price,
  // });

  Future<List<CentersDTO>> searchSection({
    required String q,
  });

  Future<List<CentersDTO>> ceneters();

  Future<List<ScheduleDTO>> scheduleCenter(
      {required int id, required int dayOfWeek});

  Future<ScheduleItemsDTO> upcomingEvents({required int perPage});

  Future<List<ActivityDTO>> activities({required int categoryId});

  Future<List<CentersDTO>> centersActivity({required int centerActivityId});
}

class ProductRepositoryImpl implements ISearchRepository {
  const ProductRepositoryImpl({
    required ISearchRemoteDS remoteDS,
  }) : _remoteDS = remoteDS;
  final ISearchRemoteDS _remoteDS;

  // @override
  // Future createProduct({
  //   required ProductPayload payload,
  //   List<File>? imageFile,
  // }) async {
  //   try {
  //     return await _remoteDS.createProduct(
  //         payload: payload, imageFile: imageFile);
  //   } catch (e) {
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
  //     return await _remoteDS.editProduct(
  //         id: id, payload: payload, imageFile: imageFile);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // @override
  // Future deleteProduct({
  //   required int id,
  // }) async {
  //   try {
  //     return await _remoteDS.deleteProduct(
  //       id: id,
  //     );
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // @override
  // Future deleteImage({
  //   required int productId,
  //   required int id,
  // }) async {
  //   try {
  //     return await _remoteDS.deleteImage(id: id, productId: productId);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // @override
  // Future<List<CatalogDTO>> getCatalog() async {
  //   try {
  //     return await _remoteDS.getCatalog();
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // @override
  // Future<List<ProductsWithCatalogDTO>> getProducts() async {
  //   try {
  //     return await _remoteDS.getProducts();
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // @override
  // Future<List<SubcatalogDTO>> getCharacteristics() async {
  //   try {
  //     return await _remoteDS.getCharacteristics();
  //   } catch (e) {
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
  //     return await _remoteDS.adverticeProduct(
  //       id: id,
  //       day: day,
  //       autoExtend: autoExtend,
  //       price: price,
  //     );
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // @override
  // Future<int> newsLikeOrUnlike({
  //   required int newsId,
  // }) async {
  //   try {
  //     return _remoteDS.newsLikeOrUnlike(newsId: newsId);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  @override
  Future<List<CentersDTO>> searchSection({required String q}) async {
    try {
      return _remoteDS.searchSection(q: q);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<CentersDTO>> ceneters() async {
    try {
      return _remoteDS.ceneters();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<ScheduleDTO>> scheduleCenter(
      {required int id, required int dayOfWeek}) async {
    try {
      return _remoteDS.scheduleCenter(
        id: id,
        dayOfWeek: dayOfWeek,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ScheduleItemsDTO> upcomingEvents({required int perPage}) async {
    try {
      return _remoteDS.upcomingEvents(perPage: perPage);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<ActivityDTO>> activities({required int categoryId}) async {
    try {
      return _remoteDS.activities(
        categoryId: categoryId,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<CentersDTO>> centersActivity(
      {required int centerActivityId}) async {
    try {
      return _remoteDS.centersActivity(
        centerActivityId: centerActivityId,
      );
    } catch (e) {
      rethrow;
    }
  }
}
