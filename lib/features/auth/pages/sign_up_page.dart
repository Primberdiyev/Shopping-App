import 'package:flutter/material.dart';
import 'package:shopping_app/core/ui_kit/custom_button.dart';
import 'package:shopping_app/core/ui_kit/custom_text_field.dart';
import 'package:shopping_app/features/auth/widgets/auth_back_button.dart';
import 'package:shopping_app/features/auth/widgets/question_text.dart';
import 'package:shopping_app/features/utils/app_colors.dart';
import 'package:shopping_app/features/utils/app_text_styles.dart';
import 'package:shopping_app/features/utils/app_texts.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 63,
          left: 23,
          right: 23,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AuthBackButton(),
            const SizedBox(
              height: 20,
            ),
            Text(
              AppTexts.createAccount,
              style: AppTextStyles.head32W700,
            ),
            CustomTextField(
              controller: firstNameController,
              hintText: AppTexts.firstName,
              margin: const EdgeInsets.only(top: 32),
            ),
            CustomTextField(
              controller: lastNameController,
              hintText: AppTexts.lastName,
              margin: const EdgeInsets.only(top: 16),
            ),
            CustomTextField(
              controller: emailController,
              hintText: AppTexts.emailAddress,
              margin: const EdgeInsets.only(top: 16),
            ),
            CustomTextField(
              controller: passwordController,
              hintText: AppTexts.password,
              margin: const EdgeInsets.only(top: 16),
            ),
            const CustomButton(
              height: 49,
              buttonText: AppTexts.continue1,
              margin: EdgeInsets.only(top: 32, bottom: 40),
              buttonColor: AppColors.splashColor,
              textColor: AppColors.white,
            ),
            QuestionText(
              leftText: AppTexts.forgotPassword,
              rightText: AppTexts.reset,
              function: () {},
            ),
          ],
        ),
      ),
    );
  }
}
