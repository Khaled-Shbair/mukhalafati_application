import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '../../../../../config/all_imports.dart';

//typedef BackgroundMessageHandler = Future<void> Function(RemoteMessage message);
Future<void> firebaseMessagingBackgroundHandler(
    RemoteMessage remoteMessage) async {
  //BACKGROUND Notifications - iOS & Android
   await Firebase.initializeApp(
     options: DefaultFirebaseOptions.currentPlatform,
   );
  debugPrint('Message: ${remoteMessage.messageId}');
  debugPrint('FCM: ${await FirebaseMessaging.instance.getToken()}');
}

late AndroidNotificationChannel channel;
late FlutterLocalNotificationsPlugin localNotificationsPlugin;

class FbNotifications {
  /// CALLED IN main function between ensureInitialized <-> runApp(widget);
  static Future<void> initNotifications() async {
    //Connect the previous created function with onBackgroundMessage to enable
    //receiving notification when app in Background.
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

    //Channel
    if (!kIsWeb) {
      channel = const AndroidNotificationChannel(
        'notification_channel',
        'flutter android Notifications Channel',
        description:
            'This channel will receive notifications specific to news-app',
        importance: Importance.high,
        enableLights: true,
        enableVibration: true,
        ledColor: Colors.orange,
        showBadge: true,
        playSound: true,
      );
    }

    //Flutter Local Notifications Plugin (FOREGROUND) - ANDROID CHANNEL
    localNotificationsPlugin = FlutterLocalNotificationsPlugin();
    await localNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    //iOS Notification Setup (FOREGROUND)
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  //iOS Notification Permission
  static Future<void> requestNotificationPermissions() async {
    NotificationSettings notificationSettings =
        await FirebaseMessaging.instance.requestPermission(
      alert: true,
      badge: true,
      sound: true,
      carPlay: false,
      announcement: false,
      provisional: false,
      criticalAlert: false,
    );
    if (notificationSettings.authorizationStatus ==
        AuthorizationStatus.authorized) {
      debugPrint('GRANT PERMISSION');
    } else if (notificationSettings.authorizationStatus ==
        AuthorizationStatus.denied) {
      debugPrint('Permission Denied');
    }
  }

  //ANDROID
  static void initializeForegroundNotificationForAndroid() {
    FirebaseMessaging.onMessage.listen(
      (RemoteMessage message) {
        RemoteNotification? notification = message.notification;
        AndroidNotification? androidNotification = notification?.android;

        if (notification != null && androidNotification != null) {
          localNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                channelDescription: channel.description,
                icon: '@mipmap/ic_launcher',
              ),
            ),
          );
        }
      },
    );
  }

  //GENERAL (Android & iOS)
  static void manageNotificationAction() {
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      debugPrint('message: ${message.notification!.body}');
      _controlNotificationNavigation(message.data);
    });
  }

  static void _controlNotificationNavigation(Map<String, dynamic> data) {
    debugPrint('Data: $data');
    if (data['page'] != null) {
      Get.toNamed(Routes.notificationScreen);
      switch (data['page']) {
        case 'products':
          var productId = data['id'];
          debugPrint('Product Id: $productId');
          break;

        case 'settings':
          debugPrint('Navigate to settings');
          break;

        case 'profile':
          debugPrint('Navigate to Profile');
          break;
      }
    }
  }
}
