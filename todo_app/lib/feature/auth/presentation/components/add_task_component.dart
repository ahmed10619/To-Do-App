import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/utils/colors.dart';
import 'package:todo_app/core/utils/string.dart';

class AddTaskComponent extends StatelessWidget {
  const AddTaskComponent(
      {super.key,
      required this.text,
      this.controller,
      required this.hint,
      this.icon,
      this.readOnly = false,
      this.validator});
  final String text;
  final TextEditingController? controller;
  final IconButton? icon;
  final String hint;
  final bool readOnly;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.displayMedium,
        ),
        SizedBox(
          height: 8.h,
        ),
        TextFormField(
          style: TextStyle(
            color: AppColors.white,
          ),
          readOnly: readOnly,
          controller: controller,
          validator: validator,
          decoration: InputDecoration(
            hintText: hint,
            suffixIcon: icon,
          ),
        ),
      ],
    );
  }
}
