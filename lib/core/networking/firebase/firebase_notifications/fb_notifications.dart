import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '/config/all_imports.dart';
import 'package:googleapis_auth/auth_io.dart' as auth;

Future<void> firebaseMessagingBackgroundHandler(
    RemoteMessage remoteMessage) async {
  //BACKGROUND Notifications - iOS & Android
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  instance<FbNotifications>().manageNotificationAction();
}

class FbNotifications {
  late AndroidNotificationChannel channel;

  late FlutterLocalNotificationsPlugin localNotificationsPlugin;

  /// Called in main function between ensureInitialized <-> runApp(widget);
  Future<void> initNotifications() async {
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
        ledColor: Colors.white,
        enableLights: true,
        enableVibration: true,
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
            alert: true, badge: true, sound: true);
  }

  ///iOS Notification Permission
  Future<void> requestNotificationPermissions() async {
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
  void initializeForegroundNotificationForAndroid() {
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
  void manageNotificationAction() {
    FirebaseMessaging.onBackgroundMessage(
      (message) async {
        debugPrint('message: ${message.notification!.body}');
        if (message.data.isNotEmpty) {
          _controlNotificationNavigation(message.data);
        }
      },
    );
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      debugPrint('message: ${message.notification!.body}');
      if (message.data.isNotEmpty) {
        _controlNotificationNavigation(message.data);
      }
    });
  }

  void _controlNotificationNavigation(Map<String, dynamic> data) {
    debugPrint('Data: $data');
    if (data[ApiKeys.route] != null) {
      switch (data['page']) {
        case Routes.violationPaymentScreen:
          // var productId = data['id'];
          Get.toNamed(Routes.violationPaymentScreen);
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

  Future<String> _getAccessToken() async {
    String jsonString =
        await rootBundle.loadString(ManagerAssets.googleServiceKey);
    final client = await auth.clientViaServiceAccount(
      auth.ServiceAccountCredentials.fromJson(jsonString),
      [ApiConstants.googleapisUrl],
    );
    return client.credentials.accessToken.data;
  }

  Future<void> sendNotification({
    required String fcmToken,
    required String title,
    required String body,
    Map<String, dynamic>? data,
  }) async {
    final dio = Dio();
    String token = await _getAccessToken();
    debugPrint("FCM Access Token: $token");

    try {
      await dio.post(
        ApiConstants.fcmUrl,
        options: Options(
          headers: {
            ApiKeys.contentType: ApiConstants.applicationJson,
            ApiKeys.authorization: '${ApiConstants.bearer} $token'
          },
        ),
        data: <String, dynamic>{
          ApiKeys.message: {
            ApiKeys.token: fcmToken,
            ApiKeys.notification: {
              ApiKeys.title: title,
              ApiKeys.body: body,
            },
            ApiKeys.data: data,
            ApiKeys.android: {
              ApiKeys.notification: {
                ApiKeys.clickAction: ApiKeys.flutterNotificationClick,
                ApiKeys.channelId: ApiKeys.highImportanceChannel
              },
            },
          },
        },
      );
    } catch (e) {
      debugPrint("خطأ في إرسال الإشعار: $e");
    }
  }
}
