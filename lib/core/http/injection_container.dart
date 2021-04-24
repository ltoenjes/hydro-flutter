import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../config.dart';

abstract class HttpInjectionContainer {
  static init(GetIt sl) {
    final Dio dio = Dio();
    sl.registerLazySingleton<Dio>(() => dio);
    dio.options.baseUrl = '$BASE_PATH/api';
  }
}
