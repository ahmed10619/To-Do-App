import 'package:flutter/material.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:todo_app/core/common/commons.dart';
import 'package:todo_app/core/database/cache/cache_helper.dart';
import 'package:todo_app/core/service/service_locator.dart';

import 'package:todo_app/core/utils/colors.dart';
import 'package:todo_app/core/utils/string.dart';
import 'package:todo_app/core/widgets/custom_elevated_button.dart';
import 'package:todo_app/core/widgets/custom_text_button.dart';
import 'package:todo_app/feature/auth/data/models/on_boarding_model.dart';
import 'package:todo_app/feature/task/presentation/screens/home_screen/home_screen.dart';

class OnBoradingScreens extends StatelessWidget {
  OnBoradingScreens({super.key});
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: PageView.builder(
            controller: controller,
            itemCount: 3,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  //skip
                  index != 2
                      ? Align(
                          alignment: Alignment.centerLeft,
                          child: CustomTextButton(
                            text: Strings.skip,
                            onPressed: () {
                              controller.jumpToPage(2);
                            },
                          ),
                        )
                      : const SizedBox(
                          height: 50,
                        ),
                  //image
                  const SizedBox(
                    height: 15,
                  ),

                  Image.asset(OnBoardingModel.OnBoardingList[index].imPath),
                  const SizedBox(
                    height: 15,
                  ),
                  //dots
                  SmoothPageIndicator(
                    controller: controller,
                    count: 3,
                    effect: const ExpandingDotsEffect(
                      dotHeight: 4,
                      activeDotColor: AppColors.primary,
                      spacing: 8,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  //title
                  Text(
                    OnBoardingModel.OnBoardingList[index].title,
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  //subtitle
                  Text(
                    OnBoardingModel.OnBoardingList[index].subTitle,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  const SizedBox(
                    height: 200,
                  ),
                  Row(
                    children: [
                      index != 0
                          ? CustomTextButton(
                              text: Strings.back,
                              onPressed: () {
                                controller.previousPage(
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.fastEaseInToSlowEaseOut);
                              },
                            )
                          : Container(),
                      const Spacer(),
                      index != 2
                          ? CustomElevatedButton(
                              text: Strings.next,
                              onPressed: () {
                                controller.nextPage(
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.fastLinearToSlowEaseIn);
                              },
                              //    color: AppColors.primary,
                            )
                          : CustomElevatedButton(
                              text: Strings.getStarted,
                              onPressed: () async {
                                await sl<CacheHelper>()
                                    .saveData(
                                        key: Strings.onBoardingKey, value: true)
                                    .then((value) {
                                  navigate(
                                      context: context,
                                      screen: const HomeScreen());
                                });
                              },
                              //   color: AppColors.primary,
                            )
                    ],
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
