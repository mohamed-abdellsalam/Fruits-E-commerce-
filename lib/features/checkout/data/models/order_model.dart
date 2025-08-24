import 'package:fruits_hub/features/checkout/data/models/order_product_model.dart';
import 'package:fruits_hub/features/checkout/data/models/shipping_adders_model.dart';
import 'package:fruits_hub/features/checkout/domain/entities/order_entity.dart';

class OrderModel {
  final double totalPrice;
  final String uId;
  final ShippingAddressModel shippingAddressModel;
  final List<OrderProductModel> orderProductsModel;
  final String paymentMethod;

  OrderModel(
      {required this.totalPrice,
      required this.uId,
      required this.shippingAddressModel,
      required this.orderProductsModel,
      required this.paymentMethod});

  factory OrderModel.fromEntity(OrderEntity orderEntity) {
    return OrderModel(
      totalPrice: orderEntity.cartEntity.calculateTotalPrice(),
      uId: orderEntity.uID,
      shippingAddressModel:
          ShippingAddressModel.fromEntity(orderEntity.shippingAddress),
      orderProductsModel: orderEntity.cartEntity.carItems
          .map(
            (e) => OrderProductModel.fromEntity(e),
          )
          .toList(),
      paymentMethod: orderEntity.payWithCash! ? 'Cash' : 'PayPal',
    );
  }

  toJson() {
    return {
      'totalPrice': totalPrice,
      'uId': uId,
      'shippingAddress': shippingAddressModel.toJson(),
      'orderProducts': orderProductsModel
          .map((orderProduct) => orderProduct.toJson())
          .toList(),
      'paymentMethod': paymentMethod,
    };
  }
}
