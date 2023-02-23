import 'package:flutter/material.dart';
import 'package:flutter_scale/screens/dashboard/dashboard_screen.dart';
import 'package:flutter_scale/screens/detailscreens/detail_screen.dart';
import 'package:flutter_scale/screens/drawermenu/about_screens.dart';
import 'package:flutter_scale/screens/drawermenu/contact_screens.dart';
import 'package:flutter_scale/screens/drawermenu/info_screen.dart';
import 'package:flutter_scale/screens/login/login_screen.dart';
import 'package:flutter_scale/screens/welcoms/welcome_screen.dart';

Map<String, WidgetBuilder> routes = {
  "/dashboard": (context) => const DashboardScreen(),
  "/about": (context) => const AboutScreen(),
  "/info": (context) => const InfoScreen(),
  "/contact": (context) => const ContactScreen(),
  "/login": (context) => const LoginScreen(),
  "/welcome": (context) => const WelcomeScreen(),
  "/detail": (context) => const DeetailScreen(),
};
