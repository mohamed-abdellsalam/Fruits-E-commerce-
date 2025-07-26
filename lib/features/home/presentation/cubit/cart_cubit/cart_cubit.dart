import 'package:bloc/bloc.dart';
import 'package:fruits_hub/core/entities/product_entity.dart';
import 'package:fruits_hub/features/home/domain/entites/cart_entity.dart';
import 'package:fruits_hub/features/home/domain/entites/cart_item_entitiy.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  CartEntity cartEntity = CartEntity(carItems: []);

  void addProduct(ProductEntity productEntity) {
    bool isProductExists = cartEntity.isExists(productEntity);
    if (isProductExists) {
    } else {
      CartItemEntitiy cartItemEntity = CartItemEntitiy(
        productEntity: productEntity,
        quantity: 1,
      );
      cartEntity.addCartItem(cartItemEntity);
    }

    emit(CartItemAdded());
  }
}
