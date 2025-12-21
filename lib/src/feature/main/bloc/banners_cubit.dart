import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ikidz/src/core/rest_client/rest_client.dart';
import 'package:ikidz/src/feature/main/data/main_repository.dart';
import 'package:ikidz/src/feature/main/model/main_dto.dart';

part 'banners_cubit.freezed.dart';

class BannersCubit extends Cubit<BannersState> {
  BannersCubit({
    required IMainRepository repository,
  })  : _repository = repository,
        super(const BannersState.initial());
  final IMainRepository _repository;

  Future<void> banners() async {
    try {
      emit(const BannersState.loading());
      final result = await _repository.banners();

      

      if (isClosed) return;

      emit(
        BannersState.loaded(banners: result),
      );
    } on RestClientException catch (e) {
      emit(
        BannersState.error(
          message: e.message,
        ),
      );
    } catch (e) {
      emit(
        BannersState.error(
          message: e.toString(),
        ),
      );
    }
  }

}

@freezed
class BannersState with _$BannersState {
  const factory BannersState.initial() = _InitialState;

  const factory BannersState.loading() = _LoadingState;

  const factory BannersState.loaded({
    required List<BannerDTO> banners,
  }) = _LoadedState;

  const factory BannersState.error({
    required String message,
  }) = _ErrorState;
}
