// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:vocabulary_learning/colors.dart';
import 'package:vocabulary_learning/main.dart';
import 'package:vocabulary_learning/models/vocabulary.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class ActionImage extends StatelessWidget {
  ActionImage({Key? key, required this.vocabulary}) : super(key: key);
  Vocabulary vocabulary;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                alignment: Alignment.center,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: kPink, borderRadius: BorderRadius.circular(60)),
                child: IconButton(
                  iconSize: 20,
                  color: Colors.blueGrey.shade200,
                  highlightColor: Colors.lightGreen.shade800,
                  icon: const Icon(Icons.favorite_border_outlined,
                      color: Color.fromARGB(255, 255, 146, 95), size: 28),
                  onPressed: () {},
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                padding: const EdgeInsets.all(5),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: kPink, borderRadius: BorderRadius.circular(60)),
                child: IconButton(
                  iconSize: 20,
                  color: Colors.blueGrey.shade200,
                  highlightColor: Colors.lightGreen.shade800,
                  icon: const Icon(Icons.alarm_rounded,
                      color: Color.fromARGB(255, 37, 138, 140), size: 28),
                  onPressed: () {
                    scheduleAlarm(DateTime.now(), vocabulary);
                  },
                ),
              )
            ],
          ),
          Container(
            height: size.height * 0.4,
            width: size.width * 0.7,
            decoration: const BoxDecoration(
              color: kPink,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20)),
            ),
            child: Image.network(
              vocabulary.image!,
              height: 330,
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
    );
  }

  void scheduleAlarm(
      DateTime scheduledNotificationDateTime, Vocabulary vocab) async {
    // ignore: prefer_const_constructors
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'alarm_notif',
      'alarm_notif',
      icon: 'codex_logo',
      sound: RawResourceAndroidNotificationSound('a_long_cold_sting'),
      largeIcon: DrawableResourceAndroidBitmap('codex_logo'),
    );

    var iOSPlatformChannelSpecifics = IOSNotificationDetails(
        sound: 'a_long_cold_sting.wav',
        presentAlert: true,
        presentBadge: true,
        presentSound: true);
    var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.schedule(0, 'Office', vocab.word,
        scheduledNotificationDateTime, platformChannelSpecifics);
  }
}
