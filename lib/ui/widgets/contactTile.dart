import 'package:flutter/material.dart';

import '../../core/utils/colorsConstant.dart';
import '../../core/utils/textStyle.dart';
import 'btnSmall.dart';

class ContactTile extends StatelessWidget {
  final String name;
  final String number;
  Function() onTap;

  ContactTile({Key? key, required this.name, required this.number, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex:1,
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: backgroundWidgetColor,
                      child: CircleAvatar(
                        radius: 22,
                        backgroundColor: black,
                        child: CircleAvatar(
                          backgroundColor: backgroundWidgetColor,
                          radius: 20,
                          child: Text(

                            "${name.substring(0, 1)}",
                            style: headingTextStyleContacts,
                          ),
                        ),
                      ),
                    ),
                  ),

                  Expanded(
                    flex: 4,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(),

                        ),
                        Expanded(
                          flex: 9,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: double.infinity,
                                child: Text(
                                  name,
                                  style: titleTextStyleContacts,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.start,


                                ),
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: Text(
                                  number,
                                  style: subTitleTextStyleContacts,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.start,
                                ),
                              ),
                            ],
                          ),

                        ),  Expanded(
                          flex: 1,
                          child: Container(),

                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: SmallButton(
                  text: "Add",
                  isIcon: true,
                  press: () {},
                  txtStyle: titleTextStyleContacts,
                  btnColor: backgroundWidgetColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
