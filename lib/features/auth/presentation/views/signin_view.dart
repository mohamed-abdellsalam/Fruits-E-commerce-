import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/services/get_it_service.dart';
import 'package:fruits_hub/features/auth/domain/repos/auth_repo.dart';
import 'package:fruits_hub/features/auth/presentation/cubits/signin_cubits/signin_cubit.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/custom_app_bar.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/sign_in_view_body_bloc_consumer.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});
  static const routeName = 'login';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: 'تسجيل دخول'),
      body: BlocProvider(
        create: (context) => SigninCubit(
          getIt.get<AuthRepo>(),
        ),
        child: const SignInViewBodyBlocConsumer(),
      ),
    );
  }
}
