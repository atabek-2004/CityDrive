// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:ikidz/src/core/rest_client/rest_client.dart';
// import 'package:ikidz/src/feature/main/data/orders_repository.dart';

// part 'change_order_status_cubit.freezed.dart';

// class ChangeOrderStatusCubit extends Cubit<ChangeOrderStatusState> {
//   ChangeOrderStatusCubit({
//     required IOrdersRepository repository,
//   })  : _repository = repository,
//         super(const ChangeOrderStatusState.initial());
//   final IOrdersRepository _repository;

//   Future<void> changeStatus({
//     required int id,
//     required int status,
//   }) async {
//     try {
//       emit(const ChangeOrderStatusState.loading());
//       await _repository.changeStatus(
//         id: id,
//         status: status,
//       );

//       if (isClosed) return;

//       emit(
//         const ChangeOrderStatusState.loaded(
//           message: 'success',
//         ),
//       );
//     } on RestClientException catch (e) {
//       emit(
//         ChangeOrderStatusState.error(
//           message: e.message,
//         ),
//       );
//     } catch (e) {
//       emit(
//         ChangeOrderStatusState.error(
//           message: e.toString(),
//         ),
//       );
//     }
//   }
// }

// @freezed
// class ChangeOrderStatusState with _$ChangeOrderStatusState {
//   const factory ChangeOrderStatusState.initial() = _InitialState;

//   const factory ChangeOrderStatusState.loading() = _LoadingState;

//   const factory ChangeOrderStatusState.loaded({
//     required String message,
//   }) = _LoadedState;

//   const factory ChangeOrderStatusState.error({
//     required String message,
//   }) = _ErrorState;
// }
