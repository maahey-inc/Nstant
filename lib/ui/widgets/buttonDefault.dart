import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:my_app/core/utils/textStyle.dart';

import '../../core/utils/colorsConstant.dart';
class DefaultButton extends StatelessWidget {
  Function() press;
  Color btnColor;
  String text;
  bool isIcon;
  TextStyle txtStyle;
   DefaultButton({Key? key,required this.press, this.btnColor=buttonColorPrimary, required this.txtStyle,this.text="Continue",this.isIcon=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return    Center(
      child: SizedBox(
        width: Get.width / 1.2,
        height: Get.height/14,
        child:  ClipRRect(
          borderRadius: BorderRadius.circular(15),

          child: ElevatedButton(

              style: ElevatedButton.styleFrom(

                primary: btnColor,
              ),
              onPressed: press,
              child: isIcon?Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    text,
                    style: txtStyle,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset("assets/icons/right.png"),
                  ),
                ],
              ): Text(
                text,
                style: txtStyle,
              ),),
        ),
      ),
    );
  }
}
