import 'package:fruits_hub/features/home/domain/entites/cart_item_entitiy.dart';

class CartEntity {
  final List<CartItemEntitiy> carItems;

  CartEntity({required this.carItems});

  addCartItem(CartItemEntitiy cartItemEntity) {
    carItems.add(cartItemEntity);
  }
}
