part of 'products_cubit_cubit.dart';

@immutable
sealed class ProductsCubitState {}

final class ProductsCubitInitial extends ProductsCubitState {}

final class ProductsCubitLoading extends ProductsCubitState {}

final class ProductsCubitScuess extends ProductsCubitState {
  final List<ProductEntity> products;

  ProductsCubitScuess(this.products);
}

final class ProductsCubitFailure extends ProductsCubitState {
  final String message;

  ProductsCubitFailure(this.message);
}
