import 'package:dartz/dartz.dart';
import 'package:fruits_hub/core/errors/failures.dart';
import 'package:fruits_hub/core/repos/order_repo/order_repo.dart';
import 'package:fruits_hub/core/services/database_services.dart';
import 'package:fruits_hub/core/utils/backend_enpoint.dart';
import 'package:fruits_hub/features/checkout/data/models/order_model.dart';
import 'package:fruits_hub/features/checkout/domain/entities/order_entity.dart';

class OrderRepoImpl implements OrderRepo {
  final DatabaseService fireStoreServices;

  OrderRepoImpl({required this.fireStoreServices});
  @override
  Future<Either<Failure, void>> addOrder(
      {required OrderEntity orderEntity}) async {
    try {
      await fireStoreServices.addData(
          path: BackendEnpoint.addOrders,
          data: OrderModel.fromEntity(orderEntity).toJson());
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
