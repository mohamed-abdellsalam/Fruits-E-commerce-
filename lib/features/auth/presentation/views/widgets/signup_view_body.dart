import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub/constants.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/core/widgets/custom_text_field.dart';
import 'package:fruits_hub/features/auth/presentation/views/login_view.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/terms_and_conditons_widget.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorzintalPadding),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 24,
            ),
            const CustomFromTextField(
              hintText: 'الاسم كامل',
              keyboardType: TextInputType.name,
            ),
            const SizedBox(
              height: 16,
            ),
            const CustomFromTextField(
              hintText: 'البريد الإلكتروني',
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(
              height: 16,
            ),
            const CustomFromTextField(
              suffixIcon: Padding(
                padding: EdgeInsets.symmetric(horizontal: 31),
                child: Icon(
                  Icons.remove_red_eye_outlined,
                  color: Color(0xffc9cecf),
                ),
              ),
              hintText: 'كلمة المرور',
              keyboardType: TextInputType.visiblePassword,
            ),
            const SizedBox(
              height: 16,
            ),
            const TermsAndConditionsWidget(),
            const SizedBox(
              height: 30,
            ),
            CustomButton(
              text: 'إنشاء حساب',
              onPressed: () {},
            ),
            const SizedBox(
              height: 26,
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'تمتلك حساب بالفعل؟',
                    style: TextStyles.semiBold16(context).copyWith(
                      color: const Color(0xFF949D9E),
                    ),
                  ),
                  TextSpan(
                    text: ' ',
                    style: TextStyles.semiBold16(context),
                  ),
                  TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.pushNamed(context, LoginView.routeName);
                      },
                    text: 'تسجيل دخول',
                    style: TextStyles.semiBold16(context).copyWith(
                      color: const Color(0xFF1B5E37),
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.right,
            )
          ],
        ),
      ),
    );
  }
}
