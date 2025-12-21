import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ikidz/src/core/rest_client/rest_client.dart';
import 'package:ikidz/src/feature/main/data/main_repository.dart';
import 'package:ikidz/src/feature/main/model/main_dto.dart';

part 'categories_cubit.freezed.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit({
    required IMainRepository repository,
  })  : _repository = repository,
        super(const CategoriesState.initial());
  final IMainRepository _repository;

  Future<void> categories() async {
    try {
      emit(const CategoriesState.loading());
      final result = await _repository.categories();

      if (isClosed) return;

      emit(
        CategoriesState.loaded(categories: result),
      );
    } on RestClientException catch (e) {
      emit(
        CategoriesState.error(
          message: e.message,
        ),
      );
    } catch (e) {
      emit(
        CategoriesState.error(
          message: e.toString(),
        ),
      );
    }
  }
}

@freezed
class CategoriesState with _$CategoriesState {
  const factory CategoriesState.initial() = _InitialState;

  const factory CategoriesState.loading() = _LoadingState;

  const factory CategoriesState.loaded({
    required List<CategoryDTO> categories,
  }) = _LoadedState;

  const factory CategoriesState.error({
    required String message,
  }) = _ErrorState;
}
