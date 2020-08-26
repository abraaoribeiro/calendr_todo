
import 'package:calendr_todo/app/core/consts/colors_consts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class InputIcon extends StatelessWidget {
  final String icon;
  final String text;
  final double fontSize;
  final Function funcion;
  const InputIcon({Key key, this.icon, this.text, this.fontSize, this.funcion})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: TextFormField(
        textAlign: TextAlign.left,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: text,
          alignLabelWithHint: true,
          hintStyle: TextStyle(
            fontWeight: FontWeight.w700,
            color: ColorsConst.grey400,
            fontSize: fontSize,
          ),
          icon: SvgPicture.asset(
            "assets/icons/$icon.svg",
            height: 40,
          ),
        ),
        onTap: funcion,
      ),
    );
  }
}