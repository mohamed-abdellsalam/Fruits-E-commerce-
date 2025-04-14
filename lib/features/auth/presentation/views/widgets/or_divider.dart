import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            color: Color(0xffdddfdf),
            thickness: 1,
          ),
        ),
        const SizedBox(
          width: 18,
        ),
        Text(
          textAlign: TextAlign.center,
          'أو',
          style: TextStyles.semiBold16(context),
        ),
        const SizedBox(
          width: 16,
        ),
        const Expanded(
          child: Divider(
            color: Color(0xffdddfdf),
            thickness: 1,
          ),
        ),
      ],
    );
  }
}
