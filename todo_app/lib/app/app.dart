import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/theme/theme.dart';

import 'package:todo_app/core/utils/string.dart';
import 'package:todo_app/feature/auth/presentation/screens/splash_screen/splash_screen.dart';
import 'package:todo_app/feature/task/presentation/cubit/task_cubit_cubit.dart';
import 'package:todo_app/feature/task/presentation/cubit/task_cubit_state.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) {
          return BlocBuilder<TaskCubitCubit, TaskCubitState>(
            builder: (context, state) {
              return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  theme: getDefultThemes(),
                  darkTheme: getLightThemes(),
                  themeMode: BlocProvider.of<TaskCubitCubit>(context).isDark
                      ? ThemeMode.light
                      : ThemeMode.dark,
                  // title: 'To-Do App'
                  title: Strings.appName,
                  home: const SplashScreen());
            },
          );
        });
  }
}
