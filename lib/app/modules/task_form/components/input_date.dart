
import 'package:calendr_todo/app/core/consts/colors_consts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputDate extends StatelessWidget {
  final String hintText;

  const InputDate({Key key, this.hintText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Flexible(
      child: new TextField(
        textAlign: TextAlign.end,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          border: InputBorder.none,
          hintText: hintText,
          alignLabelWithHint: true,
          hintStyle: TextStyle(
            fontWeight: FontWeight.w700,
            color: ColorsConst.grey400,
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
