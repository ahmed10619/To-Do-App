import 'package:get_it/get_it.dart';
import 'package:todo_app/core/database/cache/cache_helper.dart';
import 'package:todo_app/core/database/sqfLite_helper/sqfLite_helper.dart';

final sl = GetIt.instance;
void setup() {
  sl.registerLazySingleton<CacheHelper>(() => CacheHelper());
  sl.registerLazySingleton<SqfLiteHelper>(() => SqfLiteHelper());
}
