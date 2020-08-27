import 'package:calendr_todo/app/models/task.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:permission_handler/permission_handler.dart';

part 'task_form_controller.g.dart';

@Injectable()
class TaskFormController = _TaskFormControllerBase with _$TaskFormController;

abstract class _TaskFormControllerBase with Store {
  
  _TaskFormControllerBase() {
    refreshContacts();
  }

  @observable
  Task task = new Task();

  @observable
  Iterable<Contact> contacts;

  @action
  refreshContacts() async {
    if(Permission.contacts != Permission.contacts){
    var contactsLoad = await ContactsService.getContacts();
    contacts = contactsLoad;
    }
  }
}
