// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:ikidz/src/feature/auth/data/auth_repository.dart';
// import 'package:ikidz/src/feature/auth/models/request/user_payload.dart';
// import 'package:ikidz/src/feature/auth/models/response/sms_dto.dart';

// part 'code_cubit.freezed.dart';

// class CodeCubit extends Cubit<CodeState> {
//   CodeCubit({
//     required IAuthRepository repository,
//   })  : _repository = repository,
//         super(const CodeState.initial());
//   final IAuthRepository _repository;

//   Future<void> checkCode({required UserPayload payload}) async {
//     try {
//       emit(const CodeState.loading());

//       final result = await _repository.checkCode(payload: payload);

//       if (isClosed) return;

//       emit(CodeState.loaded(smsDTO: result));
//     } catch (e) {
//       emit(
//         CodeState.error(
//           message: e.toString(),
//         ),
//       );
//     }
//   }
// }

// @freezed
// class CodeState with _$CodeState {
//   const factory CodeState.initial() = _InitialState;

//   const factory CodeState.loading() = _LoadingState;

//   const factory CodeState.loaded({
//     required SmsDTO smsDTO,
//   }) = _LoadedState;

//   const factory CodeState.error({
//     required String message,
//   }) = _ErrorState;
// }
