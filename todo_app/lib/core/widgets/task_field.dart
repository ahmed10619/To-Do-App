import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/utils/colors.dart';
import 'package:todo_app/core/utils/string.dart';
import 'package:todo_app/feature/task/data/model/task_model.dart';
import 'package:todo_app/feature/task/presentation/cubit/task_cubit_cubit.dart';
import 'package:todo_app/feature/task/presentation/cubit/task_cubit_state.dart';

class TaskField extends StatelessWidget {
  const TaskField({super.key, required this.taskModel});
  final TaskModel taskModel;
  Color getColor(index) {
    switch (index) {
      case 0:
        return AppColors.red;
      case 1:
        return AppColors.green;
      case 2:
        return AppColors.blueGrey;
      case 3:
        return AppColors.blue;
      case 4:
        return AppColors.orange;
      case 5:
        return AppColors.purple;
      default:
        return AppColors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: BlocBuilder<TaskCubitCubit, TaskCubitState>(
        builder: (context, state) {
          return Container(
            //  color: AppColors.orange,
            height: 132,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: getColor(taskModel.color),
                borderRadius: BorderRadius.circular(16)),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        taskModel.title,
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.alarm,
                            color: AppColors.white,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            '${taskModel.startTime} - ${taskModel.endTime}',
                            style: Theme.of(context).textTheme.displayMedium,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        taskModel.note,
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 90,
                  width: 0.8,
                  color: Colors.white,
                  margin: EdgeInsets.only(right: 10),
                ),
                RotatedBox(
                  quarterTurns: 3,
                  child: Text(
                    taskModel.isComelate == 1
                        ? Strings.completed
                        : Strings.toDo,
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(fontSize: 18),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
