import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/asset.dart';
import 'package:todo_app/core/utils/string.dart';

class NoTaskWidget extends StatelessWidget {
  const NoTaskWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(Assets.noTask),
        const SizedBox(
          height: 10,
        ),
        Text(
          //    textAlign: TextAlign.center,
          Strings.noTaskTitle,
          style: Theme.of(context).textTheme.displayMedium!.copyWith(
                fontSize: 24,
              ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          //   textAlign: TextAlign.center,
          Strings.noTaskSubtitle,
          style: Theme.of(context).textTheme.displayMedium!.copyWith(
                fontSize: 24,
              ),
        )
      ],
    );
  }
}
