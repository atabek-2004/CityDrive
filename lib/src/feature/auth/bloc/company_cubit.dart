import 'dart:io';

import 'package:city_drive/src/core/rest_client/rest_client.dart';
import 'package:city_drive/src/feature/auth/data/company_repository.dart';
import 'package:city_drive/src/feature/auth/models/company_dto.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'company_cubit.freezed.dart';

class CompanyCubit extends Cubit<CompanyState> {
  CompanyCubit({required ICompanyRepository repository})
      : _repository = repository,
        super(const CompanyState.initial());

  final ICompanyRepository _repository;

  Future<void> saveCompany(CompanyRequest request) async {
    try {
      emit(const CompanyState.loading());
      final company = await _repository.saveCompany(request);
      emit(CompanyState.companySaved(company: company));
    } on RestClientException catch (e) {
      emit(CompanyState.error(message: e.message));
    } catch (e) {
      emit(CompanyState.error(message: e.toString()));
    }
  }

  Future<void> uploadDocuments({
    required File registrationCertificate,
    required File portfolio,
  }) async {
    try {
      emit(const CompanyState.loading());
      final response = await _repository.uploadDocuments(
        registrationCertificate: registrationCertificate,
        portfolio: portfolio,
      );
      emit(CompanyState.documentsUploaded(response: response));
    } on RestClientException catch (e) {
      emit(CompanyState.error(message: e.message));
    } catch (e) {
      emit(CompanyState.error(message: e.toString()));
    }
  }
}

@freezed
class CompanyState with _$CompanyState {
  const factory CompanyState.initial() = _InitialState;

  const factory CompanyState.loading() = _LoadingState;

  const factory CompanyState.companySaved({required CompanyDTO company}) =
      _CompanySavedState;

  const factory CompanyState.documentsUploaded({
    required CompanyDocumentsResponse response,
  }) = _DocumentsUploadedState;

  const factory CompanyState.error({required String message}) = _ErrorState;
}
