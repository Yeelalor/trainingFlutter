// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:flutter_scale/bottomnavmenu/home_screen.dart';
import 'package:flutter_scale/bottomnavmenu/notification_screen.dart';
import 'package:flutter_scale/bottomnavmenu/profile_screen.dart';
import 'package:flutter_scale/bottomnavmenu/report_screen.dart';
import 'package:flutter_scale/bottomnavmenu/setting_screens.dart';
import 'package:flutter_scale/themes/colors.dart';
import 'package:flutter_scale/utils/constant.dart';
import 'package:flutter_scale/utils/strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;
  String title = CustomStrings.appName;
  final List<Widget> _children = [
    HomeScreen(),
    ReportScreen(),
    NotificationScreen(),
    SettingScreens(),
    ProfileScreen(),
  ];
  void onTabChange(int index) {
    setState(() {
      _currentIndex = index;
      switch (index) {
        case 0:
          title = CustomStrings.bottom_menu_home_text;
          break;
        case 1:
          title = CustomStrings.bottom_menu_report_text;
          break;
        case 2:
          title = CustomStrings.bottom_menu_noti_text;
          break;
        case 3:
          title = CustomStrings.bottom_menu_setting_text;
          break;
        case 4:
          title = CustomStrings.bottom_menu_prefile_text;
          break;

        default:
      }
    });
  }

  String? _fullname, _username, _avatar;
  readUserProfile() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    _fullname = localStorage.getString('fullname');
    _username = localStorage.getString('username');
    _avatar = localStorage.getString('profile');
  }

  @override
  void initState() {
    super.initState();
    readUserProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: _children[_currentIndex],
      ),
      drawer: Drawer(
        backgroundColor: icons,
        child: Column(
          children: [
            Expanded(
                child: Column(
              children: [
                UserAccountsDrawerHeader(
                  accountName: Text(_username ?? ""),
                  accountEmail: Text(_fullname ?? "...."),
                  currentAccountPicture: _avatar != null
                      ? CircleAvatar(
                          backgroundColor: primary_dark,
                          backgroundImage:
                              NetworkImage('$baseImageURL/profile/$_avatar'),
                        )
                      : CircularProgressIndicator(),
                ),
                ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, '/about');
                  },
                  leading: Icon(Icons.person_outlined),
                  title: Text(CustomStrings.drawer_menu_work_text),
                  trailing: Icon(Icons.chevron_right),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(Icons.info_outline),
                  title: Text(CustomStrings.drawer_menu_info_text),
                  trailing: Icon(Icons.chevron_right),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(Icons.contact_mail),
                  title: Text(CustomStrings.drawer_menu_contact_text),
                  trailing: Icon(Icons.chevron_right),
                ),
                ListTile(
                  onTap: () async {
                    SharedPreferences localStorage =
                        await SharedPreferences.getInstance();
                    localStorage.setInt('userStep', 1);
                    Navigator.pushReplacementNamed(context, '/login');
                  },
                  leading: Icon(Icons.exit_to_app),
                  title: Text(CustomStrings.drawer_menu_logout_text),
                  trailing: Icon(Icons.chevron_right),
                ),
              ],
            )),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabChange,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: CustomStrings.bottom_menu_home_text),
          BottomNavigationBarItem(
              icon: Icon(Icons.report),
              label: CustomStrings.bottom_menu_report_text),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: CustomStrings.bottom_menu_noti_text),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: CustomStrings.bottom_menu_setting_text),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: CustomStrings.bottom_menu_prefile_text),
        ],
      ),
    );
  }
}
