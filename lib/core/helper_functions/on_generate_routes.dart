import 'package:flutter/material.dart';
import 'package:fruits_hub/features/splash/presention/views/splash_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(
        builder: (context) => const SplashView(),
      );
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
