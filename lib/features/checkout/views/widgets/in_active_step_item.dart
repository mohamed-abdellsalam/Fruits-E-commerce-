import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';

class InActiveStepItem extends StatelessWidget {
  const InActiveStepItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 10,
          backgroundColor: const Color(0xfff2f3f3),
          child: Text(
            '2',
            style: TextStyles.semiBold13(context),
          ),
        ),
        const SizedBox(
          width: 4.0,
        ),
        Text(
          'الشحن',
          style: TextStyles.semiBold13(context).copyWith(
            color: const Color(0xffaaaaaa),
          ),
        ),
      ],
    );
  }
}
