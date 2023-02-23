import 'package:flutter/material.dart';
import 'package:flutter_scale/utils/strings.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(CustomStrings.drawer_menu_contact_text),
      ),
      body: Center(
        child: Text(CustomStrings.drawer_menu_contact_text),
      ),
    );
  }
}
