import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/colors.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton(
      {super.key, required this.text, required this.onPressed});
  final String text;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        onPressed;
      },
      child: Text(
        text,
        style: Theme.of(context).textTheme.displayMedium!.copyWith(
              color: AppColors.white.withOpacity(0.44),
            ),
      ),
    );
  }
}
