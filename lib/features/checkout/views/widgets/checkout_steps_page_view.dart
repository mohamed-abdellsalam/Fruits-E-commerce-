import 'package:flutter/material.dart';
import 'package:fruits_hub/features/checkout/views/widgets/checkout_steps.dart';

class CheckoutStepsPageView extends StatelessWidget {
  const CheckoutStepsPageView({
    super.key,
    required this.pageController,
  });

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView.builder(
          controller: pageController,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: getsteps().length,
          itemBuilder: (context, index) {
            return const SizedBox();
          }),
    );
  }
}
