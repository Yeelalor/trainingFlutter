// ignore_for_file: prefer_const_constructors, unused_field, unused_element, use_build_context_synchronously, unused_local_variable

import 'dart:convert';
import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_scale/components/alert_popup.dart';
import 'package:flutter_scale/components/custom_widgets.dart';
import 'package:flutter_scale/services/rest_api.dart';
import 'package:flutter_scale/themes/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  late String _username, _password;

  void _onLogin() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    try {
      var checkNetwork = await Connectivity().checkConnectivity();
      if (checkNetwork == ConnectivityResult.none) {
        Utility.getInstance()!
            .showAlertDialog(context, 'Warning', 'No internet access');
      } else {
        var respone = await CallAPI()
            .loginAPI({"username": _username, "password": _password});
        var body = json.decode(respone.body);
        // log(body.toString());
        if (body['code'] == '200') {
          Navigator.pushReplacementNamed(context, '/dashboard');
          localStorage.setInt('userStep', 2);
          localStorage.setString('userid', body['data']['id']);
          localStorage.setString('username', body['data']['username']);
          localStorage.setString('fullname', body['data']['fullname']);
          localStorage.setString('profile', body['data']['img_profile']);
        } else {
          Utility.getInstance()!
              .showAlertDialog(context, 'warning', '${body['message']}');
        }
      }
    } on PlatformException catch (e) {
      log(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 150,
                ),
                Image.asset(
                  'assets/images/news1.png',
                  width: 150,
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 250,
                  child: inputFieldWidget(
                      context, Icon(Icons.person), "username", "username",
                      (value) {
                    if (value!.isEmpty) {
                      return 'username is require';
                    }
                  }, (onsave) {
                    _username = onsave;
                  }, autoFocus: true),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 250,
                  child: inputFieldWidget(
                      context, Icon(Icons.lock), "password", "password",
                      (value) {
                    if (value!.isEmpty) {
                      return 'password is require';
                    }
                  }, (onsave) {
                    _password = onsave;
                  }, obsecureText: true),
                ),
                SizedBox(
                  height: 5,
                ),
                SizedBox(
                  width: 250,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        _onLogin();
                      }
                    },
                    child: Text('login'),
                    style:
                        ElevatedButton.styleFrom(padding: EdgeInsets.all(15)),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    ));
  }
}
