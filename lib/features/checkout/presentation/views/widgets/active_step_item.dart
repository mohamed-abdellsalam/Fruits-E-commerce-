import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';

class ActiveStepItem extends StatelessWidget {
  const ActiveStepItem({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CircleAvatar(
          radius: 11.5,
          backgroundColor: AppColors.primaryColor,
          child: Icon(
            size: 16,
            Icons.check,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          width: 4.0,
        ),
        Text(
          text,
          style: TextStyles.bold13(context).copyWith(
            color: AppColors.primaryColor,
          ),
        )
      ],
    );
  }
}
