import 'dart:math';

import 'package:calendr_todo/app/core/consts/colors_consts.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:permission_handler/permission_handler.dart';

class ContactListPage extends StatefulWidget {
  ContactListPage({Key key}) : super(key: key);

  @override
  _ContactListPageState createState() => _ContactListPageState();
}

class _ContactListPageState extends State<ContactListPage> {
  List<Contact> _contacts = [];
  List circleColors = [Colors.pink, Colors.orange, Colors.greenAccent];
  Random random = new Random();
  Color randomGenerator() {
    return circleColors[new Random().nextInt(3)];
  }

  @override
  void initState() {
    super.initState();
    getAllCOntacts();
  }

  getAllCOntacts() async {
    PermissionStatus _permissionStatus = PermissionStatus.denied;
    if (_permissionStatus != PermissionStatus.undetermined) {
      List<Contact> contacts =
          (await ContactsService.getContacts(withThumbnails: false)).toList();
      _contacts = contacts;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFFFFFFF),
          title: Text(
            "Contacts List",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: ColorsConst.textColor,
              fontSize: 24,
            ),
          ),
        ),
        body: Container(
            child: SafeArea(
          child: _contacts != null
              ? ListView.builder(
                  itemCount: _contacts?.length ?? 0,
                  itemBuilder: (BuildContext context, int index) {
                    random.nextInt(8);
                    Contact c = _contacts?.elementAt(index);
                    return ListTile(
                      onTap: () {},
                      leading: (c.avatar != null && c.avatar.length > 0)
                          ? CircleAvatar(backgroundImage: MemoryImage(c.avatar))
                          : CircleAvatar(
                              child: Text(c.initials()),
                              backgroundColor: randomGenerator(),
                            ),
                      title: Text(c.displayName ?? ""),
                    );
                  },
                )
              : Center(
                  child: CircularProgressIndicator(),
                ),
        )));
  }
}

class PermissionWidget extends StatefulWidget {
  const PermissionWidget(this._permission);

  final Permission _permission;

  @override
  _PermissionState createState() => _PermissionState(_permission);
}

class _PermissionState extends State<PermissionWidget> {
  _PermissionState(this._permission);

  final Permission _permission;
  PermissionStatus _permissionStatus = PermissionStatus.undetermined;

  @override
  void initState() {
    super.initState();

    _listenForPermissionStatus();
  }

  void _listenForPermissionStatus() async {
    final status = await _permission.status;
    setState(() => _permissionStatus = status);
  }

  Color getPermissionColor() {
    switch (_permissionStatus) {
      case PermissionStatus.denied:
        return Colors.red;
      case PermissionStatus.granted:
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(_permission.toString()),
      subtitle: Text(
        _permissionStatus.toString(),
        style: TextStyle(color: getPermissionColor()),
      ),
      trailing: IconButton(
          icon: const Icon(Icons.info),
          onPressed: () {
            checkServiceStatus(context, _permission);
          }),
      onTap: () {
        requestPermission(_permission);
      },
    );
  }

  void checkServiceStatus(BuildContext context, Permission permission) async {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text((await permission.status).toString()),
    ));
  }

  Future<void> requestPermission(Permission permission) async {
    final status = await permission.request();

    setState(() {
      print(status);
      _permissionStatus = status;
      print(_permissionStatus);
    });
  }
}
