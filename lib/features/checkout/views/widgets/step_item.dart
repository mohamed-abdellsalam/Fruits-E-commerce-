import 'package:flutter/material.dart';
import 'package:fruits_hub/features/checkout/views/widgets/active_step_item.dart';
import 'package:fruits_hub/features/checkout/views/widgets/in_active_step_item.dart';

class StepItem extends StatelessWidget {
  const StepItem(
      {super.key,
      required this.index,
      required this.text,
      required this.isActive});
  final String index, text;
  final bool isActive; // This should be set based on your logic
  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      firstChild: InActiveStepItem(index: index, text: text),
      secondChild: ActiveStepItem(text: text),
      crossFadeState:
          isActive ? CrossFadeState.showSecond : CrossFadeState.showFirst,
      duration: const Duration(milliseconds: 300),
    );
  }
}
