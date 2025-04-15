import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton(
      {super.key,
      required this.icon,
      required this.title,
      required this.onPressed});
  final String icon;
  final String title;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        height: 56,
        child: TextButton(
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              side: const BorderSide(
                width: 1,
                color: Color(0xFFDCDEDE),
              ),
            ),
            onPressed: onPressed,
            child: ListTile(
              visualDensity: const VisualDensity(
                vertical: VisualDensity.minimumDensity,
              ),
              leading: SvgPicture.asset(icon),
              title: Text(
                textAlign: TextAlign.center,
                title,
                style: TextStyles.semiBold16(context),
              ),
            )),
      ),
    );
  }
}
