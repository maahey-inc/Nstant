import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get.dart';
import 'package:my_app/ui/screens/add_contact_screen/addContactVM.dart';
import 'package:my_app/ui/screens/camera_screen/cameraVM.dart';
import 'package:my_app/ui/screens/finish_screen/finishVM.dart';
import 'package:my_app/ui/screens/name_screen/nameVM.dart';
import 'package:my_app/ui/screens/page_viewer_screens/pageViewerVM.dart';
import 'package:my_app/ui/screens/phone_number_screen/phoneNumberVM.dart';
import 'package:my_app/ui/screens/verify_number_screen/verifyNumberVM.dart';
import 'package:my_app/ui/screens/welcome_screen/welcomeScreen.dart';
import 'package:my_app/ui/screens/welcome_screen/welcomeScreenVM.dart';
import 'package:provider/provider.dart';

import 'core/enums/locator.dart';
import 'core/utils/shared_preferences.dart';


Future<void> main() async {


  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  setupLocator();
  // HelperFunction.saveTokenSharedPreference("4|OqQNxE5tVv5NwSdAeapAmPekrIOlZS3FUCt03QOk");

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  static final navigatorKey = GlobalKey<NavigatorState>();
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
  Map<int, Color> color =
  {
    50:Color.fromRGBO(4,131,184, .1),
    100:Color.fromRGBO(4,131,184, .2),
    200:Color.fromRGBO(4,131,184, .3),
    300:Color.fromRGBO(4,131,184, .4),
    400:Color.fromRGBO(4,131,184, .5),
    500:Color.fromRGBO(4,131,184, .6),
    600:Color.fromRGBO(4,131,184, .7),
    700:Color.fromRGBO(4,131,184, .8),
    800:Color.fromRGBO(4,131,184, .9),
    900:Color.fromRGBO(4,131,184, 1),
  };

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    /// For to mood off landscape

    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => WelcomeViewModel()),
      ChangeNotifierProvider(create: (context) => PhoneViewModel()),
      ChangeNotifierProvider(create: (context) => VerifyViewModel()),
      ChangeNotifierProvider(create: (context) => NameViewModel()),
      ChangeNotifierProvider(create: (context) => AddContactViewModel(context: context)),
      ChangeNotifierProvider(create: (context) => PageViewerVM()),
      ChangeNotifierProvider(create: (context) => FinishVM()),
      ChangeNotifierProvider(create: (context) => CameraVM()),
    ], child: ScreenUtilInit(
      designSize: const Size(428, 926),
      builder: (context,child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Nstant',
        navigatorKey: MyApp.navigatorKey,
        theme: ThemeData(
          primarySwatch: Colors.cyan,

        ),


         home: const WelcomeScreen(),

      ),
    ));

  }
}

