import 'package:flutter/material.dart';
import 'package:fruits_hub/features/checkout/views/widgets/checkout_steps.dart';
import 'package:fruits_hub/features/checkout/views/widgets/shiping_section.dart';

class CheckoutStepsPageView extends StatelessWidget {
  const CheckoutStepsPageView({
    super.key,
    required this.pageController,
  });

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: PageView.builder(
            controller: pageController,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: getsteps().length,
            itemBuilder: (context, index) {
              return getPages()[index];
            }),
      ),
    );
  }

  List<Widget> getPages() {
    return [
      const ShipingSection(),
      const SizedBox(),
      const SizedBox(),
      const SizedBox(),
    ];
  }
}
