import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';

class ProductViewHeader extends StatelessWidget {
  const ProductViewHeader({super.key, required this.proudctLenght});
  final int proudctLenght;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          ' $proudctLenght نتائج',
          textAlign: TextAlign.right,
          style: TextStyles.bold16(context),
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: ShapeDecoration(
            color: Colors.white.withOpacity(0.10000000149011612),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
              side: const BorderSide(
                width: 1,
                color: Color(0x66cacece),
              ),
            ),
          ),
          child: SvgPicture.asset(
            Assets.imagesFilter2,
          ),
        )
      ],
    );
  }
}
