import 'package:flutter/material.dart';
import 'package:fruits_hub/core/widgets/custom_text_field.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({
    super.key,
    this.onSaved,
  });
  final void Function(String?)? onSaved;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return CustomFromTextField(
      obscureText: isObscure,
      onSaved: widget.onSaved,
      suffixIcon: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 31),
        child: GestureDetector(
          onTap: () {
            isObscure = !isObscure;
            setState(() {});
          },
          child: isObscure
              ? const Icon(
                  Icons.remove_red_eye_outlined,
                  color: Color(0xffc9cecf),
                )
              : const Icon(
                  Icons.visibility_off_outlined,
                  color: Color(0xffc9cecf),
                ),
        ),
      ),
      hintText: 'كلمة المرور',
      keyboardType: TextInputType.visiblePassword,
    );
  }
}
