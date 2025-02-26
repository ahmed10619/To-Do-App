import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/core/common/commons.dart';
import 'package:todo_app/core/utils/asset.dart';
import 'package:todo_app/core/utils/colors.dart';
import 'package:todo_app/core/utils/string.dart';
import 'package:todo_app/core/widgets/custom_elevated_button.dart';
import 'package:todo_app/core/widgets/custom_floating_action_button.dart';
import 'package:todo_app/core/widgets/no_task_widget.dart';
import 'package:todo_app/core/widgets/task_field.dart';
import 'package:todo_app/feature/task/data/model/task_model.dart';
import 'package:todo_app/feature/task/presentation/screens/add_task_screen/add_task_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DateFormat.yMMMMd().format(
                  DateTime.now(),
                ),
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      fontSize: 24,
                    ),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                Strings.today,
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      fontSize: 24,
                    ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: SizedBox(
                  height: 100,
                  child: DatePicker(
                    DateTime.now(),
                    initialSelectedDate: DateTime.now(),
                    selectionColor: AppColors.deepPurple,
                    selectedTextColor: AppColors.white,
                    dateTextStyle: Theme.of(context).textTheme.displayMedium!,
                    dayTextStyle: Theme.of(context).textTheme.displayMedium!,
                    monthTextStyle: Theme.of(context).textTheme.displayMedium!,
                    onDateChange: (date) {
                      // New date selected
                      // setState(() {
                      //   _selectedValue = date;
                      // });
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: TaskModel.tasksList.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          CustomButtonSheet(context);
                        },
                        child: TaskField(
                          taskModel: TaskModel.tasksList[index],
                        ),
                      );
                    }),
              ),

              // NoTaskWidget(),
            ],
          ),
        ),
        floatingActionButton: CustomFloatingActionButton(onPressed: () {
          navigate(context: context, screen: AddTaskScreen());
        }),
      ),
    );
  }

  Future<dynamic> CustomButtonSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding: const EdgeInsets.all(24),
            height: 240,
            color: AppColors.deepGrey,
            child: Column(
              children: [
                SizedBox(
                  height: 48,
                  width: double.infinity,
                  child: CustomElevatedButton(
                    text: Strings.taskCompleted,
                    onPressed: () {},
                    //  color: AppColors.primary,
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                SizedBox(
                  height: 48,
                  width: double.infinity,
                  child: CustomElevatedButton(
                    text: Strings.deleteTask,
                    onPressed: () {},
                    color: AppColors.lightRed,
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                SizedBox(
                  height: 48,
                  width: double.infinity,
                  child: CustomElevatedButton(
                    text: Strings.cancel,
                    onPressed: () {},
                    //  color: AppColors.primary,
                  ),
                ),
              ],
            ),
          );
        });
  }
}
