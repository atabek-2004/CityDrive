import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ikidz/src/feature/auth/models/common_dto.dart';
import 'package:ikidz/src/feature/profile/data/profile_repository.dart';
import 'package:ikidz/src/feature/profile/models/child_dto.dart';


part 'my_children_cubit.freezed.dart';

class MyChildrenCubit extends Cubit<MyChildrenState> {
  MyChildrenCubit({
    required IProfileRepository repository,
  })  : _repository = repository,
        super(const MyChildrenState.initial());
  final IProfileRepository _repository;

  Future<void> getMyChildren() async {
    try {
      emit(const MyChildrenState.loading());

      final result = await _repository.myChildren();

      if (isClosed) return;
      emit(MyChildrenState.loaded(response: result));
    } catch (e) {
      emit(
        MyChildrenState.error(
          message: e.toString(),
        ),
      );
    }
  }

}

@freezed
class MyChildrenState with _$MyChildrenState {
  const factory MyChildrenState.initial() = _InitialState;

  const factory MyChildrenState.loading() = _LoadingState;

  const factory MyChildrenState.loaded({
    required List<ChildDTO> response,
  }) = _LoadedState;

  const factory MyChildrenState.unLoaded({
    required List<CommonDTO> response,
  }) = _UnLoadedState;

  const factory MyChildrenState.error({
    required String message,
  }) = _ErrorState;
}
