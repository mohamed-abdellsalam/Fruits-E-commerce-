import 'package:flutter/material.dart';
import 'package:fruits_hub/core/widgets/order_summary_widget.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/shipinng_addres_widget.dart';

class PaymentSection extends StatelessWidget {
  const PaymentSection({super.key, required this.controller});
  final PageController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 24),
        const OrderSummaryWidget(),
        const SizedBox(height: 16),
        ShippingAddressWidget(
          controller: controller,
        ),
      ],
    );
  }
}
