import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ikidz/src/core/rest_client/rest_client.dart';
import 'package:ikidz/src/feature/main/model/main_dto.dart';
import 'package:ikidz/src/feature/search/data/search_repository.dart';
import 'package:ikidz/src/feature/search/model/schedule_dto.dart';

part 'schedule_center_cubit.freezed.dart';

class ScheduleCenterCubit extends Cubit<ScheduleCenterState> {
  final ISearchRepository _repository;
  ScheduleCenterCubit({required ISearchRepository repository})
      : _repository = repository,
        super(const ScheduleCenterState.initial());

  Future<void> scheduleCenter({required int id, required int dayOfWeek}) async {
    try {
      emit(const ScheduleCenterState.loading());

      final result = await _repository.scheduleCenter(
        id: id,
        dayOfWeek: dayOfWeek,
      );

      emit(ScheduleCenterState.loaded(result: result));
    } on RestClientException catch (e) {
      emit(ScheduleCenterState.error(message: e.message));
    } catch (e) {
      emit(ScheduleCenterState.error(message: e.toString()));
    }
  }
}

@freezed
class ScheduleCenterState with _$ScheduleCenterState {
  const factory ScheduleCenterState.initial() = _InitialState;
  const factory ScheduleCenterState.loading() = _LoadingState;
  const factory ScheduleCenterState.loaded({
    required List<ScheduleDTO> result,
  }) = _LoadedState;
  const factory ScheduleCenterState.error({
    required String message,
  }) = _ErrorState;
}
