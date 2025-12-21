import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ikidz/src/core/rest_client/rest_client.dart';
import 'package:ikidz/src/feature/main/model/main_dto.dart';
import 'package:ikidz/src/feature/search/data/search_repository.dart';

part 'centers_in_map_cubit.freezed.dart';

class CentersInMapCubit extends Cubit<CentersInMapState> {
  final ISearchRepository _repository;
  CentersInMapCubit({required ISearchRepository repository})
      : _repository = repository,
        super(const CentersInMapState.initial());

  Future<void> centers() async {
    try {
      emit(const CentersInMapState.loading());

      final result = await _repository.ceneters();

      emit(CentersInMapState.loaded(result: result));
    } on RestClientException catch (e) {
      emit(CentersInMapState.error(message: e.message));
    } catch (e) {
      emit(CentersInMapState.error(message: e.toString()));
    }
  }
}

@freezed
class CentersInMapState with _$CentersInMapState {
  const factory CentersInMapState.initial() = _InitialState;
  const factory CentersInMapState.loading() = _LoadingState;
  const factory CentersInMapState.loaded({
    required List<CentersDTO> result,
  }) = _LoadedState;
  const factory CentersInMapState.error({
    required String message,
  }) = _ErrorState;
}
