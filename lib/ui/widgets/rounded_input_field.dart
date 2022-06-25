import 'package:flutter/material.dart';
import 'package:my_app/core/utils/colorsConstant.dart';
import 'package:my_app/ui/widgets/text_field_container.dart';

import '../../core/utils/textStyle.dart';


class RoundedInputField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final bool isPass;
  final bool isIcon;
  final textInputType;
  const RoundedInputField({
    Key? key,
    this.hintText="",
    this.icon = Icons.person,
    required this.onChanged,
    required this.controller,
     this.isPass=false,
     this.isIcon=false,
     this.textInputType=TextInputType.name,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: isIcon?TextField(

        style: textFieldStyle,
        keyboardType:  textInputType,
        obscureText: isPass,
        controller: controller,
        onChanged: onChanged,

        cursorColor: textColorPrimary,
        decoration: InputDecoration(


          icon: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Icon(
              icon,
              color: textColorPrimary,
            ),
          ),
          hintText: hintText,
          hintStyle: simpleTextStyleWhite,
          border: InputBorder.none,

        ),
      ):TextField(

        style: textFieldStyle,
        keyboardType:  textInputType,
        obscureText: isPass,
        controller: controller,
        onChanged: onChanged,

        cursorColor: textColorPrimary,
        decoration: InputDecoration(

          hintText: hintText,
          hintStyle: simpleTextStyleWhite,
          border: InputBorder.none,

        ),
      ),
    );
  }
}
