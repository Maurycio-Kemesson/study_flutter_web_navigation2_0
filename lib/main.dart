import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:study_flutter_web_navigation2_0/app.dart';
import 'package:study_flutter_web_navigation2_0/services/shared_preferences_service.dart';

void main() async {
  usePathUrlStrategy();
  bool isUserLoggedIn = await SharedPreferencesService.getUser();

  runApp(App(
    isLoggedIn: isUserLoggedIn,
  ));
}
