import 'dart:convert';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

class NotificationHandler {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  NotificationDetails platformChannelSpecifics;
  static final NotificationHandler _singleton = NotificationHandler._internal();

  factory NotificationHandler() {
    return _singleton;
  }
  NotificationHandler._internal();

  Future<void> initializeFcmNotification() async {
    var initializationSettingsAndroid =
        AndroidInitializationSettings('ic_launcher');

    var initializationSettingsIOS = IOSInitializationSettings(
        onDidReceiveLocalNotification: onDidReceiveLocalNotification);

    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);

    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );

    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'push_notification_strategy',
        'push_notification_strategy_name',
        'push_notification_strategy_description',
        importance: Importance.max,
        priority: Priority.high,
        ticker: 'ticker');

    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);

    _firebaseMessaging.configure(
      onMessage: (message) async {
        print("onMessage: $message");
        _processMessage(message);
      },
      onBackgroundMessage: myBackgroundMessageHandler,
      onResume: (message) async {
        print("onResume: $message");
        _processMessage(message);
      },
      onLaunch: (message) async {
        print("onLaunch: $message");
        _processMessage(message);
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

  void _processMessage(message) {
    _flutterLocalNotificationShow(message);
  }

  Future<void> _flutterLocalNotificationShow(message) async {
    String payload;
    if (Platform.isIOS) {
      payload = message['payload'];
    } else {
      payload = message['data']['payload'];
    }
    await flutterLocalNotificationsPlugin.show(
        0,
        message['notification']['title'],
        message['notification']['body'],
        platformChannelSpecifics,
        payload: payload);

    var parsedJson = json.decode(payload);
    var payloadMessage = parsedJson['message'];

    //Get.snackbar(type, payload);
    Get.offAllNamed('/home', arguments: {
      'message': payloadMessage,
    });
  }

  Future onDidReceiveLocalNotification(
      int id, String title, String body, String payload) {}

  Future onSelectNotification(String payload) {
    if (payload != null) {
      var parsedJson = json.decode(payload);
      var payloadMessage = parsedJson['message'];
      Get.offAllNamed('/home', arguments: {
        'message': payloadMessage,
      });
    }
  }

  // TOP-LEVEL or STATIC function to handle background messages
  // static Future<dynamic> myBackgroundMessageHandler(
  //     Map<String, dynamic> message) {
  //   Get.snackbar('myBackgroundMessageHandler', message.toString());
  //   return Future<void>.value();
  // }

  static Future myBackgroundMessageHandler(Map<String, dynamic> message) {}
}
