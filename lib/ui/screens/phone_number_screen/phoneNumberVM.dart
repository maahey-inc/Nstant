import 'dart:developer';

import 'package:flutter/cupertino.dart';
import '../../../core/enums/locator.dart';
import '../../../core/enums/view_state.dart';
import '../../../core/models/get_code_body.dart';
import '../../../core/services/auth_services.dart';
import '../../../core/view_models/base_view_model.dart';

class PhoneViewModel extends BaseViewModel{


  TextEditingController _phoneController = TextEditingController();

  TextEditingController get phoneController => _phoneController;
  setName(TextEditingController controller) {
    _phoneController = controller;
    notifyListeners();
  }

  String _phoneNumber="";
  String get phoneNumber=>_phoneNumber;
  setPhone(String p){
    _phoneNumber=p;
    notifyListeners();
  }

  final authServices = locator<AuthenticationServices>();
   httpRequest(BuildContext context ) async {

  print("$phoneNumber${phoneController.text}");


   await authServices.verifyUserAccount("$phoneNumber${phoneController.text}");
  }


}