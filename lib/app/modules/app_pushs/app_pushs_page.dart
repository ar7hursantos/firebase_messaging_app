import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../core/notification_handler.dart';
import 'app_pushs_controller.dart';

class AppPushsPage extends StatefulWidget {
  @override
  _AppPushsPageState createState() => _AppPushsPageState();
}

class _AppPushsPageState
    extends ModularState<AppPushsPage, AppPushsController> {
  @override
  void initState() {
    super.initState();
    NotificationHandler().initializeFcmNotification();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
              child: Text('OLÁ!!!', style: TextStyle(color: Colors.black)))),
    );
  }
}
