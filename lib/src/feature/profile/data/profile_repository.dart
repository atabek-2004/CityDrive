import 'dart:io';

import 'package:ikidz/src/feature/auth/models/common_dto.dart';
import 'package:ikidz/src/feature/auth/models/request/child_payload.dart';
import 'package:ikidz/src/feature/auth/models/request/user_payload.dart';
import 'package:ikidz/src/feature/auth/models/user_dto.dart';
import 'package:ikidz/src/feature/profile/data/profile_remote_ds.dart';
import 'package:ikidz/src/feature/profile/models/child_dto.dart';
import 'package:ikidz/src/feature/profile/models/document_dto.dart';
import 'package:image_picker/image_picker.dart';

abstract interface class IProfileRepository {
  Future<UserDTO> profileData();

  // Future<List<AddressDTO>> addressList();

  // Future createAddress({
  //   required AddressPayload addressPayload,
  // });

  // Future<IncomeDTO> getStatistic({required String period});

  // Future<IncomeDTO> getBonus();

  Future deleteProfile();

  Future<List<CommonDTO>> cityList();

  // Future editAddress({
  //   required AddressPayload addressPayload,
  //   required int id,
  // });

  // Future deleteAddress({required int id});

  Future editProfile({
    required UserPayload payload,
    XFile? imageFile,
  });

  Future<List<ChildDTO>> myChildren();

  Future<ChildDTO> addChild({
    required ChildPayload payload,
    XFile? photoPath,
  });

  Future<List<DocumentDTO>> getDocuments();

  // Future scanDocument({
  //   String? iin,
  //   String? name,
  //   File? regisFile,
  //   File? accountFile,
  // });
}

class ProfileRepositoryImpl implements IProfileRepository {
  const ProfileRepositoryImpl({
    required IProfileRemoteDS remoteDS,
  }) : _remoteDS = remoteDS;
  final IProfileRemoteDS _remoteDS;

  @override
  Future<UserDTO> profileData() async {
    try {
      return await _remoteDS.profileData();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future deleteProfile() async {
    try {
      return await _remoteDS.deleteAccount();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<CommonDTO>> cityList() async {
    try {
      return await _remoteDS.cityList();
    } catch (e) {
      rethrow;
    }
  }

  // @override
  // Future<IncomeDTO> getStatistic({required String period}) async {
  //   try {
  //     return await _remoteDS.getStatistic(
  //       period: period,
  //     );
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // @override
  // Future<IncomeDTO> getBonus() async {
  //   try {
  //     return await _remoteDS.getBonus();
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // @override
  // Future createAddress({required AddressPayload addressPayload}) async {
  //   try {
  //     return await _remoteDS.createAddress(addressPayload: addressPayload);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // @override
  // Future editAddress({required AddressPayload addressPayload, required int id}) async {
  //   try {
  //     return await _remoteDS.editAddress(addressPayload: addressPayload, id: id);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // @override
  // Future scanDocument({
  //   String? iin,
  //   String? name,
  //   File? regisFile,
  //   File? accountFile,
  // }) async {
  //   try {
  //     return await _remoteDS.scanDocument(
  //       iin: iin,
  //       name: name,
  //       regisFile: regisFile,
  //       accountFile: accountFile,
  //     );
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // @override
  // Future<List<AddressDTO>> addressList() async {
  //   try {
  //     return await _remoteDS.addressList();
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  @override
  Future editProfile({
    required UserPayload payload,
    XFile? imageFile,
  }) async {
    try {
      return await _remoteDS.editAccount(
          userPayload: payload, avatar: imageFile);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<ChildDTO>> myChildren() async {
    try {
      return await _remoteDS.myChildren();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ChildDTO> addChild(
      {required ChildPayload payload, XFile? photoPath}) async {
    try {
      return await _remoteDS.addChild(
        payload: payload,
        photoPath: photoPath,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<DocumentDTO>> getDocuments() async {
    try {
      return await _remoteDS.getDocuments();
    } catch (e) {
      rethrow;
    }
  }

  // @override
  // Future deleteAddress({required int id}) async {
  //   try {
  //     return await _remoteDS.deleteAddress(id: id);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
}
