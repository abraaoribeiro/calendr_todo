import 'package:calendr_todo/app/modules/task_form/task_form_page.dart';

import 'home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $HomeController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => HomePage()),
        ModularRouter("/edit", child: (_, args) => TaskFormPage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
