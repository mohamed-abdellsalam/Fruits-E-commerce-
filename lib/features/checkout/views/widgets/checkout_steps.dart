import 'package:flutter/material.dart';
import 'package:fruits_hub/features/checkout/views/widgets/active_step_item.dart';

class CheckoutSteps extends StatelessWidget {
  const CheckoutSteps({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(4, (index) {
        return const Expanded(
          child: ActiveStepItem(),
        );
      }),
    );
  }
}
