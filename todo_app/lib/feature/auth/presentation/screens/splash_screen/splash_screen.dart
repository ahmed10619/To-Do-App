import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/core/database/cache/cache_helper.dart';
import 'package:todo_app/core/service/service_locator.dart';
import 'package:todo_app/core/utils/asset.dart';
import 'package:todo_app/core/utils/colors.dart';
import 'package:todo_app/core/utils/string.dart';
import 'package:todo_app/feature/auth/presentation/screens/on_borading_screens/on_borading_screens.dart';
import 'package:todo_app/feature/task/presentation/screens/home_screen/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigator();
  }

  void navigator() {
    bool isVisited =
        sl<CacheHelper>().getData(key: Strings.onBoardingKey) ?? false;
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => isVisited ? HomeScreen() : OnBoradingScreens()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Assets.logo),
            const SizedBox(
              height: 24,
            ),
            Text(Strings.appName,
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(fontSize: 40)),
          ],
        ),
      ),
    );
  }
}
