import 'dart:io';

import 'package:alarm/alarm.dart';

class HelperMethod {
  static Future<void> scheduleAdhan(String prayerName, String time) async {
    final timeParts = time.split(':');
    final hour = int.parse(timeParts[0]);
    final minute = int.parse(timeParts[1]);
    final now = DateTime.now();
    if (now.hour <= hour && now.minute < minute) {
      await Alarm.init();
      final alarmSettings = AlarmSettings(
        id: minute,
        dateTime: DateTime(now.year, now.month, now.day, hour, minute),
        assetAudioPath: 'assets/adhan.mp3',
        loopAudio: true,
        vibrate: true,
        volume: 0.8,
        fadeDuration: 3.0,
        warningNotificationOnKill: Platform.isIOS,
        androidFullScreenIntent: true,
        notificationSettings: NotificationSettings(
          title: '$prayerName',
          body: '',
          stopButton: "الغاء",
          icon: 'notification_icon',
        ),
      );
      await Alarm.set(alarmSettings: alarmSettings);
    }
  }

  static void scheduleAllAdhans(Map<String, String> prayerTimes) {
    prayerTimes.forEach((prayerName, time) {
      scheduleAdhan(prayerName, time);
    });
  }
}
