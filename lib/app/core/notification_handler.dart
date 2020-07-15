import 'dart:convert';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class NotificationHandler {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  static final NotificationHandler _singleton = NotificationHandler._internal();

  factory NotificationHandler() {
    return _singleton;
  }
  NotificationHandler._internal();

  Future<void> initializeFcmNotification() async {
    _firebaseMessaging.configure(
      onMessage: (message) {
        _processMessage('onMessage', message);
        return;
      },
      onBackgroundMessage: Platform.isIOS ? null : myBackgroundMessageHandler,
      onResume: (message) {
        _processMessage('onResume', message);
        return;
      },
      onLaunch: (message) {
        _processMessage('onLaunch', message);
        return;
      },
    );

    if (Platform.isIOS) {
      _firebaseMessaging.onIosSettingsRegistered.listen((data) {
        // save the token  OR subscribe to a topic here
        print("Settings registered: $data");
      });
      _firebaseMessaging.requestNotificationPermissions(
          const IosNotificationSettings(sound: true, badge: true, alert: true));
    }

    print(await _firebaseMessaging.getToken());
  }

  void _processMessage(String type, Map<String, dynamic> message) {
    String payload;
    if (Platform.isIOS) {
      payload = message['payload'];
    } else {
      payload = message['data']['payload'];
    }

    var parsedJson = json.decode(payload);
    var payloadMessage = parsedJson['message'];

    //Get.snackbar(type, payload);
    Get.offAllNamed('/home', arguments: {
      'message': payloadMessage,
    });
  }

  // TOP-LEVEL or STATIC function to handle background messages
  static Future<dynamic> myBackgroundMessageHandler(
      Map<String, dynamic> message) {
    Get.snackbar('myBackgroundMessageHandler', message.toString());
    return Future<void>.value();
  }
}
