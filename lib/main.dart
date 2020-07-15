import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app/app_module.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // TODO! Se a inicializacao do FirebaseMessaging for iniciada na linha abaixo, ao invés da linha 17 da classe AppPushsPage,
  // TODO! a mensagem não será lida corretamente quando for selecionada e o app estiver completamente fechado.
  //await NotificationHandler().initializeFcmNotification();

  runApp(
    ModularApp(module: AppModule()),
  );
}
