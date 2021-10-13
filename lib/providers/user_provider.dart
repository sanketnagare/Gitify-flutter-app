import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:gitify/error_controllers/base_controller.dart';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
// import 'package:gitify/model/user.dart';
import 'package:gitify/model/user.dart';
import 'package:gitify/providers/exceptions.dart';
import 'package:gitify/utils/api.dart';
import 'package:http/http.dart' as http;


class UserProvider extends BaseController with ChangeNotifier   {
  User? user;
  static const int TIME_OUT_DURATION = 20;


  Future<void> getUserProfile(String username) async {
    final url = Uri.parse('${Api.api}/users/${username}');

    try {
      final response =
          await http.get(url, headers: {'Authorization': 'token ${Api.token}'});
        

      final responceData = json.decode(response.body) as Map<String, dynamic>;

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
          company: responceData['company'],
          
          ); 
          return _processResponse(response);

          
    }
     on SocketException {
      throw FetchDataException('No Internet connection', url.toString());
    } on TimeoutException {
      throw ApiNotRespondingException('API not responded in time', url.toString());
    }

  }

  dynamic _processResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = utf8.decode(response.bodyBytes);
        return responseJson;
        break;
      case 201:
        var responseJson = utf8.decode(response.bodyBytes);
        return responseJson;
        break;
      case 400:
        throw BadRequestException(utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 401:
      case 403:
        throw UnAuthorizedException(utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 422:
        throw BadRequestException(utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 500:
      default:
        throw FetchDataException('Error occured with code : ${response.statusCode}', response.request!.url.toString());
    }
  }

 
}

