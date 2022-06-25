import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:get/get.dart';
import 'package:my_app/core/utils/colorsConstant.dart';
import 'package:my_app/ui/screens/add_contact_screen/addContactSecondScreen.dart';
import 'package:my_app/ui/screens/add_contact_screen/addContactVM.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/textStyle.dart';
import '../../widgets/buttonDefault.dart';
import '../../widgets/rounded_input_field.dart';

class AddContactFirstScreen extends StatelessWidget {
  const AddContactFirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AddContactViewModel>(
      builder: (context, addContactModel, child) => Scaffold(
        backgroundColor: backgroundMainColor,
        body: SafeArea(
          child: Column(
            children: [
              const Spacer(),
              Text(
                "Add your friends",
                style: headingTextStyle,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "You can add upto 10 people",
                style: subTitleTextStyle,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: RoundedInputField(
                  hintText: "Search your Contacts",
                  controller: addContactModel.searchController,
                  onChanged: (String value) {},
                  icon: Icons.search_rounded,
                  isIcon: true,
                  textInputType: TextInputType.name,
                ),
              ),
              const Spacer(),
              const Icon(
                Icons.quick_contacts_dialer_outlined,
                size: 50,
                color: white,
              ),
              SizedBox(height: 20,),
              Text(
                "Import your contacts",
                style: subHeadingTextStyleNew,
              ),
              SizedBox(height: 20,),
              Text(
                "Nstant never saves your contacts\nor texts friends on your behalf",
                style: subTitleTextStyle,
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80.0),
                child: DefaultButton(
                  txtStyle: buttonSimpleTextStyle,
                  press: () async {
                    await FlutterContacts.requestPermission();
                    Get.to(const AddContactSecondScreen());
                  },
                  btnColor: backgroundWidgetColor,
                  text: "Enable Contacts",
                ),
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
