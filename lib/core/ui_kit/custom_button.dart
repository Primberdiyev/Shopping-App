import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopping_app/features/utils/app_colors.dart';
import 'package:shopping_app/features/utils/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.height,
    required this.buttonText,
    this.buttonColor = AppColors.generalColor,
    this.iconPath,
    this.textColor = AppColors.black,
    required this.margin,
    this.function,
  });
  final double height;
  final String buttonText;
  final Color buttonColor;
  final String? iconPath;
  final Color textColor;
  final EdgeInsets margin;
  final VoidCallback? function;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        height: height,
        margin: margin,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: buttonColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            iconPath != null
                ? SvgPicture.asset(
                    iconPath ?? "",
                    alignment: Alignment.centerLeft,
                    height: 24,
                    width: 24,
                  )
                : const SizedBox(
                    height: 24,
                    width: 24,
                  ),
            Text(
              buttonText,
              textAlign: TextAlign.center,
              style: AppTextStyles.body16W600.copyWith(
                color: textColor,
              ),
            ),
            const SizedBox(
              height: 24,
              width: 24,
            ),
          ],
        ),
      ),
    );
  }
}
