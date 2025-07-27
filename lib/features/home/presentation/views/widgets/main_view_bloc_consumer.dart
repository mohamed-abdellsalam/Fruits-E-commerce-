import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/helper/build_error_bar.dart';
import 'package:fruits_hub/features/home/presentation/cubit/cart_cubit/cart_cubit.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/main_view_body.dart';

class MainViewBodyBLocConsumer extends StatelessWidget {
  const MainViewBodyBLocConsumer({
    super.key,
    required this.currentIndex,
    required this.pages,
  });

  final int currentIndex;
  final List<Widget> pages;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
      listener: (context, state) {
        if (state is CartProductAdded) {
          buildErrorBar(context, 'تمت العمليه بنجاح');
        }
      },
      child: MainViewBody(
        currentIndex: currentIndex,
        pages: pages,
      ),
    );
  }
}
