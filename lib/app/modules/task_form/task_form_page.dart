import 'package:calendr_todo/app/core/consts/colors_consts.dart';
import 'package:calendr_todo/app/modules/components/input_date.dart';
import 'package:calendr_todo/app/modules/components/input_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'task_form_controller.dart';

class TaskFormPage extends StatefulWidget {
  final String title;
  const TaskFormPage({Key key, this.title = "TaskForm"}) : super(key: key);

  @override
  _TaskFormPageState createState() => _TaskFormPageState();
}

class _TaskFormPageState
    extends ModularState<TaskFormPage, TaskFormController> {
  //use 'controller' variable to access controller
  final _formKey = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
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
        leading: IconButton(
          icon: SvgPicture.asset(
            "assets/icons/close.svg",
            height: 30,
          ),
          onPressed: () {
            Modular.to.popAndPushNamed("/");
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: _showForm(),
        ),
      ),
    );
  }

  Widget _showInputDateTime() {
    return Column(
      children: [
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InputDate(
                hintText: "Date Start",
              ),
              InputDate(
                hintText: "Time Start",
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InputDate(
              hintText: "Date End",
            ),
            InputDate(
              hintText: "Time End",
            ),
          ],
        ),
      ],
    );
  }

  Widget _showInputAllDay() {
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
              this.setState(() {
                value = true;
              });
            },
            activeTrackColor: ColorsConst.secudaryColor,
            activeColor: ColorsConst.secudaryColor,
          ),
        ],
      ),
    );
  }

  Widget _showInputTitle() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: TextFormField(
        textAlign: TextAlign.left,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Title",
          alignLabelWithHint: true,
          hintStyle: TextStyle(
            fontWeight: FontWeight.w700,
            color: ColorsConst.grey400,
            fontSize: 34,
          ),
        ),
      ),
    );
  }

  Widget _showForm() {
    return new Container(
        padding: EdgeInsets.all(16.0),
        child: new Form(
          key: _formKey,
          child: new ListView(
            shrinkWrap: true,
            children: <Widget>[
              _showInputTitle(),
              _showInputAllDay(),
              _showInputDateTime(),
              InputIcon(
                text: "Location",
                fontSize: 24,
                icon: "pin",
              ),
              InputIcon(
                text: "Add People",
                fontSize: 24,
                icon: "user",
              ),
              InputIcon(
                text: "Repeat",
                fontSize: 24,
                icon: "refresh",
              ),
              InputIcon(
                text: "Add Note",
                fontSize: 24,
                icon: "note",
              ),
              _showSecondaryButton(),
            ],
          ),
        ));
  }

  Widget _showSecondaryButton() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 0.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 50.0,
              width: 250,
              child: new RaisedButton(
                color: ColorsConst.primaryColor,
                elevation: 3.0,
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(20.0),
                ),
                child: new Text(
                  'Save',
                  style: new TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w700,
                      color: ColorsConst.textColor),
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
