import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:my_app/ui/screens/finish_screen/finishVM.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/colorsConstant.dart';
import '../../../core/utils/textStyle.dart';
import '../../widgets/buttonDefault.dart';
import 'imageScreen.dart';
class CameraScreen extends StatelessWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<FinishVM>(
      builder: (context, finishModel, child) => Scaffold(
        backgroundColor: backgroundMainColor,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [
                    CircleAvatar(
                      radius: 33,
                      backgroundColor: backgroundWidgetColor,
                      child: CircleAvatar(
                        radius: 31,
                        backgroundColor: black,
                        child: CircleAvatar(
                          backgroundColor: backgroundWidgetColor,
                          radius: 28,
                          child: Image.asset("assets/icons/user_account.png"),
                        ),
                      ),
                    ),
                    CircleAvatar(
                      radius: 33,
                      backgroundColor: backgroundWidgetColor,
                      child: CircleAvatar(
                        radius: 31,
                        backgroundColor: black,
                        child: CircleAvatar(
                          backgroundColor: backgroundWidgetColor,
                          radius: 28,
                          child:  Image.asset("assets/icons/male_user.png"),
                        ),
                      ),
                    ),
                  ],),

                ),
              ),
              Expanded(
                flex: 6,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color:cameraColor,
                      borderRadius: BorderRadius.circular(30)
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Row(

                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                  Image.asset("assets/icons/add_image.png"),
                  Image.asset("assets/icons/flash_on.png"),
                  Image.asset("assets/icons/camera_click.png"),
                  Image.asset("assets/icons/camera_record.png"),
                  Image.asset("assets/icons/synchronize.png"),


                  ],
                ),

              ),      Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Row(

                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Image.asset("assets/icons/picture.png"),
                     const SizedBox(width: 15,),
                     Text("History",style: headingTextStyle,)
                      ],
                    ),
                    const Spacer(),
                  GestureDetector(
                      onTap: (){
                        Get.to(const ImageScreen());
                      },
                      child:Image.asset("assets/icons/chevron_down.png"),),
                   const Spacer(),
                   const Spacer(),
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
