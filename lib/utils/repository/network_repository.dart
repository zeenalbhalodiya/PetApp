import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pet/components/colors.dart';
import 'package:pet/components/common_methos.dart';

import 'package:pet/utils/app_constants.dart';
import 'package:pet/utils/network_dio/network_dio.dart';

NetworkRepository networkRepository = NetworkRepository();

class NetworkRepository {
  static final NetworkRepository _networkRepository =
      NetworkRepository._internal();
  static final dataStorage = GetStorage();

  factory NetworkRepository() {
    return _networkRepository;
  }
  NetworkRepository._internal();

  FocusNode searchFocus = FocusNode();

  // StreamController gameDetailStream = new StreamController
  //     .broadcast(); // for stream builder - to add data in stramCiontroller
//Login
  userLogin(context, authUserData) async {
    try {
      final authUserResponse = await NetworkDioHttp.postDioHttpMethod(
        context: context,
        url: AppConstants.apiEndPoint + AppConstants.login,
        data: authUserData,
      );
      debugPrint('\x1b[97m Response : $authUserResponse');
      // return checkResponse(
      //     authUserResponse, LoginModel.fromJson(authUserResponse['body']));
    } catch (e) {
      CommonMethod().getXSnackBar("Error", e.toString(), red);
    }
  }

  Future<void> checkResponse(
    response,
    modelResponse,
  ) async {
    log("response check------>${response}---->Checked");
    if ((response['body']['status'] == 401 ||
            response['body']['status'] == 410) &&
        dataStorage.read("token") != null) {}
    if (response["error_description"] == null ||
        response["error_description"] == 'null') {
      if (response['body']['status'] == 200 ||
          response['body']['status'] == "200") {
        return modelResponse;
        // } else {
        //   showErrorDialog(message: response['body']['message']);
        // }
      } else if (response['body']['status'] == 500 ||
          response['body']['status'] == "500") {
        return modelResponse;
      } else {
        showErrorDialog(message: response['body']['message']);
      }
    }
    // else {
    //   if (response['body']['status'] == 401 ||
    //       response['body']['status'] == '401') {
    //     showErrorDialog(message: response['body']['message']);
    //     Future.delayed(Duration(seconds: 2), () {
    //       // Get.to(LoginScreen());
    //     });
    // }
    else {
      if (dataStorage.read("token") != null) {
        showErrorDialog(message: response['body']['message']);
      }
    }
    // }
  }

  Future<void> checkResponse2(
    response,
  ) async {
    log("response check------>2${response['body']['message']}---->Checked");
    if ((response['body']['status'] == 401 ||
            response['body']['status'] == 410) &&
        dataStorage.read("token") != null) {}
    if (response["error_description"] == null ||
        response["error_description"] == 'null') {
      if (response['body']['status'] == 200 ||
          response['body']['status'] == "200") {
        log('${response['body']}');
        return response['body'];
      } else if (response['body']['status'] == 500 ||
          response['body']['status'] == "500") {
        showErrorDialog(message: response['body']['message']);
        return response['body'];
      } else {
        showErrorDialog(message: response['body']['message']);
      }
    } else {
      if (dataStorage.read("token") != null) {
        showErrorDialog(message: response['error_description']);
      }
    }
  }

  void showErrorDialog({required String message}) {
    CommonMethod().getXSnackBar("Error", message.toString(), red);
  }
}
