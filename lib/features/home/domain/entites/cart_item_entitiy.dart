import 'package:equatable/equatable.dart';
import 'package:fruits_hub/core/entities/product_entity.dart';

class CartItemEntitiy extends Equatable {
  final ProductEntity productEntity;
  int quantity;

  CartItemEntitiy({required this.productEntity, this.quantity = 0});
  num calculateTotalPrice() {
    return productEntity.price * quantity;
  }

  num calculateTotalWeight() {
    return productEntity.unitAmount * quantity;
  }

  increaseQuantity() {
    quantity++;
  }

  decreaseQuantity() {
    if (quantity > 0) {
      quantity--;
    }
  }

  @override
  // TODO: implement props
  List<Object?> get props => [productEntity];
}
