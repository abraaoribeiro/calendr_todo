import 'package:calendr_todo/app/core/consts/colors_consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_controller.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Today"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xFFFFFFFF),
          title: Padding(
            padding: const EdgeInsets.only(bottom: 0.0, left: 5.0, right: 0.0, top: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: GoogleFonts.josefinSans(
                      fontWeight: FontWeight.w700,
                      color: ColorsConst.textColor,
                      fontSize: 24.0),
                ),
                Text(
                  "Friday, 2 August",
                  style: GoogleFonts.josefinSans(
                      fontWeight: FontWeight.w700,
                      color: ColorsConst.grey400,
                      fontSize: 16.0),
                ),
              ],
            ),
          )),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}

