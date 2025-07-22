import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/constants.dart';
import 'package:fruits_hub/core/cubits/products_cubit/products_cubit.dart';
import 'package:fruits_hub/core/widgets/custom_search_text_field.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/custom_home_appbar.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/products_grid_view_bloc_builder.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/products_view_header.dart';

class ProductsViewBody extends StatefulWidget {
  const ProductsViewBody({super.key});

  @override
  State<ProductsViewBody> createState() => _ProductsViewBodyState();
}

class _ProductsViewBodyState extends State<ProductsViewBody> {
  @override
  void initState() {
    context.read<ProductsCubit>().getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                const SizedBox(
                  height: kTopPadding,
                ),
                const CustomHomeAppbar(),
                const SizedBox(
                  height: 16,
                ),
                const CustomSearchTextField(),
                const SizedBox(
                  height: 12,
                ),
                ProductViewHeader(
                  proudctLenght: context.read<ProductsCubit>().proudctLenght,
                ),
                const SizedBox(
                  height: 8,
                ),
              ],
            ),
          ),
          const ProductsGridViewBlocBuilder(),
        ],
      ),
    );
  }
}
