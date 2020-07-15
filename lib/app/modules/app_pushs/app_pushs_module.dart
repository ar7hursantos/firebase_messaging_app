import 'package:flutter_modular/flutter_modular.dart';

import 'app_pushs_controller.dart';
import 'app_pushs_page.dart';

class AppPushsModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppPushsController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => AppPushsPage()),
      ];

  static Inject get to => Inject<AppPushsModule>.of();
}
