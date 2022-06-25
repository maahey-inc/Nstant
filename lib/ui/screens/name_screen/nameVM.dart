import 'package:flutter/cupertino.dart';

import '../../../core/enums/locator.dart';
import '../../../core/enums/view_state.dart';
import '../../../core/services/auth_services.dart';
import '../../../core/view_models/base_view_model.dart';

class NameViewModel extends BaseViewModel {
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  TextEditingController get firstNameController => _firstNameController;

  TextEditingController get lastNameController => _lastNameController;

  TextEditingController get emailController => _emailController;

  TextEditingController get passwordController => _passwordController;

  setFirstName(TextEditingController controller) {
    _firstNameController = controller;
    notifyListeners();
  }

  setLastName(TextEditingController controller) {
    _lastNameController = controller;
    notifyListeners();
  }

  setEmail(TextEditingController controller) {
    _emailController = controller;
    notifyListeners();
  }

  setPassword(TextEditingController controller) {
    _passwordController = controller;
    notifyListeners();
  }

  final authServices = locator<AuthenticationServices>();

  Future<void> httpRequest(BuildContext context) async {
    await authServices.verifyUserUpdate(firstNameController.text,
        lastNameController.text, emailController.text, passwordController.text);
  }
}
