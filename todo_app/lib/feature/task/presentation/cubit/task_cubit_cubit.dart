import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/core/database/sqfLite_helper/sqfLite_helper.dart';
import 'package:todo_app/core/service/service_locator.dart';
import 'package:todo_app/core/utils/colors.dart';
import 'package:todo_app/feature/task/data/model/task_model.dart';
import 'package:todo_app/feature/task/presentation/cubit/task_cubit_state.dart';

class TaskCubitCubit extends Cubit<TaskCubitState> {
  TaskCubitCubit() : super(TaskCubitInitial());
  TextEditingController titleController = TextEditingController();

  TextEditingController noteController = TextEditingController();
  GlobalKey<FormState> fromKey = GlobalKey<FormState>();

  DateTime currentDate = DateTime.now();
  String startTime = DateFormat('hh:mm a').format(DateTime.now());
  String endTime =
      DateFormat('hh:mm a').format(DateTime.now().add(Duration(minutes: 45)));
  int currentIndex = 0;
//!  Get Date From User
  void getDate(context) async {
    emit(GetDateLoadingState());
    DateTime? datePicker = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2028),
      initialEntryMode: DatePickerEntryMode.calendar,
    );

    if (datePicker != null) {
      currentDate = datePicker;
      emit(GetDateSucessgState());
    } else {
      print('datePicker == null');
      emit(GetDateErrorState());
    }
  }

  //! Get Start Time From User
  void getStartTime(context) async {
    emit(GetStartTimeLoadingState());
    TimeOfDay? startTimePicker = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(DateTime.now()),
    );

    if (startTimePicker != null) {
      startTime = startTimePicker.format(context);
      emit(GetStartTimeSucessgState());
    } else {
      print("startTimePicker == null");
      emit(GetStartTimeErrorState());
    }
  }

//! Get End Time From User
  void getEndTime(context) async {
    emit(GetEndtTimeLoadingState());
    TimeOfDay? endTimePicker = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(DateTime.now()),
    );

    if (endTimePicker != null) {
      endTime = endTimePicker.format(context);
      emit(GetEndtTimeSucessgState());
    } else {
      print("endTimePicker == null");
      emit(GetEndtTimeErrorState());
    }
  }

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

  void changeChackMarketIndex(index) {
    currentIndex = index;
    emit(ChangeChackMarketIndexState());
  }

  List<TaskModel> tasksList = [];

  void insertTest() async {
    emit(InsertLodingState());

    try {
      await sl<SqfLiteHelper>().insertToDB(
        TaskModel(
          title: titleController.text,
          note: noteController.text,
          startTime: startTime,
          endTime: endTime,
          date: DateFormat.yMd().format(currentDate),
          isComelate: 0,
          color: currentIndex,
        ),
      );
      getTasks();

      // tasksList.add(
      //   TaskModel(
      //     id: '1',
      //     title: titleController.text,
      //     note: noteController.text,
      //     startTime: startTime,
      //     endTime: endTime,
      //     date: DateFormat.yMd().format(currentDate),
      //     isComelate: false,
      //     color: currentIndex,
      //   ),
      // );
      titleController.clear();
      noteController.clear();
      emit(InsertSucessState());
    } catch (e) {
      emit(InsertErrorState());
    }
  }

  void getTasks() async {
    emit(GetLodingState());
    await sl<SqfLiteHelper>().getFromDB().then((value) {
      tasksList = value.map((e) => TaskModel.fromjson(e)).toList();
      emit(GetSucessState());
    }).catchError((e) {
      print(e.toString());
      emit(GetErrorState());
    });
  }

  void updateTask(int? id) async {
    if (id == null) {
      print("Error: id is null");
      return;
    }
    emit(UpdateLodingState());

    await sl<SqfLiteHelper>().updatedDB(id).then((value) {
      emit(UpdateSucessState());
      getTasks();
    }).catchError((e) {
      print(e.toString());
      emit(UpdateErrorState());
    });
  }
}
