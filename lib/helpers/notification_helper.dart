import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationHelper {
  static final _notification = FlutterLocalNotificationsPlugin();

  static init() {
    tz.initializeTimeZones();
    _notification.initialize(
      const InitializationSettings(
        android: AndroidInitializationSettings("@mipmap/ic_launcher"),
        iOS: DarwinInitializationSettings(),
      ),
    );
  }

  static Future setAlarmOn({
    required int id,

    required DateTime dateTime,
  }) async {
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
          id.toString(),
          'alarm_channel',
          playSound: true,
          importance: Importance.high,
          priority: Priority.max,
          sound: RawResourceAndroidNotificationSound('notification'),
          fullScreenIntent: true,
        );
    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
      iOS: DarwinNotificationDetails(presentSound: true),
    );
    await _notification.zonedSchedule(
      id,
      "Alarm",
      "Alarm is on",
      tz.TZDateTime.from(dateTime, tz.local),
      notificationDetails,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }

  static Future cancelAlarm({required int id}) async {
    await _notification.cancel(id);
  }
}
