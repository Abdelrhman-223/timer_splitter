/*
**********Project Name: timer_splitter
**********File Name: timer
**********Created At: 17-Aug-23 1:12 PM
**********Author: Abdelrhman Hussein
**********Description: countdown timer.
*/
import 'dart:async';
import '../utils/colors.dart';
import 'package:flutter/material.dart';

class MyTimer extends StatefulWidget {
  int timeHours = 0, timeMinutes = 0, timeSeconds = 0;

  MyTimer({
    super.key,
    required this.timeHours,
    required this.timeMinutes,
    required this.timeSeconds,
  });

  @override
  State<MyTimer> createState() => _MyTimerState();
}

class _MyTimerState extends State<MyTimer> {
  Timer? timer;
  bool timerOn = false;

  void startTimer() {
    timerOn = true;
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        setState(() {
          if (widget.timeSeconds > 0) {
            widget.timeSeconds--;
          } else if (widget.timeMinutes > 0) {
            widget.timeMinutes--;
            widget.timeSeconds = 59;
          } else if (widget.timeHours > 0) {
            widget.timeHours--;
            widget.timeMinutes = 59;
            widget.timeSeconds = 59;
          } else {
            timerOn = false;
            timer.cancel();
          }
        });
      },
    );
  }

  void pauseTimer() {
    setState(() {
      timerOn = false;
    });
    timer?.cancel();
  }

  void cancelTimer() {
    setState(() {
      timerOn = false;
      widget.timeHours = 0;
      widget.timeMinutes = 0;
      widget.timeSeconds = 0;
    });
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(10),
      child: Directionality(
          textDirection: TextDirection.ltr,
          child: Text(
            "${widget.timeHours.toString().padLeft(2, '0')}:${widget.timeMinutes.toString().padLeft(2, '0')}:${widget.timeSeconds.toString().padLeft(2, '0')}",
            style: TextStyle(
              fontSize: 40,
              color: MyColors.thirdColor,
            ),
          )),
    );
  }
}
