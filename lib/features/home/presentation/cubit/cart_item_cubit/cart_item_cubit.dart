import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fruits_hub/features/home/domain/entites/cart_item_entitiy.dart';

part 'cart_item_state.dart';

class CartItemCubit extends Cubit<CartItemState> {
  CartItemCubit() : super(CartItemInitial());

  void updateCartItem(CartItemEntitiy cartItemEntitiy) {
    emit(CartItemUpdated(cartItemEntitiy));
  }
}
