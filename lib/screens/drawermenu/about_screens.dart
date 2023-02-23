import 'package:flutter/material.dart';
import 'package:flutter_scale/utils/strings.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(CustomStrings.drawer_menu_work_text),
      ),
      body: Center(
        child: Text(CustomStrings.drawer_menu_work_text),
      ),
    );
  }
}
