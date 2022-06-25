import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:my_app/core/utils/textStyle.dart';

import '../../core/utils/colorsConstant.dart';
class SmallButton extends StatelessWidget {
  Function() press;
  Color btnColor;
  String text;
  bool isIcon;
  TextStyle txtStyle;
  SmallButton({Key? key,required this.press, this.btnColor=buttonColorPrimary, required this.txtStyle,this.text="Continue",this.isIcon=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return    Center(
      child: SizedBox(
        width: Get.width / 4,

        child:  ClipRRect(
          borderRadius: BorderRadius.circular(25),

          child: ElevatedButton(

              style: ElevatedButton.styleFrom(

                primary: btnColor,
              ),
              onPressed: press,
              child: isIcon?Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Icon(Icons.add,color: white,),
                  Text(
                    text,
                    style: txtStyle,
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
