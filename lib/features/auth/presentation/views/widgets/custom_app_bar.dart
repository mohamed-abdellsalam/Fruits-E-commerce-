import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/core/widgets/notifications_widget.dart';

AppBar buildAppBar(context,
    {required String title,
    required Function() onPressed,
    bool showBackButton = true}) {
  return AppBar(
    actions: const [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: NotificationWidget(),
      )
    ],
    backgroundColor: Colors.white,
    leading: Visibility(
      visible: showBackButton,
      child: IconButton(
        onPressed: onPressed,
        icon: const Icon(Icons.arrow_back_ios_new),
      ),
    ),
    centerTitle: true,
    title: Text(
      title,
      style: TextStyles.bold19(context),
    ),
  );
}
