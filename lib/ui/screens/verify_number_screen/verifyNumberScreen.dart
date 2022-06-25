import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:my_app/core/utils/colorsConstant.dart';
import 'package:my_app/ui/screens/phone_number_screen/phoneNumberVM.dart';
import 'package:my_app/ui/screens/verify_number_screen/verifyNumberVM.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/textStyle.dart';
import '../../widgets/buttonDefault.dart';
import '../../widgets/rounded_input_field.dart';
import '../name_screen/nameScreen.dart';

class VerifyNumberScreen extends StatelessWidget {
  const VerifyNumberScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<VerifyViewModel>(
      builder: (context, verifyModel, child) => Scaffold(
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
                            Center(child: Icon(Icons.arrow_back_ios_outlined,color: Colors.white)),
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
              const Spacer(),
              Text(
                "Verify your number",
                style: headingTextStyle,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: RoundedInputField(
                  hintText: "Enter OTP here",
                  controller: verifyModel.phoneController,
                  onChanged: (String value) {},
                  icon: Icons.phone,
                  textInputType: TextInputType.number,
                ),
              ),
              const SizedBox(height: 10,),

             Text("You should have just received\na text with your code",style: simpleTextStyle,textAlign: TextAlign.center,),


              const Spacer(),
              const Spacer(),
              const Spacer(),
              DefaultButton(

                press: () {
verifyModel.httpRequest(context);
                  Get.to(const NameScreen());
                },
                text: "Continue"
                ,txtStyle: buttonTextStyle,isIcon: true,
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
