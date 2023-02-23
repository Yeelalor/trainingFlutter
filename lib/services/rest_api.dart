// ignore_for_file: unused_element, prefer_interpolation_to_compose_strings, unnecessary_null_comparison

import 'dart:convert';
import 'package:flutter_scale/models/NewsModel.dart';
import 'package:flutter_scale/utils/constant.dart';
import 'package:http/http.dart' as http;

class CallAPI {
  _setHeader() => {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };

  loginAPI(data) async {
    return await http.post(
      Uri.parse(baseURLAPI + 'login'),
      body: jsonEncode(data),
      headers: _setHeader(),
    );
  }

  Future<List<NewsModel>?> getAllNews() async {
    final resp = await http.get(
      Uri.parse(baseURLAPI + 'news'),
      headers: _setHeader(),
    );
    if (resp.body != null) {
      return newsModelFromJson(resp.body);
    } else {
      return null;
    }
  }
}
