import 'package:flutter/material.dart';
import 'package:fruits_hub/core/widgets/build_app_barr.dart';
import 'package:fruits_hub/features/checkout/views/widgets/checkout_view_body.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});
  static const String routeName = 'checkout';
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
