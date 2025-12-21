// import 'package:flutter/foundation.dart';
// import 'package:ikidz/src/core/rest_client/src/dio_rest_client/rest_client_dio.dart';
// import 'package:ikidz/src/core/utils/talker_logger_util.dart';
// import 'package:ikidz/src/feature/main/model/order_dto.dart';

// abstract interface class IOrdersRemoteDS {
//   Future<List<OrderDTO>> getOrders({
//     required String type,
//   });

  
//   Future<int> newsLikeOrUnlike({
//     required int newsId,
//   });

//   Future changeStatus({
//     required int id,
//     required int status,
//   });
// }

// class OrdersRemoteDSImpl implements IOrdersRemoteDS {
//   const OrdersRemoteDSImpl({
//     required this.restClient,
//   });
//   final IRestClient restClient;

//   @override
//   Future<List<OrderDTO>> getOrders({
//     required String type,
//   }) async {
//     try {
//       final Map<String, dynamic> response = await restClient.get(
//         '/partner/orders',
//         queryParams: {
//           'type': type,
//         },
//       );

//       if (response['data'] == null) {
//         throw Exception();
//       }
//       final list = await compute<List<dynamic>, List<OrderDTO>>(
//         (list) => list
//             .map(
//               (e) => OrderDTO.fromJson(e as Map<String, dynamic>),
//             )
//             .toList(),
//         response['data'] as List,
//       );
//       return list;
//     } catch (e, st) {
//       TalkerLoggerUtil.talker.error('#getNews - $e', e, st);
//       rethrow;
//     }
//   }

  

//   @override
//   Future<int> newsLikeOrUnlike({
//     required int newsId,
//   }) async {
//     try {
//       final Map<String, dynamic> response = await restClient.post(
//         '/v1/news/$newsId/like',
//         body: null,
//       );

//       if (response.containsKey('like') && response['like'] is int) {
//         return response['like'] as int;
//       } else {
//         throw WrongResponseTypeException(
//           message: '''Unexpected response body type: ${response.runtimeType}\n$response''',
//         );
//       }
//     } catch (e, st) {
//       TalkerLoggerUtil.talker.error('#newsLikeOrUnlike - $e', e, st);
//       rethrow;
//     }
//   }

//   @override
//   Future changeStatus({
//     required int id,
//     required int status,
//   }) async {
//     try {
//       await restClient.post(
//         '/partner/orders/change_status/$id',
//         body: {
//           'status': status,
//         },
//       );
//     } catch (e, st) {
//       TalkerLoggerUtil.talker.error('#updateProfile - $e', e, st);
//       rethrow;
//     }
//   }
// }
