import 'package:flutter/material.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/step_item.dart';

class CheckoutSteps extends StatelessWidget {
  const CheckoutSteps({super.key, required this.currentPageIndex});
  final int currentPageIndex;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(getsteps().length, (index) {
        return Expanded(
          child: StepItem(
            index: (index + 1).toString(),
            text: getsteps()[index],
            isActive: index <= currentPageIndex,
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
  ];
}
