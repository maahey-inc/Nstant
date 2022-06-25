import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:my_app/ui/screens/finish_screen/finishVM.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/colorsConstant.dart';
import '../../../core/utils/textStyle.dart';
import '../../widgets/buttonDefault.dart';
class ImageScreen extends StatelessWidget {
  const ImageScreen({Key? key}) : super(key: key);

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
                  child: Stack(
                    children: [
                      const  Align(alignment: Alignment.centerLeft,child:  Icon(Icons.keyboard_arrow_up,size: 40,color: white,)),
                      const  Align(alignment: Alignment.centerRight,child:  Icon(Icons.more_horiz,size: 40,color: white,)),
                      Center(

                        child: Row(

                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("All Friends",style: headingTextStyle,),

                           const Icon(Icons.keyboard_arrow_down,size: 40,color: white,)
                          ],
                        ),
                      ),
                    ],
                  )
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
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("You",style:  TextStyle(
                        color: white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp,
                        fontFamily: 'Quicksand'),),
                    const SizedBox(width: 5,),
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0,left: 4.0),
                      child: Text("4m",style:  TextStyle(
                          color: textColorSecondary,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.sp,
                          fontFamily: 'Quicksand'),),
                    )
                  ],
                )

              ), Expanded(
                flex: 2,
                child: Container(),

              ),
              Expanded(
                flex: 2,
                child: Row(

                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                  Image.asset("assets/icons/four_squares.png"),
                  Image.asset("assets/icons/new_speech.png"),
                  Image.asset("assets/icons/favorite.png"),
                  Image.asset("assets/icons/share_rounded.png"),


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
