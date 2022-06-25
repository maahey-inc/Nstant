import 'package:get_it/get_it.dart';

import '../services/auth_services.dart';

GetIt locator = GetIt.instance;



setupLocator() {
  locator.registerSingleton(AuthenticationServices());

}