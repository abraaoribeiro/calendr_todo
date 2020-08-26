import 'package:calendr_todo/app/modules/task_form/task_form_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class TaskFormModule extends ChildModule {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRouter> get routers => [];

  static Inject get to => Inject<TaskFormModule>.of();
}
