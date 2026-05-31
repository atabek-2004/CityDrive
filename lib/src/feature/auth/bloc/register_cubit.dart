import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:city_drive/src/feature/auth/data/auth_repository.dart';
import 'package:city_drive/src/feature/auth/models/request/user_payload.dart';
import 'package:city_drive/src/feature/auth/models/user_dto.dart';

part 'register_cubit.freezed.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit({
    required IAuthRepository repository,
  })  : _repository = repository,
        super(const RegisterState.initial());
  final IAuthRepository _repository;

  Future<void> register({required UserPayload payload}) async {
    try {
      emit(const RegisterState.loading());

      final data = await _repository.registration(
        fullName: payload.fullName,
        birthDate: payload.birthDate,
        cityId: payload.cityId,
        phone: payload.phone,
        password: payload.password,
        passwordConfirmation: payload.passwordConfirmation,
      );

      if (isClosed) return;

      emit(RegisterState.loaded(user: data));
    } catch (e) {
      var message = e.toString();
      if (message.startsWith('Exception: ')) {
        message = message.replaceFirst('Exception: ', '');
      }
      emit(RegisterState.error(message: message));
    }
  }
}

@freezed
class RegisterState with _$RegisterState {
  const factory RegisterState.initial() = _InitialState;

  const factory RegisterState.loading() = _LoadingState;

  const factory RegisterState.loaded({required UserDTO user}) = _LoadedState;

  const factory RegisterState.error({required String message}) = _ErrorState;
}
