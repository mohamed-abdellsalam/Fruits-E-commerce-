import 'package:equatable/equatable.dart';
import 'package:fruits_hub/core/entities/product_entity.dart';

class CartItemEntitiy extends Equatable {
  final ProductEntity productEntity;
  int count;

  CartItemEntitiy({required this.productEntity, this.count = 0});
  num calculateTotalPrice() {
    return productEntity.price * count;
  }

  num calculateTotalWeight() {
    return productEntity.unitAmount * count;
  }

  increaseCount() {
    count++;
  }

  decreaseCount() {
    if (count > 0) {
      count--;
    }
  }

  @override
  // TODO: implement props
  List<Object?> get props => [productEntity];
}
