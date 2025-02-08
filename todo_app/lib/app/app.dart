import 'package:flutter/material.dart';

import 'package:todo_app/core/utils/string.dart';
import 'package:todo_app/feature/auth/presentation/screens/splash_screen/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        // title: 'To-Do App'
        title: Strings.appName,
        home: SplashScreen());
  }
}
