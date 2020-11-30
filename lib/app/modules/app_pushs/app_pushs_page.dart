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
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('OLÁ!!!', style: TextStyle(color: Colors.black)),
            SizedBox(
              height: 20,
            ),
            MaterialButton(
              color: Colors.blueAccent,
              child: Text('Subscribe to FlutterDevs'),
              onPressed: () => NotificationHandler().subscribeToTopic('devs'),
            ),
            MaterialButton(
              color: Colors.redAccent,
              child: Text('Unsubscribe to FlutterDevs'),
              onPressed: () =>
                  NotificationHandler().unsubscribeFromTopic('devs'),
            ),
            SizedBox(
              height: 80,
            ),
            MaterialButton(
                color: Colors.blueAccent,
                child: Text('Send Message'),
                onPressed: () => NotificationHandler().sendMessageToTopic()),
          ],
        ),
      ),
    );
  }
}
