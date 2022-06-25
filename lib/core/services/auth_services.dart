// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import '../models/get_code_body.dart';
import '../models/get_code_response.dart';
import '../utils/shared_preferences.dart';
import 'api_services.dart';

import 'package:http/http.dart' as http;
class AuthenticationServices {

  String mainUrlGetCode="https://nstant.maahey.com/api/get_code";
  String mainUrlVerifyCode="https://nstant.maahey.com/api/verify_code";
  String mainUrl="https://nstant.maahey.com/api/update_user";

  late bool isLogin;
  String? fcmToken;

  // User? user;
  // Guide? guide;
  // List<Info>? info = [];
  // Group? group;
  // late String userType;
  // late String userLangCode;
  // String? filePath;
  //
  // SharedPreferenceServices sharedPrefsService = SharedPreferenceServices();

  AuthenticationServices() {
    init();
  }

  init() async {
    try {

    } catch (e, s) {
      debugPrint("AuthenticationServices init() Exception $e");
      print(s);
    }
  }



  Future<void> verifyUserUpdate(String fname,String lname,String email,String password,) async {
    late GetCodeResponse gcResponse;
    try {
      await HelperFunction.getTokenSharedPreference().then((value) async {
        if (value!.isNotEmpty  && !value.contains("null")) {
          print("tttttkkkknnn");
          print("tkn val: $value");
          Dio dio = ApiServices().launchToken(value);


          var formData = FormData.fromMap({

            "first_name": fname,
            "last_name": lname,
            "email": email,
            "password": password,

          });
          final response =
          await dio.post(mainUrl, data: formData);


          print(response.toString());

          if (response.statusCode == 200) {

          }
        }
        });
    } catch (e, s) {
      // ignore: avoid_print
      print("DatabaseService userLoginResponse() Exception: $e");
      // ignore: avoid_print
      print(s);
    }
  //  return gcResponse;
  }
  Future<void> verifyUserCode(String body) async {
    late GetCodeResponse gcResponse;
    try {
      await HelperFunction.getTokenSharedPreference().then((value) async {
        if (value!.isNotEmpty  && !value.contains("null")) {
          print("tttttkkkknnn");
          print(value);

          Dio dio = ApiServices().launchToken(value);


          var formData = FormData.fromMap({

            "code": body,

          });
          final response =
              await dio.post(mainUrlVerifyCode, data: formData);


          // print (response.toString());
          // print (response.data['token'].toString());
          // if(response.data['token'].toString().isNotEmpty && response.data['token'].toString()!=null){
          //   HelperFunction.saveTokenSharedPreference(response.data['token'].toString());
          //   await HelperFunction.getTokenSharedPreference().then((value) {
          //     if (value!.isNotEmpty  && !value.contains("null")) {
          //       print("tttttkkkknnn");
          //       print(value);
          //     }
          //   });
          // }
          if (response.statusCode == 200) {

          }
        }
      });
    } catch (e, s) {
      // ignore: avoid_print
      print("DatabaseService userLoginResponse() Exception: $e");
      // ignore: avoid_print
      print(s);
    }
  //  return gcResponse;
  }
  Future<void> verifyUserAccount(String body) async {
    late GetCodeResponse gcResponse;
    try {
      Dio dio = ApiServices().launch();
      String phone=body.replaceAll("+", "");

      // var request = http.MultipartRequest('POST', Uri.parse('https://nstant.maahey.com/api/get_code'));
      // request.fields.addAll({
      //   'phone': '923465227583'
      // });
      //
      //
      // http.StreamedResponse response = await request.send();
      //
      // if (response.statusCode == 200) {
      //   print(await response.stream.bytesToString());
      // }
      // else {
      //   print(response.reasonPhrase);
      // }
      var formData = FormData.fromMap({
        "phone": phone,
      });
      final response =
          await dio.post(mainUrlGetCode, data: formData);


      print (response.toString());
      print (response.data['token'].toString());
      if(response.data['token'].toString().isNotEmpty){
        HelperFunction.saveTokenSharedPreference(response.data['token'].toString());
        await HelperFunction.getTokenSharedPreference().then((value) {
          if (value!.isNotEmpty  && !value.contains("null")) {
            print("tttttkkkknnn");
            print(value);
          }
        });
      }
      if (response.statusCode == 200) {
        // ignore: avoid_print


      }
    } catch (e, s) {
      // ignore: avoid_print
      print("DatabaseService userLoginResponse() Exception: $e");
      // ignore: avoid_print
      print(s);
    }
  //  return gcResponse;
  }
//
}
