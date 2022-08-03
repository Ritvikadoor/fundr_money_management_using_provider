import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fundr_using_provider/settings/widgets/notification.dart';

timePicking({required context}) async {
  TimeOfDay currentTime = TimeOfDay.now();
  final Time sheduledTime;
  final TimeOfDay? pickedTIme = await showTimePicker(
    initialEntryMode: TimePickerEntryMode.dial,
    context: context,
    initialTime: currentTime,
  );
  if (pickedTIme != null && pickedTIme != currentTime) {
    NotificationApi.showScheduledNotifications(
        title: "Fundr",
        body: "You forgot to add something !",
        scheduledTime: Time(pickedTIme.hour, pickedTIme.minute, 0));
  }
}
