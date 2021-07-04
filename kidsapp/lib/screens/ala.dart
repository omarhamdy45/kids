import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:audioplayers/audioplayers.dart';

int alarmId = 1;

// ignore: unused_element
void _examples() {
  // runs alarm timer once with time delay
  AndroidAlarmManager.oneShot(
    Duration(seconds: 5),
    alarmId,
    fireAlarm,
  );
  // runs alarm timer at exact time
  AndroidAlarmManager.oneShotAt(
    // date time format (year,month,date,hour,minutes,seconds)
    DateTime(2021, 02, 18, 14, 10),
    alarmId,
    fireAlarm,
  );
  // runs callback function repeatedly
  AndroidAlarmManager.periodic(
    // must be higher than 60 seconds
    Duration(seconds: 60),
    alarmId,
    fireAlarm,
  );
}

void fireAlarm() {
  final player = new AudioPlayer();
 // player.play(
     // 'https://muslim-kids.royaltechni.com/public/assets/audio/dailyhadiths/-1624717661.mp3');
}
