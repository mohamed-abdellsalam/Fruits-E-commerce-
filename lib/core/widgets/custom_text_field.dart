import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';

class CustomFromTextField extends StatelessWidget {
  const CustomFromTextField({
    super.key,
    required this.hintText,
    this.suffixIcon,
    required this.keyboardType,
    this.onSaved,
    this.obscureText = false,
  });
  final String hintText;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final void Function(String?)? onSaved;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      onSaved: onSaved,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'هذا الحقل مطلوب';
        }
        return null;
      },
      keyboardType: keyboardType,
      decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xfff9fafa),
          suffixIcon: suffixIcon,
          hintText: hintText,
          hintStyle: TextStyles.bold13(context).copyWith(
            color: const Color(0xff949d9e),
          ),
          border: buildBorder(),
          focusedBorder: buildBorder(),
          enabledBorder: buildBorder()),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: const BorderSide(
        color: Color(0xffe6e9e9),
        width: 1,
      ),
    );
  }
}
