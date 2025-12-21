import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ikidz/src/core/rest_client/rest_client.dart';
import 'package:ikidz/src/feature/main/model/main_dto.dart';
import 'package:ikidz/src/feature/search/data/search_repository.dart';

part 'search_section_cubit.freezed.dart';

class SearchSectionCubit extends Cubit<SearchSectionState> {
  final ISearchRepository _repository;
  SearchSectionCubit({required ISearchRepository repository})
      : _repository = repository,
        super(const SearchSectionState.initial());

  Future<void> searchSection({
    required String q,
    bool hasDelay = true,
    bool hasLoading = true,
  }) async {
    try {
      if (hasLoading) {
        emit(const SearchSectionState.loading());
      }

      if (hasDelay) {
        await Future.delayed(const Duration(milliseconds: 500));
      }

      final result = await _repository.searchSection(q: q);

      emit(SearchSectionState.loaded(result: result));
    } on RestClientException catch (e) {
      emit(SearchSectionState.error(message: e.message));
    } catch (e) {
      emit(SearchSectionState.error(message: e.toString()));
    }
  }
}

@freezed
class SearchSectionState with _$SearchSectionState{
  const factory SearchSectionState.initial() = _InitialState;
  const factory SearchSectionState.loading() = _LoadingState;
  const factory SearchSectionState.loaded({
    required List<CentersDTO> result,
  }) = _LoadedState;
  const factory SearchSectionState.error({
    required String message,
  }) = _ErrorState;
}
