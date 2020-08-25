import 'package:calendr_todo/app/core/consts/colors_consts.dart';
import 'package:calendr_todo/app/core/consts/consts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TaskCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: defaultPadding, vertical: defaultPadding / 2),
      height: 160,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 136,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                color: Colors.greenAccent),
          ),
          Positioned(
            top: 40,
            left: size.width - 200,
            child: Hero(
              tag: 2,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                height: 40,
                width: 200,
                child: CircleAvatar(child: FlutterLogo()),
              ),
            ),
          ),
          Positioned(
            bottom: 60,
            left: 0,
            child: SizedBox(
              height: 136,
              width: size.width - 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: defaultPadding),
                    child: ListTile(
                      title: Text(
                        "Meenting",
                        style: GoogleFonts.josefinSans(
                            fontWeight: FontWeight.w700,
                            color: ColorsConst.textColor,
                            fontSize: 26.0),
                      ),
                      subtitle: Text(
                        "09:00 - 11:00",
                        style: GoogleFonts.josefinSans(
                            fontWeight: FontWeight.w400,
                            color: ColorsConst.textColor,
                            fontSize: 18.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 40,
            left: 20,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Text(
                "Marketting meeting with maria",
                style: GoogleFonts.josefinSans(
                    fontWeight: FontWeight.w400,
                    color: ColorsConst.textColor,
                    fontSize: 18.0),
                textAlign: TextAlign.left,
              ),
            ),
          )
        ],
      ),
    );
  }
}
