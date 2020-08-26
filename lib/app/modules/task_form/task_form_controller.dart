import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'task_form_controller.g.dart';

@Injectable()
class TaskFormController = _TaskFormControllerBase with _$TaskFormController;

abstract class _TaskFormControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
