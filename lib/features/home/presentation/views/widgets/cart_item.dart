import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/core/widgets/custom_network_image.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/cart_item_action_buttons.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Container(
            width: 73,
            height: 92,
            decoration: const BoxDecoration(color: Color(0xFFF3F5F7)),
            child: const CustomNetworkImage(
              imageUrl:
                  'https://cdn.mos.cms.futurecdn.net/v2/t:0,l:200,cw:1200,ch:1200,q:80,w:1200/XenViG9cC4EdGupeibtKa5.jpg',
            ),
          ),
          const SizedBox(width: 17),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      'بطيخ',
                      style: TextStyles.bold13(context).copyWith(
                        color: const Color(0xFF05161B),
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {},
                      child: SvgPicture.asset(Assets.imagesTrash),
                    ),
                  ],
                ),
                Text(
                  '3 كم',
                  textAlign: TextAlign.right,
                  style: TextStyles.regular13(context).copyWith(
                    color: AppColors.secondryColor,
                  ),
                ),
                Row(
                  children: [
                    const CartItemActionButtons(),
                    const Spacer(),
                    Text(
                      '60 جنيه',
                      style: TextStyles.bold16(context).copyWith(
                        color: AppColors.secondryColor,
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
