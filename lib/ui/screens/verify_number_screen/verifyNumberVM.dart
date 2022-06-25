import 'package:flutter/cupertino.dart';

import '../../../core/enums/locator.dart';
import '../../../core/enums/view_state.dart';
import '../../../core/services/auth_services.dart';
import '../../../core/view_models/base_view_model.dart';

class VerifyViewModel extends BaseViewModel{

  TextEditingController _phoneController = TextEditingController();

  TextEditingController get phoneController => _phoneController;

  setName(TextEditingController controller) {
    _phoneController = controller;
    notifyListeners();
  }


  final authServices = locator<AuthenticationServices>();
  httpRequest(BuildContext context ) async {

    await authServices.verifyUserCode(phoneController.text);
  }

}