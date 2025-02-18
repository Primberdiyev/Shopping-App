import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/features/auth/bloc/splash_bloc.dart';
import 'package:shopping_app/features/routes/app_routes.dart';
import 'package:shopping_app/features/splash/splash_page.dart';
import 'package:shopping_app/features/utils/app_colors.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashBloc()..appStarted(),
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.white,
        ),
        onGenerateRoute: onGenerateRoute,
        home: const SplashPage(),
      ),
    );
  }
}
