import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:city_drive/src/core/rest_client/rest_client.dart';
import 'package:city_drive/src/feature/profile/data/profile_repository.dart';
import 'package:city_drive/src/feature/profile/models/document_dto.dart';


part 'document_list_cubit.freezed.dart';

class DocumentListCubit extends Cubit<DocumentListState> {
  DocumentListCubit({
    required IProfileRepository repository,
  })  : _repository = repository,
        super(const DocumentListState.initial());
  final IProfileRepository _repository;

  Future<void> getDocumentsList({required String languageCode}) async {
    try {
      emit(const DocumentListState.loading());
      final documentDTO =
          await _repository.getDocuments(languageCode: languageCode);

      emit(
        DocumentListState.loaded(
          documentDTO: documentDTO,
        ),
      );
    } on RestClientException catch (e) {
      emit(
        DocumentListState.error(
          message: e.message,
        ),
      );
    } catch (e) {
      emit(
        DocumentListState.error(
          message: e.toString(),
        ),
      );
    }
  }
}

@freezed
class DocumentListState with _$DocumentListState {
  const factory DocumentListState.initial() = _InitialState;

  const factory DocumentListState.loading() = _LoadingState;

  const factory DocumentListState.loaded({
    required List<DocumentDTO> documentDTO,
  }) = _LoadedState;

  const factory DocumentListState.error({
    required String message,
  }) = _ErrorState;
}
