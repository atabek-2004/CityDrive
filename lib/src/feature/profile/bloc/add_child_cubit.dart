import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ikidz/src/feature/auth/models/common_dto.dart';
import 'package:ikidz/src/feature/auth/models/request/child_payload.dart';
import 'package:ikidz/src/feature/profile/data/profile_repository.dart';
import 'package:ikidz/src/feature/profile/models/child_dto.dart';
import 'package:image_picker/image_picker.dart';

part 'add_child_cubit.freezed.dart';

class AddChildCubit extends Cubit<AddChildState> {
  AddChildCubit({
    required IProfileRepository repository,
  })  : _repository = repository,
        super(const AddChildState.initial());
  final IProfileRepository _repository;

  Future<void> addChild({
    required ChildPayload payload,
    XFile? photoPath,
  }) async {
    try {
      emit(const AddChildState.loading());

      final result = await _repository.addChild(
        payload: payload,
        photoPath: photoPath,
      );

      if (isClosed) return;
      emit(AddChildState.loaded(response: result));
    } catch (e) {
      emit(
        AddChildState.error(
          message: e.toString(),
        ),
      );
    }
  }
}

@freezed
class AddChildState with _$AddChildState {
  const factory AddChildState.initial() = _InitialState;

  const factory AddChildState.loading() = _LoadingState;

  const factory AddChildState.loaded({
    required ChildDTO response,
  }) = _LoadedState;

  const factory AddChildState.unLoaded({
    required List<CommonDTO> response,
  }) = _UnLoadedState;

  const factory AddChildState.error({
    required String message,
  }) = _ErrorState;
}
