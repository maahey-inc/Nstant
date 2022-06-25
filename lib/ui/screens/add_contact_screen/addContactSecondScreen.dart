import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:get/get.dart';
import 'package:my_app/core/utils/colorsConstant.dart';
import 'package:my_app/ui/screens/add_contact_screen/addContactVM.dart';
import 'package:my_app/ui/screens/page_viewer_screens/pageViewerMainScreen.dart';
import 'package:my_app/ui/widgets/contactTile.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/utils/textStyle.dart';
import '../../widgets/buttonDefault.dart';
import '../../widgets/rounded_input_field.dart';

class AddContactSecondScreen extends StatelessWidget{
  const AddContactSecondScreen({Key? key}) : super(key: key);




  @override
  Widget build(BuildContext context) {

    return Consumer<AddContactViewModel>(
      builder: (context, addContactModel, child) => Scaffold(
        backgroundColor: backgroundMainColor,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Row(
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
              ),
              Expanded(
                flex: 5,
                child: Column(children: [
                  const Spacer(),
                  Text(
                    "Add your friends",
                    style: subHeadingTextStyle,
                  ),
                  Text(
                    "You can add upto 10 people",
                    style: subTitleTextStyle,
                  ), Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: RoundedInputField(
                      hintText: "Search your Contacts",
                      controller: addContactModel.searchController,
                      onChanged: (String value) {},
                      icon: Icons.search,
                      isIcon: true,
                      textInputType: TextInputType.name,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: Row(children: [
                      Image.asset("assets/icons/sparkling.png"),
                      const SizedBox(width: 20,),
                      Text(
                        "Suggestions",
                        style: subHeadingTextStyle,
                      ),
                    ],),
                  ),
                  const Spacer(),
                ],),
              ),

              Expanded(
                flex: 9,
  child:   SingleChildScrollView(
    child: SizedBox(
      height: 400,
          child: (addContactModel.contact) == null
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
      itemCount: addContactModel.contact!.length,
      itemBuilder: (BuildContext context, int index) {
          Uint8List? image = addContactModel.contact![index].photo;
          String num = (addContactModel.contact![index].phones.isNotEmpty) ? (addContactModel.contact![index].phones.first.number) : "--";


          return  ContactTile(name: "${addContactModel.contact![index].name.first} ${addContactModel.contact![index].name.last}", number: num,
              onTap: () {
                if (addContactModel.contact![index].phones.isNotEmpty) {
                  launch('tel: ${num}');
                }
              });
      },
    ),
        )

  ),
),


              Expanded(
                flex: 2,
                child: Column(
                  children: [
                  const  Spacer(),

                    DefaultButton(

                      txtStyle: buttonSimpleTextStyle,
                      btnColor: backgroundWidgetColor,
                      press: () {
                        Get.to(const PageViewerMainScreen());
                      },

                    ),
                    const  Spacer(),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
