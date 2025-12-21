import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ikidz/src/core/rest_client/rest_client.dart';
import 'package:ikidz/src/feature/main/data/main_repository.dart';
import 'package:ikidz/src/feature/main/model/main_dto.dart';

part 'center_detail_cubit.freezed.dart';

class CenterDetailCubit extends Cubit<CenterDetailState> {
  CenterDetailCubit({
    required IMainRepository repository,
  })  : _repository = repository,
        super(const CenterDetailState.initial());
  final IMainRepository _repository;

  Future<void> centerDetail({required int id}) async {
    try {
      emit(const CenterDetailState.loading());
      final result = await _repository.centerDetail(id: id);

      if (isClosed) return;

      emit(
        CenterDetailState.loaded(center: result),
      );
    } on RestClientException catch (e) {
      emit(
        CenterDetailState.error(
          message: e.message,
        ),
      );
    } catch (e) {
      emit(
        CenterDetailState.error(
          message: e.toString(),
        ),
      );
    }
  }

}

@freezed
class CenterDetailState with _$CenterDetailState {
  const factory CenterDetailState.initial() = _InitialState;

  const factory CenterDetailState.loading() = _LoadingState;

  const factory CenterDetailState.loaded({
    required CentersDTO center,
  }) = _LoadedState;

  const factory CenterDetailState.error({
    required String message,
  }) = _ErrorState;
}
