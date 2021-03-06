import 'services/permission_service.dart';
import 'package:calendr_todo/app/modules/task_form/task_form_module.dart';

import 'modules/task_form/task_form_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:calendr_todo/app/app_widget.dart';
import 'package:calendr_todo/app/modules/home/home_module.dart';

import 'services/task_service.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        $PermissionService,
        $TaskFormController,
        Bind((i) => TaskService()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, module: HomeModule()),
        ModularRouter("/edit", module: TaskFormModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
