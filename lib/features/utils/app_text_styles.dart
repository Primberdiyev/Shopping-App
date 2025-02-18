import 'package:flutter/material.dart';
import 'package:shopping_app/features/utils/app_colors.dart';

class AppTextStyles {
  static TextStyle get head32W700 => const TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w700,
        color: AppColors.black,
      );
  static TextStyle get body16W400 => TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColors.black.withValues(alpha: 0.5),
      );
  static TextStyle get body16W600 => const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      );
  static TextStyle get body12W600 => const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: AppColors.black,
      );
}
