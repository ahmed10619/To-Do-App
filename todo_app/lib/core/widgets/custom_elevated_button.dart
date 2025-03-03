import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/colors.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton(
      {super.key, required this.text, required this.onPressed, this.color});
  final String text;
  final VoidCallback onPressed;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
            backgroundColor: WidgetStateProperty.all(color),
          ),
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(color: AppColors.white),
      ),
    );
  }
}
