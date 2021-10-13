import 'dart:convert';

import 'package:get/get.dart';
import 'package:gitify/model/user.dart';
import 'package:gitify/ui/screens/show_custom_error.dart';
import 'package:http/http.dart';
import 'base_controller.dart';
import 'package:gitify/error_controllers/base_controller.dart';
import 'package:gitify/providers/user_provider.dart';
import 'package:gitify/providers/exceptions.dart';

class TestController extends GetxController with BaseController {
  void getData() async {

    var response = await UserProvider().getUserProfile('user').catchError(handleError);
      if (handleError is BadRequestException) {
        var message;
        var apiError = json.decode(handleError.toString());
        DialogHelper.showErroDialog(description: apiError["reason"]);
      } 
  }

  
  }
