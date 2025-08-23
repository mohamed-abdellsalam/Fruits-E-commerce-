import 'package:fruits_hub/features/checkout/domain/entities/shipping_addres_entity.dart';
import 'package:fruits_hub/features/home/domain/entites/cart_entity.dart';

class OrderEntity {
  final CartEntity cartEntity;
  bool? payWithCash;
  ShippingAddresEntity shippingAddress;
  OrderEntity(
    this.cartEntity, {
    this.payWithCash,
    required this.shippingAddress,
  });
}
