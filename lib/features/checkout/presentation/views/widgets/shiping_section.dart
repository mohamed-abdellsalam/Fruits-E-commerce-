import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/features/checkout/domain/entities/order_entity.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/shiping_item.dart';

class ShipingSection extends StatefulWidget {
  const ShipingSection({super.key});

  @override
  State<ShipingSection> createState() => _ShipingSectionState();
}

class _ShipingSectionState extends State<ShipingSection>
    with AutomaticKeepAliveClientMixin {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    var orderEntity = context.read<OrderEntity>();
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
            orderEntity.payWithCash = true;
          },
          isSelected: selectedIndex == 0,
          title: 'الدفع عند الاستلام',
          subTitle: 'التسليم من المكان',
          price: (context.read<OrderEntity>().cartEntity.calculateTotalPrice() +
                  30)
              .toString(),
        ),
        const SizedBox(
          height: 16,
        ),
        ShipingItem(
          onTap: () {
            setState(() {
              selectedIndex = 1;
            });
            orderEntity.payWithCash = false;
          },
          isSelected: selectedIndex == 1,
          title: 'الدفع اونلاين',
          subTitle: 'يرجي تحديد طريقة الدفع',
          price: context
              .read<OrderEntity>()
              .cartEntity
              .calculateTotalPrice()
              .toString(),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
