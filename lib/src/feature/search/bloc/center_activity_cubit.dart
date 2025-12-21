import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ikidz/src/core/rest_client/rest_client.dart';
import 'package:ikidz/src/feature/main/model/main_dto.dart';
import 'package:ikidz/src/feature/search/data/search_repository.dart';

part 'center_activity_cubit.freezed.dart';

class CenterActivityCubit extends Cubit<CenterActivityState> {
  final ISearchRepository _repository;
  CenterActivityCubit({required ISearchRepository repository})
      : _repository = repository,
        super(const CenterActivityState.initial());

  Future<void> centerActivity({required int centerActivityId}) async {
    try {
      emit(const CenterActivityState.loading());

      final result = await _repository.centersActivity(
        centerActivityId: centerActivityId,
      );

      emit(CenterActivityState.loaded(result: result));
    } on RestClientException catch (e) {
      emit(CenterActivityState.error(message: e.message));
    } catch (e) {
      emit(CenterActivityState.error(message: e.toString()));
    }
  }
}

@freezed
class CenterActivityState with _$CenterActivityState {
  const factory CenterActivityState.initial() = _InitialState;
  const factory CenterActivityState.loading() = _LoadingState;
  const factory CenterActivityState.loaded({
    required List<CentersDTO> result,
  }) = _LoadedState;
  const factory CenterActivityState.error({
    required String message,
  }) = _ErrorState;
}
