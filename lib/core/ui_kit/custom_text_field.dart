import 'package:flutter/material.dart';
import 'package:shopping_app/features/utils/app_colors.dart';
import 'package:shopping_app/features/utils/app_text_styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.preficIcon,
    this.height = 56,
    this.contentPadding = const EdgeInsets.only(
      left: 12,
      top: 19,
      bottom: 17,
    ),
    required this.margin,
  });
  final TextEditingController controller;
  final String hintText;
  final Icon? preficIcon;
  final double height;
  final EdgeInsets contentPadding;
  final EdgeInsets margin;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: SizedBox(
        height: height,
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide.none,
            ),
            hintText: hintText,
            filled: true,
            fillColor: AppColors.generalColor,
            hintStyle: AppTextStyles.body16W400,
            contentPadding: contentPadding,
            prefixIcon: preficIcon,
          ),
        ),
      ),
    );
  }
}
