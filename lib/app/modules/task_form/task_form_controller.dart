import 'package:calendr_todo/app/models/task.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'task_form_controller.g.dart';

@Injectable()
class TaskFormController = _TaskFormControllerBase with _$TaskFormController;

abstract class _TaskFormControllerBase with Store {

  @observable
  Task task = new Task();

}
