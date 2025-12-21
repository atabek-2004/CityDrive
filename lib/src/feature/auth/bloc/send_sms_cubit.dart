import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ikidz/src/feature/auth/data/auth_repository.dart';
import 'package:ikidz/src/feature/auth/models/request/user_payload.dart';
import 'package:ikidz/src/feature/auth/models/sms_dto.dart';

part 'send_sms_cubit.freezed.dart';

class SendSmsCubit extends Cubit<SendSmsState> {
  SendSmsCubit({
    required IAuthRepository repository,
  })  : _repository = repository,
        super(const SendSmsState.initial());
  final IAuthRepository _repository;

  Future<void> forgotPasswordSmsSend(
      {required UserPayload? payload, required String phone}) async {
    try {
      emit(const SendSmsState.loading());

      final result = await _repository.forgotPasswordSmsSend(
        phone: phone,
      );

      if (isClosed) return;

      emit(SendSmsState.loaded(smsDTO: result));
    } catch (e) {
      emit(
        SendSmsState.error(
          message: e.toString(),
        ),
      );
    }
  }

  
}

@freezed
class SendSmsState with _$SendSmsState {
  const factory SendSmsState.initial() = _InitialState;

  const factory SendSmsState.loading() = _LoadingState;

  const factory SendSmsState.loaded({SmsDTO? smsDTO}) = _LoadedState;

  const factory SendSmsState.error({required String message}) = _ErrorState;
}
