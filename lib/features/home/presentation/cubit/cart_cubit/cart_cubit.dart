import 'package:bloc/bloc.dart';
import 'package:fruits_hub/core/entities/product_entity.dart';
import 'package:fruits_hub/features/home/domain/entites/cart_entity.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  CartEntity cartEntity = CartEntity(carItems: []);

  void addProduct(ProductEntity productEntity) {
    bool isProductExists = cartEntity.isExists(productEntity);
    var carItem = cartEntity.getCartItem(productEntity);
    if (isProductExists) {
      carItem.increaseCount();
    } else {
      cartEntity.addCartItem(carItem);
    }

    emit(CartItemAdded());
  }
}
