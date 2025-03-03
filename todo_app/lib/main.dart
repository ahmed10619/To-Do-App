import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/app/app.dart';
import 'package:todo_app/core/bloc/bloc_observer.dart';
import 'package:todo_app/core/database/cache/cache_helper.dart';
import 'package:todo_app/core/database/sqfLite_helper/sqfLite_helper.dart';
import 'package:todo_app/core/service/service_locator.dart';
import 'package:todo_app/feature/task/presentation/cubit/task_cubit_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  setup();
  await sl<CacheHelper>().init();
  sl<SqfLiteHelper>().intiDB();
  runApp(BlocProvider(
    create: (context) => TaskCubitCubit()..getTasks(),
    child: const MyApp(),
  ));
}
