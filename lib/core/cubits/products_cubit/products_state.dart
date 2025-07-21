part of 'products_cubit.dart';

@immutable
sealed class ProductsState {}

final class ProductsInitial extends ProductsState {}

final class ProductsLoading extends ProductsState {}

final class ProductsScuess extends ProductsState {
  final List<ProductEntity> products;

  ProductsScuess(this.products);
}

final class ProductsFailure extends ProductsState {
  final String message;

  ProductsFailure(this.message);
}
