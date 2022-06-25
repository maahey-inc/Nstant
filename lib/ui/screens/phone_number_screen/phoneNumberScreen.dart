import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/core/utils/colorsConstant.dart';
import 'package:my_app/ui/screens/phone_number_screen/phoneNumberVM.dart';
import 'package:provider/provider.dart';
import '../../../core/utils/textStyle.dart';
import '../../widgets/buttonDefault.dart';
import '../verify_number_screen/verifyNumberScreen.dart';

class PhoneNumberScreen extends StatelessWidget {
  const PhoneNumberScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return Consumer<PhoneViewModel>(
      builder: (context, phoneModel, child) => Scaffold(
        backgroundColor: backgroundMainColor,
        body: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: const CircleAvatar(
                        radius: 30,
                        backgroundColor: backgroundMainColor2,
                        child:
                            Center(child: Icon(Icons.arrow_back_ios_outlined,color: Colors.white,)),
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
              const Spacer(),
              Text(
                "What’s your number?",
                style: headingTextStyle,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  margin:const  EdgeInsets.symmetric(vertical: 10),
                  padding:const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                  width: size.width * 0.8,
                  decoration: BoxDecoration(
                    color: backgroundWidgetColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Center(
                        child: CountryCodePicker(

                          flagWidth: 20,
                          textStyle: simpleTextStyleWhite,


                          onChanged: (val){
                            print(val.code);
                            print(val.dialCode);
                            phoneModel.setPhone(val.dialCode!);
                          },
                          // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                          initialSelection: 'IT',
                          favorite: ['+39','FR'],
                          // optional. Shows only country name and flag
                          showCountryOnly: true,
                          // optional. Shows only country name and flag when popup is closed.
                          showOnlyCountryWhenClosed: false,
                          // optional. aligns the flag and the Text left
                          alignLeft: false,
                        ),
                      ),
                      Container(
                       padding: EdgeInsets.only(bottom: 4),
                        width: size.width /2,
                        child: Center(
                          child: TextField(
                            style: textFieldStyle,
                            keyboardType:  TextInputType.phone,
                            controller: phoneModel.phoneController,
                            onChanged: (val){},
                            cursorColor: textColorPrimary,
                            decoration: InputDecoration(
                              hintText: "Phone number",
                              hintStyle: simpleTextStyle,
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      )


                    ],
                  ),
                ),
              ),

              const Spacer(),

              const Spacer(),
              const Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: 'By tapping  Continue,  you are agreeing to \nour ',style: TextStyle(color: textColorSecondary,fontSize: 17)),
                    TextSpan(
                      text: 'Terms of Service',
                      style: TextStyle(fontWeight: FontWeight.bold,color: textColorPrimary,fontSize: 17),
                    ),TextSpan(text: ' and ',style: TextStyle(color: textColorSecondary,fontSize: 17)),
                    TextSpan(
                      text: 'Privacy Policy',
                      style: TextStyle(fontWeight: FontWeight.bold,color: textColorPrimary,fontSize: 17),
                    ),

                  ],
                ),
              ),

              const Spacer(),
              DefaultButton(txtStyle: buttonTextStyle,isIcon: true,
                press: () async {
                print("Clicked");
                await phoneModel.httpRequest(context);
                 Get.to(const VerifyNumberScreen());
                },
                text: "Continue",
              ),
              const Spacer(),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
