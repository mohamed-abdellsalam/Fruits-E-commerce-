import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 9,
            offset: Offset(0, 2),
            spreadRadius: 0,
          ),
        ],
      ),
      child: TextField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            prefixIcon: SizedBox(
              width: 20,
              child: Center(
                child: SvgPicture.asset(Assets.imagesSearchIcon),
              ),
            ),
            filled: true,
            fillColor: Colors.white,
            suffixIcon: SizedBox(
              width: 20,
              child: Center(
                child: SvgPicture.asset(
                  Assets.imagesFilter,
                ),
              ),
            ),
            hintText: 'ابحث عن.......',
            hintStyle: TextStyles.regular13(context).copyWith(
              color: const Color(0xff949d9e),
            ),
            border: buildBorder(),
            focusedBorder: buildBorder(),
            enabledBorder: buildBorder()),
      ),
    );
  }

  buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: const BorderSide(
        color: Colors.white,
        width: 1,
      ),
    );
  }
}
