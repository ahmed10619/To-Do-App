import 'package:todo_app/core/utils/asset.dart';
import 'package:todo_app/core/utils/string.dart';

class OnBoardingModel {
  final String imPath;
  final String title;
  final String subTitle;

  OnBoardingModel(
      {required this.imPath, required this.title, required this.subTitle});
  static List OnBoardingList = [
    OnBoardingModel(
        imPath: Assets.on1,
        title: Strings.onBordingTiTleOne,
        subTitle: Strings.onBordingSubtiTleOne),
    OnBoardingModel(
        imPath: Assets.on2,
        title: Strings.onBordingTiTleTwo,
        subTitle: Strings.onBordingSubtiTleTwo),
    OnBoardingModel(
        imPath: Assets.on3,
        title: Strings.onBordingTiTleThree,
        subTitle: Strings.onBordingSubtiTleThree),
  ];
}
