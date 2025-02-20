import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/ui_kit/custom_button.dart';
import 'package:shopping_app/core/ui_kit/custom_text_field.dart';
import 'package:shopping_app/features/auth/bloc/authentication_bloc.dart';
import 'package:shopping_app/features/auth/models/user_model.dart';
import 'package:shopping_app/features/auth/widgets/auth_back_button.dart';
import 'package:shopping_app/features/auth/widgets/question_text.dart';
import 'package:shopping_app/features/home/pages/home_page.dart';
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
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is AuthenticationSuccess) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const HomePage()),
          );
        } else if (state is AuthenticationFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage)),
          );
        }
      },
      builder: (context, state) {
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
                CustomButton(
                  height: 49,
                  buttonText: AppTexts.continue1,
                  margin: const EdgeInsets.only(top: 32, bottom: 40),
                  buttonColor: AppColors.splashColor,
                  textColor: AppColors.white,
                  state: state,
                  function: () {
                    final user = UserModel(
                      firstName: firstNameController.text,
                      lastName: lastNameController.text,
                      email: emailController.text,
                      password: passwordController.text,
                    );
                    context.read<AuthenticationBloc>().add(SignUpUser(user));
                  },
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
      },
    );
  }
}
