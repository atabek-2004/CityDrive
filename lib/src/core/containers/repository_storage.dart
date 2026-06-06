import 'package:city_drive/src/core/data/app_info_remote_ds.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:city_drive/src/core/data/session_repository.dart';
import 'package:city_drive/src/core/local_storage/hive_service.dart';
import 'package:city_drive/src/core/rest_client/rest_client.dart';
import 'package:city_drive/src/core/rest_client/src/dio_rest_client/src/dio_client.dart';
import 'package:city_drive/src/core/rest_client/src/dio_rest_client/src/interceptor/dio_interceptor.dart';
import 'package:city_drive/src/core/rest_client/src/dio_rest_client/src/rest_client_dio.dart';
import 'package:city_drive/src/core/config/api_config.dart';
import 'package:city_drive/src/feature/controller/data/controller_remote_ds.dart';
import 'package:city_drive/src/feature/controller/data/controller_repository.dart';
import 'package:city_drive/src/feature/auth/data/company_remote_ds.dart';
import 'package:city_drive/src/feature/auth/data/company_repository.dart';
import 'package:city_drive/src/feature/auth/data/auth_remote_ds.dart';
import 'package:city_drive/src/feature/auth/data/auth_repository.dart';
import 'package:city_drive/src/feature/auth/data/backend_auth_repository.dart';
import 'package:city_drive/src/feature/auth/database/auth_dao.dart';
import 'package:city_drive/src/feature/profile/data/profile_remote_ds.dart';
import 'package:city_drive/src/feature/profile/data/profile_repository.dart';
import 'package:city_drive/src/feature/search/data/road_problem_api_repository.dart';
import 'package:city_drive/src/feature/search/data/road_problem_remote_ds.dart';
import 'package:city_drive/src/feature/search/data/road_problem_repository.dart';
import 'package:city_drive/src/feature/main/data/news_remote_ds.dart';
import 'package:city_drive/src/feature/settings/data/app_settings_datasource.dart';

abstract class IRepositoryStorage {
  IAuthDao get authDao;
  HiveService get hiveService;
  ISessionRepository get sessionRepository;
  IRestClient get restClient;
  IAuthRepository get authRepository;
  IProfileRepository get profileRepository;
  IRoadProblemRepository get roadProblemRepository;
  NewsRemoteDS get newsRemoteDS;
  IAuthRemoteDS get authRemoteDS;
  IProfileRemoteDS get profileRemoteDS;
  IAppInfoRemoteDS get appInfoRemoteDS;
  ICompanyRepository get companyRepository;
  IControllerRepository get controllerRepository;

  void close();
}

class RepositoryStorage implements IRepositoryStorage {
  RepositoryStorage({
    required SharedPreferencesWithCache sharedPreferences,
    required PackageInfo packageInfo,
    required AppSettingsDatasource appSettingsDatasource,
    required HiveService hiveService,
  })  : _sharedPreferences = sharedPreferences,
        _packageInfo = packageInfo,
        _appSettingsDatasource = appSettingsDatasource,
        _hiveService = hiveService;
  final SharedPreferencesWithCache _sharedPreferences;
  final PackageInfo _packageInfo;
  final AppSettingsDatasource _appSettingsDatasource;
  final HiveService _hiveService;
  IRestClient? _restClient;
  ISessionRepository? _sessionRepository;
  IAuthRepository? _authRepository;
  IProfileRepository? _profileRepository;
  IRoadProblemRepository? _roadProblemRepository;
  NewsRemoteDS? _newsRemoteDS;
  IAppInfoRemoteDS? _appInfoRemoteDS;
  ICompanyRepository? _companyRepository;
  IControllerRepository? _controllerRepository;

  @override
  HiveService get hiveService => _hiveService;

  @override
  ISessionRepository get sessionRepository =>
      _sessionRepository ??= SessionRepository(_hiveService);

  @override
  Future<void> close() async {
    _restClient = null;
    await _hiveService.close();
  }

  /// [ApiConfig.baseUrl] — из `GET /api/info` → `flutter_base_url` (не localhost с телефона).
  @override
  IRestClient get restClient => _restClient ??= RestClientDio(
        baseUrl: '${ApiConfig.baseUrl}/',
        dioClient: DioClient(
          baseUrl: '${ApiConfig.baseUrl}/',
          interceptor: const DioInterceptor(),
          authDao: authDao,
          packageInfo: _packageInfo,
          appSettingsDS: _appSettingsDatasource,
        ),
      );

  @override
  IAuthRepository get authRepository => _authRepository ??= BackendAuthRepository(
        remoteDS: authRemoteDS,
        authDao: authDao,
        sessionRepository: sessionRepository,
        companyRepository: companyRepository,
      );

  @override
  IControllerRepository get controllerRepository =>
      _controllerRepository ??= ControllerRepositoryImpl(
        remoteDS: ControllerRemoteDS(
          (restClient as RestClientDio).dioClient.dio,
        ),
        roadProblemRepository: roadProblemRepository,
        authRepository: authRepository,
      );

  @override
  ICompanyRepository get companyRepository => _companyRepository ??=
      CompanyRepositoryImpl(
        remoteDS: CompanyRemoteDSImpl(restClient: restClient),
      );

  @override
  IProfileRepository get profileRepository => _profileRepository ??=
      ProfileRepositoryImpl(remoteDS: profileRemoteDS);

  @override
  IAppInfoRemoteDS get appInfoRemoteDS => _appInfoRemoteDS ??=
      AppInfoRemoteDSImpl(restClient: restClient);

  @override
  NewsRemoteDS get newsRemoteDS => _newsRemoteDS ??= NewsRemoteDS(
        (restClient as RestClientDio).dioClient.dio,
      );

  @override
  IRoadProblemRepository get roadProblemRepository =>
      _roadProblemRepository ??= RoadProblemApiRepository(
        RoadProblemRemoteDS(
          (restClient as RestClientDio).dioClient.dio,
        ),
      );

  @override
  IAuthRemoteDS get authRemoteDS => AuthRemoteDSImpl(
        restClient: restClient,
      );

  @override
  IProfileRemoteDS get profileRemoteDS => ProfileRemoteDSImpl(
        restClient: restClient,
      );

  @override
  IAuthDao get authDao => AuthDao(sharedPreferences: _sharedPreferences);
}
