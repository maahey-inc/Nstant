import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:my_app/ui/screens/camera_screen/cameraScreen.dart';
import 'package:my_app/ui/screens/finish_screen/finishVM.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/colorsConstant.dart';
import '../../../core/utils/textStyle.dart';
import '../../widgets/buttonDefault.dart';
class FinishScreen extends StatelessWidget {
  const FinishScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<FinishVM>(
      builder: (context, finishModel, child) => Scaffold(
        backgroundColor: backgroundMainColor,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Text(
                        "Your Nstant is set up",
                        style: headingTextStyle,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Text(
                        "We’ll notify you once your\nfriends have set up theirs",
                        style: subHeadingTextStyle,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 8,
                child: Column(children: [

                  SizedBox(
                      height: Get.height/2.1,
                      child: SvgPicture.asset("assets/icons/mobile_4.svg")),
                  const  Spacer(),
                ],),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [

                    const Spacer(),
                    DefaultButton(
                      txtStyle: buttonSimpleTextStyle,
                      btnColor: backgroundWidgetColor,
                      press: () {
                        Get.to(const CameraScreen());
                      },
                      text: "Finish",
                    ),
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
