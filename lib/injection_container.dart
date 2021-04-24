import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:hydro_flutter/core/auth/injection_container.dart';

import 'core/http/injection_container.dart';

abstract class AppInjectionContainer {
  static init() async {
    final GetIt sl = GetIt.I;

    HttpInjectionContainer.init(sl);

    await Firebase.initializeApp();

    AuthInjectionContainer.init(sl);
  }
}
