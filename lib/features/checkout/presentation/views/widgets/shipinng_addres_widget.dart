import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/features/checkout/domain/entities/order_entity.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/payment_item.dart';

class ShippingAddressWidget extends StatelessWidget {
  const ShippingAddressWidget({
    required this.controller,
    super.key,
  });
  final PageController controller;
  @override
  Widget build(BuildContext context) {
    log(context.read<OrderEntity>().toString());
    return PaymentItem(
      title: 'عنوان التوصيل',
      child: Row(
        children: [
          SvgPicture.asset(
            Assets.imagesLocation,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            '${context.read<OrderEntity>().shippingAddress}',
            textAlign: TextAlign.right,
            style: TextStyles.regular13(context).copyWith(
              color: const Color(0xFF4E5556),
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              controller.animateToPage(
                controller.page!.toInt() - 1,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
            child: SizedBox(
              child: Row(
                children: [
                  SvgPicture.asset(
                    Assets.imagesEdit,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    'تعديل',
                    style: TextStyles.semiBold13(context).copyWith(
                      color: const Color(0xFF949D9E),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
