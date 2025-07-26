import 'package:fruits_hub/core/entities/product_entity.dart';
import 'package:fruits_hub/features/home/domain/entites/cart_item_entitiy.dart';

class CartEntity {
  final List<CartItemEntitiy> carItems;

  CartEntity({required this.carItems});

  addCartItem(CartItemEntitiy cartItemEntity) {
    carItems.add(cartItemEntity);
  }

  bool isExists(ProductEntity product) {
    for (var carItems in carItems) {
      if (carItems.productEntity == product) {
        return true;
      }
    }
    return false;
  }

  CartItemEntitiy getCartItem(ProductEntity product) {
    for (var carItems in carItems) {
      if (carItems.productEntity == product) {
        return carItems;
      }
    }
    return CartItemEntitiy(
      productEntity: product,
      count: 1,
    );
  }
}
