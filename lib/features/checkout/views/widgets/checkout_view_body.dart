import 'package:flutter/material.dart';
import 'package:fruits_hub/features/checkout/views/widgets/checkout_steps.dart';

class CheckoutViewBody extends StatelessWidget {
  const CheckoutViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          CheckoutSteps(),
        ],
      ),
    );
  }
}
