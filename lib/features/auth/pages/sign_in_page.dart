import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/ui_kit/custom_button.dart';
import 'package:shopping_app/core/ui_kit/custom_text_field.dart';
import 'package:shopping_app/features/auth/bloc/authentication_bloc.dart';
import 'package:shopping_app/features/auth/widgets/question_text.dart';
import 'package:shopping_app/features/routes/name_routes.dart';
import 'package:shopping_app/features/utils/app_colors.dart';
import 'package:shopping_app/features/utils/app_icons.dart';
import 'package:shopping_app/features/utils/app_text_styles.dart';
import 'package:shopping_app/features/utils/app_texts.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is AuthenticationSuccess) {
          Navigator.pushNamed(
            context,
            NameRoutes.signInPassword,
            arguments: controller.text,
          );
        } else if (state is AuthenticationFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage)),
          );
          return;
        }
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(
            top: 123,
            left: 23,
            right: 23,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppTexts.signIn,
                style: AppTextStyles.head32W700,
              ),
              CustomTextField(
                controller: controller,
                hintText: AppTexts.emailAddress,
                margin: const EdgeInsets.only(top: 32),
              ),
              CustomButton(
                height: 49,
                buttonText: AppTexts.continue1,
                margin: const EdgeInsets.symmetric(vertical: 16),
                buttonColor: AppColors.splashColor,
                textColor: AppColors.white,
                function: () {
                  context
                      .read<AuthenticationBloc>()
                      .add(CheckEmail(controller.text));
                },
              ),
              QuestionText(
                leftText: AppTexts.doYouHaveAccount,
                rightText: AppTexts.createOne,
                function: () => Navigator.pushNamed(
                  context,
                  NameRoutes.signUp,
                ),
              ),
              CustomButton(
                height: 49,
                buttonText: AppTexts.continueWithApple,
                margin: const EdgeInsets.only(
                  top: 71,
                ),
                textColor: AppColors.black,
                iconPath: AppIcons.apple.icon,
              ),
              CustomButton(
                height: 49,
                buttonText: AppTexts.continueWithGoogle,
                margin: const EdgeInsets.only(
                  top: 12,
                ),
                textColor: AppColors.black,
                iconPath: AppIcons.google.icon,
              ),
              CustomButton(
                height: 49,
                buttonText: AppTexts.continueWithFacebook,
                margin: const EdgeInsets.only(
                  top: 12,
                ),
                textColor: AppColors.black,
                iconPath: AppIcons.facebook.icon,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
