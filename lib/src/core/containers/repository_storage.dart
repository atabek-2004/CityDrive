import 'package:ikidz/src/feature/main/data/main_remote_ds.dart';
import 'package:ikidz/src/feature/main/data/main_repository.dart';
import 'package:ikidz/src/feature/search/data/search_remote_ds.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ikidz/src/core/rest_client/rest_client.dart';
import 'package:ikidz/src/core/rest_client/src/dio_rest_client/src/dio_client.dart';
import 'package:ikidz/src/core/rest_client/src/dio_rest_client/src/interceptor/dio_interceptor.dart';
import 'package:ikidz/src/core/rest_client/src/dio_rest_client/src/rest_client_dio.dart';
import 'package:ikidz/src/feature/auth/data/auth_remote_ds.dart';
import 'package:ikidz/src/feature/auth/data/auth_repository.dart';
import 'package:ikidz/src/feature/auth/database/auth_dao.dart';
import 'package:ikidz/src/feature/chat/data/chat_remote_ds.dart';
import 'package:ikidz/src/feature/chat/data/chat_repository.dart';
import 'package:ikidz/src/feature/main/data/orders_remote_ds.dart';
import 'package:ikidz/src/feature/main/data/orders_repository.dart';
import 'package:ikidz/src/feature/search/data/search_repository.dart';
import 'package:ikidz/src/feature/profile/data/profile_remote_ds.dart';
import 'package:ikidz/src/feature/profile/data/profile_repository.dart';
import 'package:ikidz/src/feature/settings/data/app_settings_datasource.dart';

abstract class IRepositoryStorage {
  // dao's
  IAuthDao get authDao;
  // ISettingsDao get settingsDao;
  // ITipsDao get tipsDao;

  /// Network
  IRestClient get restClient;

  // Repositories
  // ISettingsRepository get settings;
  IAuthRepository get authRepository;
  IMainRepository get mainRepository;
  // IOrdersRepository get ordersRepository;
  ISearchRepository get searchRepository;
  IProfileRepository get profileRepository;
  // IChatRepository get chatRepository;

  // Data sources
  IAuthRemoteDS get authRemoteDS;
  // IOrdersRemoteDS get ordersRemoteDS;
  ISearchRemoteDS get searchRemoteDS;
  // IChatRemoteDS get chatRemoteDS;
  IProfileRemoteDS get profileRemoteDS;
  IMainRemoteDS get mainRemoteDS;
  // IProfileRemoteDS get profileRemoteDS;

  void close();
}

class RepositoryStorage implements IRepositoryStorage {
  RepositoryStorage({
    required SharedPreferencesWithCache sharedPreferences,
    required PackageInfo packageInfo,
    required AppSettingsDatasource appSettingsDatasource,
  })  : _sharedPreferences = sharedPreferences,
        _packageInfo = packageInfo,
        _appSettingsDatasource = appSettingsDatasource;
  final SharedPreferencesWithCache _sharedPreferences;
  final PackageInfo _packageInfo;
  final AppSettingsDatasource _appSettingsDatasource;
  IRestClient? _restClient;

  @override
  Future<void> close() async {
    _restClient = null;
    // _portalRestClient = null;
    // _marketplaceRestClient = null;
    // _gamificationRestClient = null;
  }

  ///
  /// Network
  ///
  @override
  IRestClient get restClient => _restClient ??= RestClientDio(
        baseUrl: 'http://91.243.71.181:8080/api/', // TODO: Env.apiUrl,
        // baseUrl: 'http://185.100.67.120:8084/api/v1', // TODO: Env.apiUrl,
        dioClient: DioClient(
          baseUrl: 'http://91.243.71.181:8080/api',
          // baseUrl: 'http://185.100.67.120:8084/api/v1',
          interceptor: const DioInterceptor(),
          authDao: authDao,
          packageInfo: _packageInfo,
          appSettingsDS: _appSettingsDatasource,
          // settings: SettingsDao(sharedPreferences: sharedPreferences),
        ),
      );

  ///
  /// Repositories
  ///
  @override
  IAuthRepository get authRepository => AuthRepositoryImpl(
        remoteDS: authRemoteDS,
        authDao: authDao,
      );

  // @override
  // IOrdersRepository get ordersRepository => OrdersRepositoryImpl(
  //       remoteDS: ordersRemoteDS,
  //     );

  @override
  ISearchRepository get searchRepository => ProductRepositoryImpl(
        remoteDS: searchRemoteDS,
      );

  @override
  IProfileRepository get profileRepository => ProfileRepositoryImpl(
        remoteDS: profileRemoteDS,
      );

  @override
  IMainRepository get mainRepository => MainRepositoryImpl(
        remoteDS: mainRemoteDS,
      );

  @override
  IMainRemoteDS get mainRemoteDS => MainRemoteDSImpl(
        restClient: restClient,
      );

  // @override
  // IChatRepository get chatRepository => ChatRepositoryImpl(
  //       remoteDS: chatRemoteDS,
  //     );

  ///
  /// Remote datasources
  ///
  @override
  IAuthRemoteDS get authRemoteDS => AuthRemoteDSImpl(
        restClient: restClient,
      );

  @override
  ISearchRemoteDS get searchRemoteDS => ProductRemoteDSImpl(
        restClient: restClient,
      );

  @override
  IProfileRemoteDS get profileRemoteDS => ProfileRemoteDSImpl(
        restClient: restClient,
      );

  // @override
  // IChatRemoteDS get chatRemoteDS => ChatRemoteDSImpl(
  //       restClient: restClient,
  //     );

  // @override
  // IOrdersRemoteDS get ordersRemoteDS => OrdersRemoteDSImpl(
  //       restClient: restClient,
  //     );

  ///
  /// Data Access Object
  ///
  @override
  IAuthDao get authDao => AuthDao(sharedPreferences: _sharedPreferences);
}
