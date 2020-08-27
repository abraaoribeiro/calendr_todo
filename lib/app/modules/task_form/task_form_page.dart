import 'package:calendr_todo/app/core/consts/colors_consts.dart';
import 'package:calendr_todo/app/modules/contact_list/contact_list.dart';
import 'package:calendr_todo/app/modules/task_form/components/input_date.dart';
import 'package:calendr_todo/app/modules/task_form/components/input_icon.dart';
import 'package:calendr_todo/app/modules/task_form/components/input_switch.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:permission_handler/permission_handler.dart';

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
  Color currentColor = Colors.limeAccent;
  List<Color> currentColors = [Colors.limeAccent, Colors.green];
  void changeColor(Color color) => setState(() => currentColor = color);
  void changeColors(List<Color> colors) =>
      setState(() => currentColors = colors);

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    DateTime dateTime;
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
        reverse: true,
        child: Padding(
          padding: EdgeInsets.only(bottom: bottom),
          child: Container(
            child: _showForm(),
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
              InputSwitch(),
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
                funcion: () => showMaterialModalBottomSheet(
                  context: context,
                  builder: (context, scrollController) => ContactListPage(),
                ),
              ),
              InputIcon(
                text: "Repeat",
                fontSize: 24,
                icon: "refresh",
              ),
              _showInputColor(),
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

  Widget _showInputColor() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: InkWell(
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: currentColor,
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Text(
                "Change color",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: ColorsConst.grey400,
                ),
              ),
            ),
          ],
        ),
        onTap: () => showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                'Select a color',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              content: SingleChildScrollView(
                child: BlockPicker(
                  pickerColor: currentColor,
                  onColorChanged: changeColor,
                ),
              ),
              actions: [
                FlatButton(
                  onPressed: () => Navigator.pop(context, true),
                  child: Text(
                    'Yes',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
// TODO deixar generico a chamada do showRoundedDatePicker e showRoundedTimePicker

  Widget _showInputDateTime() {
    return Column(
      children: [
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InputDate(
                function: () async {
                  DateTime newDateTime = await showRoundedDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(DateTime.now().year - 1),
                    lastDate: DateTime(DateTime.now().year + 1),
                    borderRadius: 16,
                    theme: ThemeData(primarySwatch: Colors.purple),
                  );
                  if (newDateTime != null &&
                      newDateTime != controller.task.startDateTime) {
                    setState(() {
                      controller.task.startDateTime = newDateTime;
                    });
                  }
                },
                text: controller.task.startDateTime == null
                    ? "Date Start"
                    : "${DateFormat.yMMMd().format(controller.task.startDateTime)}",
                colorText: controller.task.startDateTime == null
                    ? ColorsConst.grey400
                    : ColorsConst.textColor,
              ),
              InputDate(
                function: () async {
                  final timePicked = await showRoundedTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                    theme: ThemeData(primarySwatch: Colors.purple),
                  );
                  if (timePicked != null &&
                      timePicked != controller.task.startTime) {
                    setState(() {
                      controller.task.startTime = timePicked;
                    });
                  }
                },
                text: controller.task.startTime == null
                    ? "Time Start"
                    : "${controller.task.startTime.format(context)}",
                colorText: controller.task.startTime == null
                    ? ColorsConst.grey400
                    : ColorsConst.textColor,
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InputDate(
              function: () async {
                DateTime newDateTime = await showRoundedDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(DateTime.now().year - 1),
                  lastDate: DateTime(DateTime.now().year + 1),
                  borderRadius: 16,
                  theme: ThemeData(primarySwatch: Colors.purple),
                );
                if (newDateTime != null &&
                    newDateTime != controller.task.endDateTime) {
                  setState(() {
                    controller.task.endDateTime = newDateTime;
                  });
                }
              },
              text: controller.task.endDateTime == null
                  ? "Date End"
                  : "${DateFormat.yMMMd().format(controller.task.endDateTime)}",
              colorText: controller.task.endDateTime == null
                  ? ColorsConst.grey400
                  : ColorsConst.textColor,
            ),
            InputDate(
              function: () async {
                final timePicked = await showRoundedTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                  theme: ThemeData(primarySwatch: Colors.purple),
                );
                if (timePicked != null &&
                    timePicked != controller.task.endTime) {
                  setState(() {
                    controller.task.endTime = timePicked;
                  });
                }
              },
              text: controller.task.endTime == null
                  ? "Time End"
                  : "${controller.task.endTime.format(context)}",
              colorText: controller.task.endTime == null
                  ? ColorsConst.grey400
                  : ColorsConst.textColor,
            ),
          ],
        ),
      ],
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
              width: 350,
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
