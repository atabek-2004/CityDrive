import 'package:city_drive/src/core/rest_client/rest_client.dart';
import 'package:city_drive/src/core/utils/talker_logger_util.dart';

abstract interface class IAppInfoRemoteDS {
  Future<String?> fetchSupportWhatsappPhone();
}

class AppInfoRemoteDSImpl implements IAppInfoRemoteDS {
  const AppInfoRemoteDSImpl({required this.restClient});

  final IRestClient restClient;

  @override
  Future<String?> fetchSupportWhatsappPhone() async {
    try {
      final Map<String, dynamic> response = await restClient.get(
        'info',
        queryParams: {},
      );
      final support = response['support'];
      if (support is Map<String, dynamic>) {
        return support['whatsapp_phone'] as String?;
      }
      return null;
    } catch (e, st) {
      TalkerLoggerUtil.talker.error('#fetchAppInfo - $e', e, st);
      rethrow;
    }
  }
}
