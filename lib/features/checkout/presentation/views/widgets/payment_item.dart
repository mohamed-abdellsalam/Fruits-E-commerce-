import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_decoration.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';

class PaymentItem extends StatelessWidget {
  const PaymentItem({super.key, required this.title, required this.child});
  final String title;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          ' $title :',
          style: TextStyles.bold13(context),
        ),
        const SizedBox(height: 8.0),
        Container(
          decoration: AppDecoration.greyBoxDecrtion,
          child: child,
        )
      ],
    );
  }
}
