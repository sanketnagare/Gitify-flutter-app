import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';

import 'package:gitify/model/user.dart';

import 'package:gitify/utils/api.dart';
import 'package:http/http.dart' as http;

class UserProvider with ChangeNotifier {
  User? user;

  Future<void> getUserProfile(String username) async {
    final url = Uri.parse('${Api.api}/users/${username}');

    try {
      final response =
          await http.get(url, headers: {'Authorization': 'token ${Api.token}'});

      final responceData = json.decode(response.body) as Map<String, dynamic>;

      print(responceData['name']);

      user = User(
          username: responceData['login'],
          imageUrl: responceData['avatar_url'],
          followers: responceData['followers'],
          followings: responceData['following'],
          public_repos: responceData['public_repos'],
          joined_date: responceData['created_at'],
          name: responceData['name'],
          location: responceData['location'],
          url: responceData['html_url'],
          email: responceData['email'],
          company: responceData['company']);

      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
