import 'dart:io';

import 'package:city_drive/src/feature/auth/data/company_remote_ds.dart';
import 'package:city_drive/src/feature/auth/models/company_dto.dart';

abstract interface class ICompanyRepository {
  Future<CompanyDTO> saveCompany(CompanyRequest request);

  Future<CompanyDTO?> getCompany();

  Future<CompanyDocumentsResponse> uploadDocuments({
    required File registrationCertificate,
    required File portfolio,
  });

  Future<ApprovalStatusDTO> getApprovalStatus();

  Future<RegistrationStateDTO> getRegistrationState();
}

class CompanyRepositoryImpl implements ICompanyRepository {
  const CompanyRepositoryImpl({required ICompanyRemoteDS remoteDS})
      : _remoteDS = remoteDS;

  final ICompanyRemoteDS _remoteDS;

  @override
  Future<CompanyDTO> saveCompany(CompanyRequest request) =>
      _remoteDS.saveCompany(request);

  @override
  Future<CompanyDTO?> getCompany() => _remoteDS.getCompany();

  @override
  Future<CompanyDocumentsResponse> uploadDocuments({
    required File registrationCertificate,
    required File portfolio,
  }) =>
      _remoteDS.uploadDocuments(
        registrationCertificate: registrationCertificate,
        portfolio: portfolio,
      );

  @override
  Future<ApprovalStatusDTO> getApprovalStatus() =>
      _remoteDS.getApprovalStatus();

  @override
  Future<RegistrationStateDTO> getRegistrationState() =>
      _remoteDS.getRegistrationState();
}
