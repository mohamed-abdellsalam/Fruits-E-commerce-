import 'package:fruits_hub/features/checkout/domain/entities/shipping_addres_entity.dart';
import 'package:fruits_hub/features/home/domain/entites/cart_item_entitiy.dart';

class OrderEntity {
  final List<CartItemEntitiy> cartItems;
  final bool payWithCash;
  final ShippingAddresEntity shippingAddress;
  OrderEntity({
    required this.payWithCash,
    required this.cartItems,
    required this.shippingAddress,
  });
}
