import 'package:flutter/material.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/checkout_steps.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/checkout_steps_page_view.dart';

class CheckoutViewBody extends StatefulWidget {
  const CheckoutViewBody({super.key});

  @override
  State<CheckoutViewBody> createState() => _CheckoutViewBodyState();
}

class _CheckoutViewBodyState extends State<CheckoutViewBody> {
  late PageController pageController;
  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        currentPageIndex = pageController.page!.round();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          const SizedBox(height: 20.0),
          CheckoutSteps(
            currentPageIndex: currentPageIndex,
          ),
          CheckoutStepsPageView(pageController: pageController),
          CustomButton(
            onPressed: () {
              pageController.animateToPage(
                2,
                duration: const Duration(microseconds: 300),
                curve: Curves.easeInOut,
              );
            },
            text: 'التالي',
          ),
          const SizedBox(
            height: 32,
          )
        ],
      ),
    );
  }
}
