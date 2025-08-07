import 'package:flutter/material.dart';
import 'package:fruits_hub/features/checkout/views/widgets/step_item.dart';

class CheckoutSteps extends StatelessWidget {
  const CheckoutSteps({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(getsteps().length, (index) {
        return Expanded(
          child: StepItem(
            index: index.toString(),
            text: getsteps()[index],
            isActive: false,
          ),
        );
      }),
    );
  }
}

List<String> getsteps() {
  return [
    'الشحن',
    'العنوان',
    'الدفع',
    'المراجعه',
  ];
}
