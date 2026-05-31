import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:city_drive/src/core/data/session_repository.dart';
import 'package:city_drive/src/core/local_storage/hive_service.dart';
import 'package:city_drive/src/core/rest_client/rest_client.dart';
import 'package:city_drive/src/core/rest_client/src/dio_rest_client/src/dio_client.dart';
import 'package:city_drive/src/core/rest_client/src/dio_rest_client/src/interceptor/dio_interceptor.dart';
import 'package:city_drive/src/core/rest_client/src/dio_rest_client/src/rest_client_dio.dart';
import 'package:city_drive/src/feature/auth/data/auth_remote_ds.dart';
import 'package:city_drive/src/feature/auth/data/auth_repository.dart';
import 'package:city_drive/src/feature/auth/data/local_auth_data_source.dart';
import 'package:city_drive/src/feature/auth/data/local_auth_repository.dart';
import 'package:city_drive/src/feature/auth/database/auth_dao.dart';
import 'package:city_drive/src/feature/profile/data/local_profile_repository.dart';
import 'package:city_drive/src/feature/profile/data/profile_remote_ds.dart';
import 'package:city_drive/src/feature/profile/data/profile_repository.dart';
import 'package:city_drive/src/feature/search/data/road_problem_local_ds.dart';
import 'package:city_drive/src/feature/search/data/road_problem_repository.dart';
import 'package:city_drive/src/feature/settings/data/app_settings_datasource.dart';

abstract class IRepositoryStorage {
  IAuthDao get authDao;
  HiveService get hiveService;
  ISessionRepository get sessionRepository;
  IRestClient get restClient;
  IAuthRepository get authRepository;
  IProfileRepository get profileRepository;
  IRoadProblemRepository get roadProblemRepository;
  IAuthRemoteDS get authRemoteDS;
  IProfileRemoteDS get profileRemoteDS;

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
  LocalAuthDataSource? _localAuthDS;
  IAuthRepository? _authRepository;
  IProfileRepository? _profileRepository;
  IRoadProblemRepository? _roadProblemRepository;

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

  @override
  IRestClient get restClient => _restClient ??= RestClientDio(
        baseUrl: 'http://91.243.71.181:8080/api/',
        dioClient: DioClient(
          baseUrl: 'http://91.243.71.181:8080/api',
          interceptor: const DioInterceptor(),
          authDao: authDao,
          packageInfo: _packageInfo,
          appSettingsDS: _appSettingsDatasource,
        ),
      );

  LocalAuthDataSource get _localAuth =>
      _localAuthDS ??= LocalAuthDataSource(_hiveService);

  @override
  IAuthRepository get authRepository => _authRepository ??= LocalAuthRepository(
        authDao: authDao,
        localDS: _localAuth,
        sessionRepository: sessionRepository,
        hiveService: _hiveService,
      );

  @override
  IProfileRepository get profileRepository => _profileRepository ??=
      LocalProfileRepository(
        authRepository: authRepository,
        localAuthDS: _localAuth,
      );

  @override
  IRoadProblemRepository get roadProblemRepository =>
      _roadProblemRepository ??= RoadProblemRepository(
        RoadProblemLocalDataSource(_hiveService),
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
