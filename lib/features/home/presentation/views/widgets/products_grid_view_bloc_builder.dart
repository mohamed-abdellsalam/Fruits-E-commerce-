import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/cubits/products_cubit/products_cubit.dart';
import 'package:fruits_hub/core/helper/get_dummy_products.dart';
import 'package:fruits_hub/core/widgets/custom_error_widget.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/products_grid_view.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductsGridViewBlocBuilder extends StatelessWidget {
  const ProductsGridViewBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsScuess) {
          return ProductsGridView(
            products: state.products,
          );
        } else if (state is ProductsFailure) {
          return SliverToBoxAdapter(
            child: CustomErrorWidget(
              errorMessage: state.message,
            ),
          );
        } else {
          return Skeletonizer.sliver(
            enabled: true,
            child: ProductsGridView(
              products: getDummyProducts(),
            ),
          );
        }
      },
    );
  }
}
