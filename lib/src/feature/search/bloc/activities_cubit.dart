import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ikidz/src/core/rest_client/rest_client.dart';
import 'package:ikidz/src/feature/main/model/main_dto.dart';
import 'package:ikidz/src/feature/search/data/search_repository.dart';
import 'package:ikidz/src/feature/search/model/schedule_dto.dart';

part 'activities_cubit.freezed.dart';

class ActivitiesCubit extends Cubit<ActivitiesState> {
  final ISearchRepository _repository;
  ActivitiesCubit({required ISearchRepository repository})
      : _repository = repository,
        super(const ActivitiesState.initial());

  Future<void> activities({
    required int categoryId,
  }) async {
    try {
      emit(const ActivitiesState.loading());

      final result = await _repository.activities(
        categoryId: categoryId,
      );

      emit(ActivitiesState.loaded(result: result));
    } on RestClientException catch (e) {
      emit(ActivitiesState.error(message: e.message));
    } catch (e) {
      emit(ActivitiesState.error(message: e.toString()));
    }
  }
}

@freezed
class ActivitiesState with _$ActivitiesState {
  const factory ActivitiesState.initial() = _InitialState;
  const factory ActivitiesState.loading() = _LoadingState;
  const factory ActivitiesState.loaded({
    required List<ActivityDTO> result,
  }) = _LoadedState;
  const factory ActivitiesState.error({
    required String message,
  }) = _ErrorState;
}
