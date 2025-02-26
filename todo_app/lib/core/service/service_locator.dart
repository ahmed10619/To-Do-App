import 'package:get_it/get_it.dart';
import 'package:todo_app/core/database/cache/cache_helper.dart';

final sl = GetIt.instance;
void setup() {
  sl.registerLazySingleton<CacheHelper>(() => CacheHelper());
}
