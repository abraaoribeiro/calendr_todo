import 'package:calendr_todo/app/core/consts/colors_consts.dart';
import 'package:calendr_todo/app/modules/task_form/task_form_page.dart';
import 'package:calendr_todo/app/services/permission_service.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ContactListPage extends StatefulWidget {
  ContactListPage({Key key}) : super(key: key);

  @override
  _ContactListPageState createState() => _ContactListPageState();
}

class _ContactListPageState extends State<ContactListPage> {
  List<Contact> _contacts = [];
  PermissionService permission = Modular.get();
  @override
  void initState() {
    super.initState();
    getAllContacts();
  }

  getAllContacts() async {
    if (permission.getPermissionsStatus('Contact') != "") {
      permission.requestPermissions('Contact');
      return refreshListContacts();
    }
  }

  refreshListContacts() async {
    List<Contact> contacts =
        (await ContactsService.getContacts(withThumbnails: true)).toList();
    _contacts = contacts;
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
                    Contact c = _contacts?.elementAt(index);
                    return ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                TaskFormPage(contactName: c.displayName),
                          ),
                        );
                      },
                      leading: (c.avatar != null && c.avatar.length > 0)
                          ? CircleAvatar(backgroundImage: MemoryImage(c.avatar))
                          : CircleAvatar(
                              child: Text(c.initials()),
                              backgroundColor: ColorsConst.primaryColor,
                            ),
                      title: Text(c.displayName ?? ""),
                    );
                  },
                )
              : Center(
                  child: CircularProgressIndicator(),
                ),
        ),
      ),
    );
  }
}
