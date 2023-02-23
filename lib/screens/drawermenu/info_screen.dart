import 'package:flutter/material.dart';
import 'package:flutter_scale/utils/strings.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key});

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(CustomStrings.drawer_menu_info_text),
      ),
      body: Center(
        child: Text(CustomStrings.drawer_menu_info_text),
      ),
    );
  }
}
