import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:my_app/core/utils/colorsConstant.dart';
import 'package:my_app/ui/screens/welcome_screen/welcomeScreenVM.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/shared_preferences.dart';
import '../../../core/utils/textStyle.dart';
import '../../widgets/buttonDefault.dart';
import '../add_contact_screen/addContactFirstScreen.dart';
import '../name_screen/nameScreen.dart';
import '../phone_number_screen/phoneNumberScreen.dart';
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return  Consumer<WelcomeViewModel>(
        builder:(context, welcomeModel,child)=> Scaffold(
          backgroundColor: backgroundMainColor,
          body: SafeArea(
            child: Column(
              children: [
               const Spacer(),
               const Spacer(),
                SizedBox(
                    height: Get.height/2.1,
                    child: SvgPicture.asset("assets/icons/mobile.svg")),
              const  Spacer(),
                Image.asset("assets/icons/logo.png"),
               const Spacer(),
               Text("Live pics from your friends,\non your home screen",style: subHeadingTextStyle,),
               const Spacer(),

                DefaultButton(press: () async {
                  await HelperFunction.getTokenSharedPreference().then((value) {
                    print(value);
                    if(value!=null){
                      if (value!.isNotEmpty  && !value.contains("null")) {
                        Get.to(const NameScreen());
                      }else{
                        Get.to(const PhoneNumberScreen());
                      }
                    }else{
                      Get.to(const PhoneNumberScreen());
                    }

                  });
                  // Get.offAll(const PhoneNumberScreen());

                  },text: "Set up my Nstant",txtStyle: buttonTextStyle,isIcon: true,),
                const Spacer(),
              ],
            ),
          ),

        ),
      );
  }
}
