import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/features/splash/bloc/splash_bloc.dart';
import 'package:shopping_app/features/routes/name_routes.dart';
import 'package:shopping_app/features/utils/app_colors.dart';
import 'package:shopping_app/features/utils/app_images.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc, SplashState>(
      listener: (context, state) {
        if (state is UnRegistered) {
          Navigator.pushReplacementNamed(context, NameRoutes.signIn);
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.splashColor,
        body: Center(
          child: Image.asset(
            AppImages.clot,
            width: 170,
            height: 80,
          ),
        ),
      ),
    );
  }
}
