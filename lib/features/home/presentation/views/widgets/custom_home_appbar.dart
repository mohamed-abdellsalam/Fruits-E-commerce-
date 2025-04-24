import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';

class CustomHomeAppbar extends StatelessWidget {
  const CustomHomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: Container(
        padding: const EdgeInsets.all(16),
        decoration: const ShapeDecoration(
          color: Color(0xffeef8ed),
          shape: OvalBorder(),
        ),
        child: SvgPicture.asset(Assets.imagesNotification),
      ),
      leading: Image.asset(Assets.imagesProfileImage),
      title: Text(
        'صباح الخير !..',
        style: TextStyles.regular16(context).copyWith(
          color: const Color(0xff949d9e),
        ),
      ),
      subtitle: Text(
        'أحمد مصطفي',
        style: TextStyles.bold16(context),
      ),
    );
  }
}
