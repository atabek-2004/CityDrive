import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:city_drive/src/core/rest_client/models/basic_response.dart';

import 'package:city_drive/src/feature/auth/data/auth_repository.dart';
import 'package:city_drive/src/feature/auth/models/request/user_payload.dart';

part 'new_password_cubit.freezed.dart';

class NewPasswordCubit extends Cubit<NewPasswordState> {
  NewPasswordCubit({
    required IAuthRepository repository,
  })  : _repository = repository,
        super(const NewPasswordState.initial());
  final IAuthRepository _repository;

  Future<void> newPassword({
    required UserPayload? payload,
    required String resetToken,
    required String password,
    required String passwordConf,
  }) async {
    try {
      emit(const NewPasswordState.loading());

      final result = await _repository.forgotPasswordChangePassword(
        resetToken: resetToken,
        password: password,
        passwordConf: passwordConf,
      );

      if (isClosed) return;

      emit(NewPasswordState.loaded(message: result));
    } catch (e) {
      emit(
        NewPasswordState.error(
          message: e.toString(),
        ),
      );
    }
  }
}

@freezed
class NewPasswordState with _$NewPasswordState {
  const factory NewPasswordState.initial() = _InitialState;

  const factory NewPasswordState.loading() = _LoadingState;

  const factory NewPasswordState.loaded({
    BasicResponse? message,
  }) = _LoadedState;

  const factory NewPasswordState.error({
    required String message,
  }) = _ErrorState;
}
