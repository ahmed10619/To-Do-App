import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/core/utils/colors.dart';
import 'package:todo_app/core/utils/string.dart';
import 'package:todo_app/core/widgets/custom_elevated_button.dart';
import 'package:todo_app/feature/auth/presentation/components/add_task_component.dart';
import 'package:todo_app/feature/task/presentation/cubit/task_cubit_cubit.dart';
import 'package:todo_app/feature/task/presentation/cubit/task_cubit_state.dart';

class AddTaskScreen extends StatelessWidget {
  AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          centerTitle: false,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_outlined,
              color: AppColors.white,
            ),
          ),
          title: Text(
            Strings.addTaskTitle,
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        body: Form(
          child: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 48),
              child: BlocBuilder<TaskCubitCubit, TaskCubitState>(
                builder: (context, state) {
                  final cubit = BlocProvider.of<TaskCubitCubit>(context);
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //! title
                      AddTaskComponent(
                        text: Strings.title,
                        controller: cubit.titleController,
                        hint: Strings.titleHint,
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      //! note
                      AddTaskComponent(
                        text: Strings.note,
                        controller: cubit.noteController,
                        hint: Strings.noteHint,
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      //! Date
                      AddTaskComponent(
                        text: Strings.date,
                        hint: DateFormat.yMd().format(cubit.currentDate),
                        icon: IconButton(
                          onPressed: () async {
                            cubit.getDate(context);
                          },
                          icon: Icon(Icons.calendar_month_outlined),
                          color: AppColors.white,
                        ),
                        readOnly: true,
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      //! StartTime - EndTime
                      Row(
                        children: [
                          //!Start
                          Expanded(
                            child: AddTaskComponent(
                              readOnly: true,
                              text: Strings.startTime,
                              hint: cubit.startTime,
                              icon: IconButton(
                                onPressed: () async {
                                  cubit.getStartTime(context);
                                },
                                icon: Icon(Icons.timer_outlined),
                                color: AppColors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 26.w,
                          ),
                          //!End
                          Expanded(
                            child: AddTaskComponent(
                              readOnly: true,
                              text: Strings.endTime,
                              hint: cubit.endTime,
                              icon: IconButton(
                                onPressed: () async {
                                  cubit.getEndTime(context);
                                },
                                icon: Icon(Icons.timer_outlined),
                                color: AppColors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      //! colors
                      SizedBox(
                        height: 24.h,
                      ),
                      SizedBox(
                        height: 68.h,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              Strings.color,
                              style: Theme.of(context).textTheme.displayMedium,
                            ),
                            Expanded(
                                child: ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          cubit.changeChackMarketIndex(index);
                                        },
                                        child: CircleAvatar(
                                          backgroundColor:
                                              cubit.getColor(index),
                                          child: index == cubit.currentIndex
                                              ? const Icon(
                                                  Icons.check,
                                                  color: AppColors.white,
                                                )
                                              : null,
                                        ),
                                      );
                                    },
                                    separatorBuilder: (context, index) =>
                                        SizedBox(
                                          width: 12.w,
                                        ),
                                    itemCount: 6))
                          ],
                        ),
                      ),
                      // const Spacer(),
                      SizedBox(
                        height: 92.h,
                      ),
                      SizedBox(
                        height: 48.h,
                        width: double.infinity,
                        child: CustomElevatedButton(
                            text: Strings.createTask, onPressed: () {}),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
