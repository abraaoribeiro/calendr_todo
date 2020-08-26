import 'package:calendr_todo/app/core/consts/colors_consts.dart';
import 'package:calendr_todo/app/modules/components/task_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';

import 'home_controller.dart';

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
      appBar: AppBar(
        backgroundColor: Color(0xFFFFFFFF),
        actions: [
          Container(
            width: 58,
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://4.bp.blogspot.com/-Jx21kNqFSTU/UXemtqPhZCI/AAAAAAAAh74/BMGSzpU6F48/s1600/funny-cat-pictures-047-001.jpg"),
                backgroundColor: Colors.amberAccent,
              ),
            ),
          ),
        ],
        title: Padding(
          padding: const EdgeInsets.only(
              bottom: 0.0, left: 5.0, right: 0.0, top: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: ColorsConst.textColor,
                  fontSize: 26.0,
                ),
              ),
              Text(
                "Friday, 2 August",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: ColorsConst.grey400,
                  fontSize: 16.0,
                ),
              ),

            ],
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          TaskCard(),
          TaskCard(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "btn1",
        child: IconButton(
          icon: SvgPicture.asset("assets/icons/add.svg"),
          onPressed: () {
            Modular.to.popAndPushNamed('/edit');
          },
        ),
        backgroundColor: Colors.white,
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container(
          color: ColorsConst.tertiaryColor,
          height: 60,
        ),
      ),
    );
  }
}
