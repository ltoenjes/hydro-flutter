import 'package:flutter/widgets.dart';
import 'package:hydro_flutter/app/bloc/app_bloc.dart';
import 'package:hydro_flutter/home/view/home_page.dart';
import 'package:hydro_flutter/login/login.dart';

List<Page> onGenerateAppViewPages(AppStatus state, List<Page<dynamic>> pages) {
  switch (state) {
    case AppStatus.authenticated:
      return [HomePage.page()];
    case AppStatus.unauthenticated:
    default:
      return [LoginPage.page()];
  }
}
