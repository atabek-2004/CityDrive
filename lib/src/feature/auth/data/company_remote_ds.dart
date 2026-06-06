import 'dart:io';

import 'package:dio/dio.dart';
import 'package:city_drive/src/core/rest_client/rest_client.dart';
import 'package:city_drive/src/core/rest_client/src/exception/rest_client_exception.dart';
import 'package:city_drive/src/core/utils/talker_logger_util.dart';
import 'package:city_drive/src/feature/auth/models/company_dto.dart';

abstract interface class ICompanyRemoteDS {
  Future<CompanyDTO> saveCompany(CompanyRequest request);

  Future<CompanyDTO?> getCompany();

  Future<CompanyDocumentsResponse> uploadDocuments({
    required File registrationCertificate,
    required File portfolio,
  });

  Future<ApprovalStatusDTO> getApprovalStatus();

  Future<RegistrationStateDTO> getRegistrationState();
}

class CompanyRemoteDSImpl implements ICompanyRemoteDS {
  const CompanyRemoteDSImpl({required this.restClient});

  final IRestClient restClient;

  @override
  Future<CompanyDTO> saveCompany(CompanyRequest request) async {
    try {
      final response = await restClient.post(
        'company',
        body: request.toJson(),
      );
      return CompanyDTO.fromJson(response);
    } catch (e, st) {
      TalkerLoggerUtil.talker.error('#saveCompany - $e', e, st);
      rethrow;
    }
  }

  @override
  Future<CompanyDTO?> getCompany() async {
    try {
      final response = await restClient.get('company');
      return CompanyDTO.fromJson(response);
    } on RestClientException catch (e) {
      if (e.statusCode == 404) return null;
      rethrow;
    } catch (e, st) {
      TalkerLoggerUtil.talker.error('#getCompany - $e', e, st);
      rethrow;
    }
  }

  @override
  Future<CompanyDocumentsResponse> uploadDocuments({
    required File registrationCertificate,
    required File portfolio,
  }) async {
    try {
      final formData = FormData.fromMap({
        'registration_certificate':
            await MultipartFile.fromFile(registrationCertificate.path),
        'portfolio': await MultipartFile.fromFile(portfolio.path),
      });

      final response = await restClient.post(
        'company/documents',
        body: formData,
      );

      return CompanyDocumentsResponse.fromJson(response);
    } catch (e, st) {
      TalkerLoggerUtil.talker.error('#uploadCompanyDocuments - $e', e, st);
      rethrow;
    }
  }

  @override
  Future<ApprovalStatusDTO> getApprovalStatus() async {
    try {
      final response = await restClient.get('user/approval-status');
      return ApprovalStatusDTO.fromJson(response);
    } catch (e, st) {
      TalkerLoggerUtil.talker.error('#getApprovalStatus - $e', e, st);
      rethrow;
    }
  }

  @override
  Future<RegistrationStateDTO> getRegistrationState() async {
    try {
      final response =
          await restClient.get('company/registration-state');
      return RegistrationStateDTO.fromJson(response);
    } catch (e, st) {
      TalkerLoggerUtil.talker.error('#getRegistrationState - $e', e, st);
      rethrow;
    }
  }
}
