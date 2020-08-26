import 'package:calendr_todo/app/core/consts/colors_consts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class InputSwitch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      child: Row(
        children: <Widget>[
          SvgPicture.asset(
            "assets/icons/clock.svg",
            height: 40,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: new Text(
                'All Day',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: ColorsConst.textColor,
                  fontSize: 30.0,
                ),
              ),
            ),
          ),
          Switch(
            value: false,
            onChanged: (bool value) {
              value = true;
            },
            activeTrackColor: ColorsConst.secudaryColor,
            activeColor: ColorsConst.secudaryColor,
          ),
        ],
      ),
    );
  }
}
