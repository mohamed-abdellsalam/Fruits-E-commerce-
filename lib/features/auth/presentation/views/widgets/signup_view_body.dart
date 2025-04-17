import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/constants.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/core/widgets/custom_password_field.dart';
import 'package:fruits_hub/core/widgets/custom_text_field.dart';
import 'package:fruits_hub/features/auth/presentation/cubits/signin_cubits/signup_cubit.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/have_an_account_widget.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/terms_and_conditons_widget.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  late String email, password, name;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorzintalPadding),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            autovalidateMode: autoValidateMode,
            child: Column(
              children: [
                const SizedBox(
                  height: 24,
                ),
                CustomFromTextField(
                  onSaved: (value) {
                    name = value!;
                  },
                  hintText: 'الاسم كامل',
                  keyboardType: TextInputType.name,
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomFromTextField(
                  onSaved: (value) {
                    email = value!;
                  },
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
                const TermsAndConditionsWidget(),
                const SizedBox(
                  height: 30,
                ),
                CustomButton(
                  text: 'إنشاء حساب جديد',
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();

                      context
                          .read<SignupCubit>()
                          .createUserWithEmailAndPassword(
                              email: email, password: password, name: name);
                    } else {
                      setState(() {
                        autoValidateMode = AutovalidateMode.always;
                      });
                    }
                  },
                ),
                const SizedBox(
                  height: 26,
                ),
                const HaveAnAccountWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
