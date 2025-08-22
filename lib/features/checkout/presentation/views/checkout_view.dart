import 'package:flutter/material.dart';
import 'package:fruits_hub/core/widgets/build_app_barr.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/checkout_view_body.dart';
import 'package:fruits_hub/features/home/domain/entites/cart_item_entitiy.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key, required this.carItems});
  static const String routeName = 'checkout';
  final List<CartItemEntitiy> carItems;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context,
        title: 'الشحن',
        showNotification: false,
      ),
      body: const CheckoutViewBody(),
    );
  }
}
