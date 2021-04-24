import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

abstract class AuthInjectionContainer {
  static init(GetIt sl) {
    sl.registerLazySingleton(() => FirebaseAuth.instance);
  }
}
