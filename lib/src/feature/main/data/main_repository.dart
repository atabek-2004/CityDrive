import 'package:ikidz/src/feature/main/data/main_remote_ds.dart';
import 'package:ikidz/src/feature/main/model/main_dto.dart';

abstract interface class IMainRepository {
  Future<List<CategoryDTO>> categories();
  Future<List<CentersDTO>> newCenters({required int perPage});

  Future<CentersDTO> centerDetail({required int id});

  Future<List<BannerDTO>> banners();
}

class MainRepositoryImpl implements IMainRepository {
  const MainRepositoryImpl({
    required IMainRemoteDS remoteDS,
  }) : _remoteDS = remoteDS;
  final IMainRemoteDS _remoteDS;

  @override
  Future<List<CategoryDTO>> categories() async {
    try {
      return await _remoteDS.categories();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<CentersDTO>> newCenters({required int perPage}) async {
    try {
      return await _remoteDS.newCenters(
        perPage: perPage,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<CentersDTO> centerDetail({required int id}) async {
    try {
      return await _remoteDS.centerDetail(id: id);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<BannerDTO>> banners() async {
    try {
      return await _remoteDS.banners();
    } catch (e) {
      rethrow;
    }
  }
}
