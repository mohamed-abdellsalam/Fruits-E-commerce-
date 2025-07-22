import 'package:bloc/bloc.dart';
import 'package:fruits_hub/core/entities/product_entity.dart';
import 'package:fruits_hub/core/repos/product_repo/products_repo.dart';
import 'package:meta/meta.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.productsRepo) : super(ProductsInitial());

  final ProductsRepo productsRepo;
  int proudctLenght = 0;
  Future<void> getProducts() async {
    emit(ProductsLoading());

    final result = await productsRepo.getProducts();
    result.fold(
      (failure) => emit(ProductsFailure(failure.message)),
      (products) => emit(ProductsScuess(products)),
    );
  }

  Future<void> getBsetSellingProducts() async {
    emit(ProductsLoading());

    final result = await productsRepo.getBestSellingProduct();
    result.fold(
      (failure) => emit(ProductsFailure(failure.message)),
      (products) {
        proudctLenght += products.length;
        emit(ProductsScuess(products));
      },
    );
  }
}
