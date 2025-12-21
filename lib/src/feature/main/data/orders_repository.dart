// import 'package:ikidz/src/feature/main/data/orders_remote_ds.dart';
// import 'package:ikidz/src/feature/main/model/order_dto.dart';

// abstract interface class IOrdersRepository {
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

// class OrdersRepositoryImpl implements IOrdersRepository {
//   const OrdersRepositoryImpl({
//     required IOrdersRemoteDS remoteDS,
//   }) : _remoteDS = remoteDS;
//   final IOrdersRemoteDS _remoteDS;

//   @override
//   Future<List<OrderDTO>> getOrders({
//     required String type,
//   }) async {
//     try {
//       return await _remoteDS.getOrders(type: type);
//     } catch (e) {
//       rethrow;
//     }
//   }

//   @override
//   Future<int> newsLikeOrUnlike({
//     required int newsId,
//   }) async {
//     try {
//       return _remoteDS.newsLikeOrUnlike(newsId: newsId);
//     } catch (e) {
//       rethrow;
//     }
//   }

//   @override
//   Future changeStatus({
//     required int id,
//     required int status,
//   }) async {
//     try {
//       return await _remoteDS.changeStatus(id: id, status: status);
//     } catch (e) {
//       rethrow;
//     }
//   }
// }
