// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_scale/routers.dart';
import 'package:flutter_scale/themes/styles.dart';
import 'package:shared_preferences/shared_preferences.dart';

var userStep;
var initRoute;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences localStorage = await SharedPreferences.getInstance();
  userStep = localStorage.getInt('userStep');
  if (userStep == 1) {
    initRoute = '/login';
  } else if (userStep == 2) {
    initRoute = '/dashboard';
  } else {
    initRoute = '/welcome';
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter training',
      theme: appTheme(),
      initialRoute: initRoute,
      routes: routes,
    );
  }
}
