import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todo_app/core/utils/colors.dart';

void navigate({required BuildContext context, required Widget screen}) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => screen,
    ),
  );
}

void showToast({required String msg, required ToastState state}) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: getState(state),
      textColor: Colors.white,
      fontSize: 16.0);
}

enum ToastState { error, sucess, warining }

Color getState(ToastState state) {
  switch (state) {
    case ToastState.error:
      return AppColors.red;
    case ToastState.sucess:
      return AppColors.primary;
    case ToastState.warining:
      return AppColors.orange;
  }
}
