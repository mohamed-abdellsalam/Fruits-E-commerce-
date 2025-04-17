import 'package:flutter/material.dart';
import 'package:fruits_hub/constants.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/core/widgets/custom_password_field.dart';
import 'package:fruits_hub/core/widgets/custom_text_field.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/dont_have_an_account.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/or_divider.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/social_login_button.dart';

class SignInViewBody extends StatefulWidget {
  const SignInViewBody({super.key});

  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
}

class _SignInViewBodyState extends State<SignInViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  late String password;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        autovalidateMode: autoValidateMode,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kHorzintalPadding),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 24,
                ),
                const CustomFromTextField(
                  hintText: 'البريد الإلكتروني',
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 16,
                ),
                PasswordField(
                  onSaved: (value) {
                    password = value!;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'نسيت كلمة المرور؟',
                      style: TextStyles.semiBold13(context).copyWith(
                        color: AppColors.lightPrimaryColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 33,
                ),
                CustomButton(
                  onPressed: () {},
                  text: 'تسجيل دخول',
                ),
                const SizedBox(
                  height: 33,
                ),
                const DontHaveAnAccountWidget(),
                const SizedBox(
                  height: 33,
                ),
                const OrDivider(),
                const SizedBox(
                  height: 16,
                ),
                SocialLoginButton(
                  onPressed: () {},
                  icon: Assets.imagesGoogleIcon,
                  title: 'تسجيل بواسطة جوجل',
                ),
                const SizedBox(
                  height: 16,
                ),
                SocialLoginButton(
                  onPressed: () {},
                  icon: Assets.imagesApplIcon,
                  title: 'تسجيل بواسطة أبل',
                ),
                const SizedBox(
                  height: 16,
                ),
                SocialLoginButton(
                  onPressed: () {},
                  icon: Assets.imagesFacebookIcon,
                  title: 'تسجيل بواسطة فيسبوك',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
