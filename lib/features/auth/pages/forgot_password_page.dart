import 'package:flutter/material.dart';
import 'package:shopping_app/core/ui_kit/custom_button.dart';
import 'package:shopping_app/core/ui_kit/custom_text_field.dart';
import 'package:shopping_app/features/auth/widgets/auth_back_button.dart';
import 'package:shopping_app/features/utils/app_colors.dart';
import 'package:shopping_app/features/utils/app_text_styles.dart';
import 'package:shopping_app/features/utils/app_texts.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController controller = TextEditingController();
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
              AppTexts.forgotPassword,
              style: AppTextStyles.head32W700,
            ),
            CustomTextField(
              controller: controller,
              hintText: AppTexts.enterEmailAddress,
              margin: const EdgeInsets.only(
                top: 35,
              ),
            ),
            CustomButton(
              height: 49,
              buttonText: AppTexts.continue1,
              margin: const EdgeInsets.only(
                top: 24,
              ),
              buttonColor: AppColors.splashColor,
              textColor: AppColors.white,
              function: () {},
            ),
          ],
        ),
      ),
    );
  }
}
