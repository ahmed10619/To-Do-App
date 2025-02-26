import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/colors.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({super.key, required this.onPressed});
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: AppColors.primary,
      shape: const CircleBorder(),
      child: const Icon(
        Icons.add,
        color: AppColors.white,
      ),
    );
  }
}
