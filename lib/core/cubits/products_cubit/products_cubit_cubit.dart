import 'package:bloc/bloc.dart';
import 'package:fruits_hub/core/entities/product_entity.dart';
import 'package:fruits_hub/core/repos/product_repo/products_repo.dart';
import 'package:meta/meta.dart';

part 'products_cubit_state.dart';

class ProductsCubitCubit extends Cubit<ProductsCubitState> {
  ProductsCubitCubit(this.productsRepo) : super(ProductsCubitInitial());

  final ProductsRepo productsRepo;

  Future<void> getProducts() async {
    emit(ProductsCubitLoading());

    final result = await productsRepo.getProducts();
    result.fold(
      (failure) => emit(ProductsCubitFailure(failure.message)),
      (products) => emit(ProductsCubitScuess(products)),
    );
  }

  Future<void> getBsetSellingProducts() async {
    emit(ProductsCubitLoading());

    final result = await productsRepo.getBestSellingProduct();
    result.fold(
      (failure) => emit(ProductsCubitFailure(failure.message)),
      (products) => emit(ProductsCubitScuess(products)),
    );
  }
}
