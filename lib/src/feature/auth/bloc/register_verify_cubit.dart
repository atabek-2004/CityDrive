import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ikidz/src/core/rest_client/models/basic_response.dart';

import 'package:ikidz/src/feature/auth/data/auth_repository.dart';
import 'package:ikidz/src/feature/auth/models/request/user_payload.dart';

part 'register_verify_cubit.freezed.dart';

class RegisterVerifyCubit extends Cubit<RegisterVerifyState> {
  RegisterVerifyCubit({
    required IAuthRepository repository,
  })  : _repository = repository,
        super(const RegisterVerifyState.initial());
  final IAuthRepository _repository;

  Future<void> registerVerify({
    required String phone,
    required String code,
  }) async {
    try {
      emit(const RegisterVerifyState.loading());

      final result = await _repository.registerVerify(
        phone: phone,
        code: code,
      );

      if (isClosed) return;

      emit(RegisterVerifyState.loaded());
    } catch (e) {
      emit(
        RegisterVerifyState.error(
          message: e.toString(),
        ),
      );
    }
  }
}

@freezed
class RegisterVerifyState with _$RegisterVerifyState {
  const factory RegisterVerifyState.initial() = _InitialState;

  const factory RegisterVerifyState.loading() = _LoadingState;

  const factory RegisterVerifyState.loaded() = _LoadedState;

  const factory RegisterVerifyState.error({
    required String message,
  }) = _ErrorState;
}
