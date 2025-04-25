import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg;
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/featured_item_button.dart';

class FeaturedItem extends StatelessWidget {
  const FeaturedItem({super.key});

  @override
  Widget build(BuildContext context) {
    var itemWidth = MediaQuery.sizeOf(context).width;
    return SizedBox(
      width: itemWidth,
      child: AspectRatio(
        aspectRatio: 342 / 158,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              bottom: 0,
              top: 0,
              right: itemWidth * 0.4,
              child: SvgPicture.asset(
                Assets.imagesPageViewItem2Image,
                fit: BoxFit.fill,
              ),
            ),
            Container(
              width: itemWidth * 0.5,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: svg.Svg(Assets.imagesFeaturedItemBackground),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(right: 33),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 25,
                    ),
                    Text(
                      'عروض العيد',
                      style: TextStyles.regular13(context).copyWith(
                        color: Colors.white,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      'خصم 25%',
                      style: TextStyles.bold19(context).copyWith(
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 11,
                    ),
                    FeaturedItemButton(onPressed: () {}),
                    const SizedBox(
                      height: 29,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
