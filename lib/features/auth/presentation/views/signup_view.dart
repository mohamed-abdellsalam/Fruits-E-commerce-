import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/services/get_it_service.dart';
import 'package:fruits_hub/features/auth/domain/repos/auth_repo.dart';
import 'package:fruits_hub/features/auth/presentation/cubits/signup_cubits/signup_cubit.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/custom_app_bar.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/sign_up_view_body_bloc_consumer.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});
  static const routeName = 'signup';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(
        getIt<
            AuthRepo>(), // Assuming you have a method to get the AuthRepo instance
      ),
      child: Scaffold(
        appBar: buildAppBar(
          context,
          title: 'حساب جديد',
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        body: const SignUPViewBodyBlocConsumer(),
      ),
    );
  }
}
