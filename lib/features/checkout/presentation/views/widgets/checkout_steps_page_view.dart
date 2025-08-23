import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub/core/widgets/payment_section.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/address_input_section.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/checkout_steps.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/shiping_section.dart';

class CheckoutStepsPageView extends StatelessWidget {
  const CheckoutStepsPageView({
    super.key,
    required this.pageController,
    required this.formKey,
    required this.valueListenable,
  });
  final ValueListenable<AutovalidateMode> valueListenable;
  final PageController pageController;
  final GlobalKey<FormState> formKey;
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
      AddressInputSection(
        valueListenable: valueListenable,
        formKey: formKey,
      ),
      PaymentSection(
        controller: pageController,
      ),
    ];
  }
}
