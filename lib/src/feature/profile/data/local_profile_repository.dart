import 'package:city_drive/src/core/rest_client/models/basic_response.dart';
import 'package:city_drive/src/feature/auth/data/auth_repository.dart';
import 'package:city_drive/src/feature/auth/data/local_auth_data_source.dart';
import 'package:city_drive/src/feature/auth/models/common_dto.dart';
import 'package:city_drive/src/feature/auth/models/request/user_payload.dart';
import 'package:city_drive/src/feature/auth/models/user_dto.dart';
import 'package:city_drive/src/feature/profile/data/profile_repository.dart';
import 'package:city_drive/src/feature/profile/models/document_dto.dart';
import 'package:image_picker/image_picker.dart';

/// Профиль из локальной сессии (Hive).
class LocalProfileRepository implements IProfileRepository {
  LocalProfileRepository({
    required IAuthRepository authRepository,
    required LocalAuthDataSource localAuthDS,
  })  : _authRepository = authRepository,
        _localAuthDS = localAuthDS;

  final IAuthRepository _authRepository;
  final LocalAuthDataSource _localAuthDS;

  @override
  Future<UserDTO> profileData() async {
    final current = _authRepository.user;
    if (current == null) {
      throw Exception('Пользователь не авторизован');
    }
    return current;
  }

  @override
  Future deleteProfile() async {
    await _authRepository.clearUser();
  }

  @override
  Future<List<CommonDTO>> cityList() async => _localAuthDS.cities;

  @override
  Future editProfile({
    required UserPayload payload,
    XFile? imageFile,
  }) async {
    final current = _authRepository.user;
    if (current?.id == null || current?.phone == null) return;

    final local = await _localAuthDS.findById(current!.id!);
    if (local == null) return;

    await _localAuthDS.updateUser(
      local.copyWith(
        fullName: payload.fullName ?? local.fullName,
        cityId: payload.cityId ?? local.cityId,
      ),
    );
  }

  @override
  Future<List<DocumentDTO>> getDocuments({required String languageCode}) async =>
      const [];

  @override
  Future<BasicResponse> logOut() async => const BasicResponse(message: 'ok');
}
