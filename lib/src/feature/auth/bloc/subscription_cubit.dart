import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ikidz/src/core/rest_client/src/dio_rest_client/rest_client_dio.dart';
import 'package:ikidz/src/feature/auth/data/auth_repository.dart';
import 'package:ikidz/src/feature/auth/models/subscription_dto.dart';


part 'subscription_cubit.freezed.dart';

class SubscriptionCubit extends Cubit<SubscriptionState> {
  final IAuthRepository _repository;
  SubscriptionCubit({required IAuthRepository repository})
      : _repository = repository,
        super(const SubscriptionState.initial());


  Future<void> getSubscriptions({
    bool hasDelay = false,
    bool hasLoading = false,
  }) async {
    try {
      if (hasLoading) {
        emit(const SubscriptionState.loading());
      }

      if (hasDelay) {
        await Future.delayed(const Duration(milliseconds: 500));
      }

      final result = await _repository.getSubscriptions();

      emit(SubscriptionState.loaded(subsDTO: result));
    } on RestClientException catch (e) {
      emit(SubscriptionState.error(message: e.message));
    } catch (e) {
      emit(SubscriptionState.error(message: e.toString()));
    }
  }
}

@freezed
class SubscriptionState with _$SubscriptionState {
  const factory SubscriptionState.initial() = _InitialState;
  const factory SubscriptionState.loading() = _LoadingState;
  const factory SubscriptionState.loaded({
    required List<SubscriptionDTO> subsDTO,
  }) = _LoadedState;
  const factory SubscriptionState.error({
    required String message,
  }) = _ErrorState;
}
