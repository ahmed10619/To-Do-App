import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/asset.dart';
import 'package:todo_app/core/utils/colors.dart';
import 'package:todo_app/core/utils/string.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // title: 'To-Do App'
      title: Strings.appName,
      home: Scaffold(
        backgroundColor: AppColors.background,
        body: Center(
          child: Image.asset(Assets.logo),
        ),
      ),
    );
  }
}
