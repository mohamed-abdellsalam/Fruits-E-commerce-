import 'package:flutter/material.dart';
import 'package:fruits_hub/features/checkout/views/widgets/shiping_item.dart';

class ShipingSection extends StatelessWidget {
  const ShipingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
          height: 33,
        ),
        ShipingItem(
          isSelected: true,
          title: 'الدفع عند الاستلام',
          subTitle: 'التسليم من المكان',
          price: '40',
        ),
        SizedBox(
          height: 16,
        ),
        ShipingItem(
          isSelected: false,
          title: 'الدفع اونلاين',
          subTitle: 'يرجي تحديد طريقة الدفع',
          price: '40',
        ),
      ],
    );
  }
}
