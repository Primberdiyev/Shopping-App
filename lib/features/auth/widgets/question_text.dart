import 'package:flutter/material.dart';
import 'package:shopping_app/features/utils/app_text_styles.dart';

class QuestionText extends StatelessWidget {
  const QuestionText({
    super.key,
    required this.leftText,
    required this.rightText,
    required this.function,
  });
  final String leftText;
  final String rightText;
  final VoidCallback function;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          leftText,
          style: AppTextStyles.body12W600.copyWith(
            fontWeight: FontWeight.w400,
          ),
        ),
        GestureDetector(
          onTap: function,
          child: Text(
            rightText,
            style: AppTextStyles.body12W600.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}
