import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/features/checkout/views/checkout_view.dart';
import 'package:fruits_hub/features/home/presentation/cubit/cart_cubit/cart_cubit.dart';
import 'package:fruits_hub/features/home/presentation/cubit/cart_item_cubit/cart_item_cubit.dart';

class CustomCartButton extends StatelessWidget {
  const CustomCartButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartItemState>(
      builder: (context, state) {
        return CustomButton(
          onPressed: () {
            Navigator.pushNamed(context, CheckoutView.routeName);
          },
          text:
              'الدفع  ${context.watch<CartCubit>().cartEntity.calculateTotalPrice().toDouble()} جنيه',
        );
      },
    );
  }
}
