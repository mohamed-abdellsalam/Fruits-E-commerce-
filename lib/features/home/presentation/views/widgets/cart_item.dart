import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/core/widgets/custom_network_image.dart';
import 'package:fruits_hub/features/home/domain/entites/cart_item_entitiy.dart';
import 'package:fruits_hub/features/home/presentation/cubit/cart_cubit/cart_cubit.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/cart_item_action_buttons.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cartItemEntitiy});
  final CartItemEntitiy cartItemEntitiy;
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Container(
            width: 73,
            height: 92,
            decoration: const BoxDecoration(color: Color(0xFFF3F5F7)),
            child: CustomNetworkImage(
              imageUrl: cartItemEntitiy.productEntity.imageUrl!,
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
                      cartItemEntitiy.productEntity.name,
                      style: TextStyles.bold13(context).copyWith(
                        color: const Color(0xFF05161B),
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        context
                            .read<CartCubit>()
                            .deleteCarItem(cartItemEntitiy);
                      },
                      child: SvgPicture.asset(Assets.imagesTrash),
                    ),
                  ],
                ),
                Text(
                  '${cartItemEntitiy.calculateTotalWeight()} كم',
                  textAlign: TextAlign.right,
                  style: TextStyles.regular13(context).copyWith(
                    color: AppColors.secondryColor,
                  ),
                ),
                Row(
                  children: [
                    CartItemActionButtons(
                      cartItemEntitiy: cartItemEntitiy,
                    ),
                    const Spacer(),
                    Text(
                      '${cartItemEntitiy.calculateTotalPrice()} جنيه',
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
