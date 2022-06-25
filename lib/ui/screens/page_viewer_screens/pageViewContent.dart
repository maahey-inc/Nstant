
import 'package:flutter/material.dart';
import 'package:my_app/core/utils/textStyle.dart';
class PageViewContent extends StatelessWidget {
  final String text,image;
  const PageViewContent({Key? key,required this.text,required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Column(children: [
      Image.asset(image),
      const Spacer(),
      Text(text,textAlign: TextAlign.center,style: headingTextStyleNew,),

      const Spacer(),



    ],);
  }
}
