import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:my_app/core/utils/colorsConstant.dart';
import 'package:my_app/ui/screens/add_contact_screen/addContactSecondScreen.dart';
import 'package:my_app/ui/screens/name_screen/nameVM.dart';
import 'package:my_app/ui/screens/phone_number_screen/phoneNumberVM.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/textStyle.dart';
import '../../widgets/buttonDefault.dart';
import '../../widgets/rounded_input_field.dart';
import '../add_contact_screen/addContactFirstScreen.dart';

class NameScreen extends StatelessWidget {
  const NameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<NameViewModel>(
      builder: (context, nameModel, child) => Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: backgroundMainColor,
        body: SafeArea(

          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children:const [

                   Spacer(),
                   Spacer(),
                ],
              ),
              const Spacer(),
              const Spacer(),
              const Spacer(),
              Text(
                "What's your name?",
                style: headingTextStyle,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: RoundedInputField(
                  hintText: "First Name",
                  controller: nameModel.firstNameController,
                  onChanged: (String value) {},
                  icon: Icons.person,
                  textInputType: TextInputType.name,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: RoundedInputField(
                  hintText: "Last Name",
                  controller: nameModel.lastNameController,
                  onChanged: (String value) {},
                  icon: Icons.person,
                  textInputType: TextInputType.name,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: RoundedInputField(
                  hintText: "Email",
                  controller: nameModel.emailController,
                  onChanged: (String value) {},
                  icon: Icons.mail,
                  textInputType: TextInputType.emailAddress,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: RoundedInputField(
                  isPass: true,
                  hintText: "Password",
                  controller: nameModel.passwordController,
                  onChanged: (String value) {},
                  icon: Icons.lock,
                  textInputType: TextInputType.name,
                ),
              ),
              const Spacer(),


              const Spacer(),
              const Spacer(),
              DefaultButton(
              txtStyle: buttonTextStyle,isIcon: true,
                press: () async {

                nameModel.httpRequest(context).whenComplete(() =>  Get.to(const AddContactFirstScreen()));


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
