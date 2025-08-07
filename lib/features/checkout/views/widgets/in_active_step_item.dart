import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';

class InActiveStepItem extends StatelessWidget {
  const InActiveStepItem({super.key, required this.index, required this.text});
  final String index;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 10,
          backgroundColor: const Color(0xfff2f3f3),
          child: Text(
            index,
            style: TextStyles.semiBold13(context),
          ),
        ),
        const SizedBox(
          width: 4.0,
        ),
        Text(
          text,
          style: TextStyles.semiBold13(context).copyWith(
            color: const Color(0xffaaaaaa),
          ),
        ),
      ],
    );
  }
}
