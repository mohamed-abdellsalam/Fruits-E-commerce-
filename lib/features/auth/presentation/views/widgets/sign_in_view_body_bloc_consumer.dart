import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/widgets/custom_modal_progress_hud.dart';
import 'package:fruits_hub/features/auth/presentation/cubits/signin_cubits/signin_cubit.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/signin_view_body.dart';

class SignInViewBodyBlocConsumer extends StatelessWidget {
  const SignInViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SigninCubit, SigninState>(
      listener: (context, state) {},
      builder: (context, state) {
        return CustomProgressHud(
          isLoading: state is SigninLoading ? true : false,
          child: const SignInViewBody(),
        );
      },
    );
  }
}
