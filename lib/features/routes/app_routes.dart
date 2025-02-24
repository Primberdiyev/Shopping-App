import 'package:flutter/material.dart';
import 'package:shopping_app/features/auth/pages/forgot_password_page.dart';
import 'package:shopping_app/features/auth/pages/sign_in_password.dart';
import 'package:shopping_app/features/auth/pages/sign_in_page.dart';
import 'package:shopping_app/features/auth/pages/sign_up_page.dart';
import 'package:shopping_app/features/home/pages/home_page.dart';
import 'package:shopping_app/features/routes/name_routes.dart';
import 'package:shopping_app/features/splash/splash_page.dart';

Route onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case NameRoutes.splash:
      return MaterialPageRoute(
        builder: (_) => const SplashPage(),
      );
    case NameRoutes.signIn:
      return MaterialPageRoute(
        builder: (_) => const SignInPage(),
      );
    case NameRoutes.signInPassword:
      final email = settings.arguments as String;
      return MaterialPageRoute(
        builder: (_) => SignInPassword(
          email: email,
        ),
      );
    case NameRoutes.signUp:
      return MaterialPageRoute(
        builder: (_) => const SignUpPage(),
      );
    case NameRoutes.forgotPassword:
      return MaterialPageRoute(
        builder: (_) => const ForgotPasswordPage(),
      );
    case NameRoutes.home:
      return MaterialPageRoute(
        builder: (_) => const HomePage(),
      );
  }
  return MaterialPageRoute(builder: (_) => const SignInPage());
}
