import 'package:flutter/material.dart';
import 'package:fruits_hub/features/home/domain/entites/bottom_navigation_bar_entity.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/active_item.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/in_active_item.dart';

class NavigtionBarItem extends StatelessWidget {
  const NavigtionBarItem({
    super.key,
    required this.isActive,
    required this.bottomNavigationBarEntity,
  });
  final bool isActive;
  final BottomNavigationBarEntity bottomNavigationBarEntity;
  @override
  Widget build(BuildContext context) {
    return isActive
        ? ActiveItem(
            image: bottomNavigationBarEntity.activeImage,
            text: bottomNavigationBarEntity.name,
          )
        : InActiveItem(
            image: bottomNavigationBarEntity.inActiveImage,
          );
  }
}
