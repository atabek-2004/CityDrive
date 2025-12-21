import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ikidz/src/core/rest_client/rest_client.dart';
import 'package:ikidz/src/feature/search/data/search_repository.dart';
import 'package:ikidz/src/feature/search/model/schedule_dto.dart';

part 'upcoming_events_cubit.freezed.dart';

class UpcomingEventsCubit extends Cubit<UpcomingEventsState> {
  final ISearchRepository _repository;
  UpcomingEventsCubit({required ISearchRepository repository})
      : _repository = repository,
        super(const UpcomingEventsState.initial());

  Future<void> upcomingEvents({required int perPage}) async {
    try {
      emit(const UpcomingEventsState.loading());

      final result = await _repository.upcomingEvents(
        perPage: perPage,
      );

      emit(UpcomingEventsState.loaded(result: result));
    } on RestClientException catch (e) {
      emit(UpcomingEventsState.error(message: e.message));
    } catch (e) {
      emit(UpcomingEventsState.error(message: e.toString()));
    }
  }
}

@freezed
class UpcomingEventsState with _$UpcomingEventsState {
  const factory UpcomingEventsState.initial() = _InitialState;
  const factory UpcomingEventsState.loading() = _LoadingState;
  const factory UpcomingEventsState.loaded({
    required ScheduleItemsDTO? result,
  }) = _LoadedState;
  const factory UpcomingEventsState.error({
    required String message,
  }) = _ErrorState;
}
