import 'package:flutter/material.dart';
import 'package:shopping_app/core/ui_kit/custom_button.dart';
import 'package:shopping_app/core/ui_kit/custom_text_field.dart';
import 'package:shopping_app/features/auth/widgets/question_text.dart';
import 'package:shopping_app/features/routes/name_routes.dart';
import 'package:shopping_app/features/utils/app_colors.dart';
import 'package:shopping_app/features/utils/app_text_styles.dart';
import 'package:shopping_app/features/utils/app_texts.dart';

class SignInPassword extends StatefulWidget {
  const SignInPassword({super.key});

  @override
  State<SignInPassword> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<SignInPassword> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    return Scaffold(
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
              textAlign: TextAlign.left,
            ),
            CustomTextField(
              controller: controller,
              hintText: AppTexts.password,
              margin: const EdgeInsets.only(top: 32),
            ),
            const CustomButton(
              height: 49,
              buttonText: AppTexts.continue1,
              margin: EdgeInsets.only(
                top: 16,
                bottom: 8,
              ),
              buttonColor: AppColors.splashColor,
              textColor: AppColors.white,
            ),
            QuestionText(
              leftText: AppTexts.forgotPassword,
              rightText: AppTexts.reset,
              function: () =>
                  Navigator.pushNamed(context, NameRoutes.forgotPassword),
            ),
          ],
        ),
      ),
    );
  }
}
