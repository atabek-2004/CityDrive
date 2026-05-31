import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:city_drive/src/feature/auth/models/common_dto.dart';
import 'package:city_drive/src/feature/profile/data/profile_repository.dart';


part 'city_cubit.freezed.dart';

class CityCubit extends Cubit<CityState> {
  CityCubit({
    required IProfileRepository repository,
  })  : _repository = repository,
        super(const CityState.initial());
  final IProfileRepository _repository;

  Future<void> getCityList() async {
    try {
      emit(const CityState.loading());

      final result = await _repository.cityList();

      if (isClosed) return;
      emit(CityState.loaded(response: result));
    } catch (e) {
      emit(
        CityState.error(
          message: e.toString(),
        ),
      );
    }
  }

}

@freezed
class CityState with _$CityState {
  const factory CityState.initial() = _InitialState;

  const factory CityState.loading() = _LoadingState;

  const factory CityState.loaded({
    required List<CommonDTO> response,
  }) = _LoadedState;

  const factory CityState.unLoaded({
    required List<CommonDTO> response,
  }) = _UnLoadedState;

  const factory CityState.error({
    required String message,
  }) = _ErrorState;
}
