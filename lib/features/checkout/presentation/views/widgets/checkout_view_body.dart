import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/helper/show_error_bar.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/features/checkout/domain/entities/order_entity.dart';
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
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          const SizedBox(height: 20.0),
          CheckoutSteps(
            pageController: pageController,
            currentPageIndex: currentPageIndex,
          ),
          CheckoutStepsPageView(
            pageController: pageController,
            formKey: formKey,
          ),
          CustomButton(
            onPressed: () {
              if (context.read<OrderEntity>().payWithCash != null) {
                pageController.animateToPage(
                  currentPageIndex + 1,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              } else {
                showErrorBar(context, 'يرجى اختيار طريقة الدفع');
              }
            },
            text: getNextButtonText(currentPageIndex),
          ),
          const SizedBox(
            height: 32,
          )
        ],
      ),
    );
  }

  String getNextButtonText(int currentPageIndex) {
    switch (currentPageIndex) {
      case 0:
        return 'التالي';
      case 1:
        return 'التالي';
      case 2:
        return 'الدفع بواسطه باي بال';
      default:
        return 'التالي';
    }
  }
}
