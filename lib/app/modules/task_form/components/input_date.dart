import 'package:calendr_todo/app/core/consts/colors_consts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputDate extends StatelessWidget {
  final String text;
  final Function function;
  final Color colorText;
  const InputDate({Key key, this.text, this.function, this.colorText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Flexible(
      child: InkWell(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: new Text(
            text,
            textAlign: TextAlign.end,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: colorText,
              fontSize: 24,
            ),
          ),
        ),
        onTap: function,
      ),
    );
  }
}
