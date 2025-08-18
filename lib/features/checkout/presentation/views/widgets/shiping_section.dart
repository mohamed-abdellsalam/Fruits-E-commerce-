import 'package:flutter/material.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/shiping_item.dart';

class ShipingSection extends StatefulWidget {
  const ShipingSection({super.key});

  @override
  State<ShipingSection> createState() => _ShipingSectionState();
}

class _ShipingSectionState extends State<ShipingSection> {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 33,
        ),
        ShipingItem(
          onTap: () {
            setState(() {
              selectedIndex = 0;
            });
          },
          isSelected: selectedIndex == 0,
          title: 'الدفع عند الاستلام',
          subTitle: 'التسليم من المكان',
          price: '40',
        ),
        const SizedBox(
          height: 16,
        ),
        ShipingItem(
          onTap: () {
            setState(() {
              selectedIndex = 1;
            });
          },
          isSelected: selectedIndex == 1,
          title: 'الدفع اونلاين',
          subTitle: 'يرجي تحديد طريقة الدفع',
          price: '40',
        ),
      ],
    );
  }
}
