import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ikidz/src/core/rest_client/rest_client.dart';
import 'package:ikidz/src/feature/main/data/main_repository.dart';
import 'package:ikidz/src/feature/main/model/main_dto.dart';

part 'centers_cubit.freezed.dart';

class CentersCubit extends Cubit<CentersState> {
  CentersCubit({
    required IMainRepository repository,
  })  : _repository = repository,
        super(const CentersState.initial());
  final IMainRepository _repository;

  Future<void> centers({
    required int perPage,
  }) async {
    try {
      emit(const CentersState.loading());
      final result = await _repository.newCenters(
        perPage: perPage,
      );

      if (isClosed) return;

      emit(
        CentersState.loaded(centers: result),
      );
    } on RestClientException catch (e) {
      emit(
        CentersState.error(
          message: e.message,
        ),
      );
    } catch (e) {
      emit(
        CentersState.error(
          message: e.toString(),
        ),
      );
    }
  }
}

@freezed
class CentersState with _$CentersState {
  const factory CentersState.initial() = _InitialState;

  const factory CentersState.loading() = _LoadingState;

  const factory CentersState.loaded({
    required List<CentersDTO> centers,
  }) = _LoadedState;

  const factory CentersState.error({
    required String message,
  }) = _ErrorState;
}
