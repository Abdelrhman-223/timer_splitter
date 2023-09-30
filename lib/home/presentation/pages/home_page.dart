/*
**********Project Name: timer_splitter
**********File Name: run_timer_page
**********Created At: 12-Aug-23 9:55 AM
**********Author: Abdelrhman Hussein
**********Description: 
*/

import 'dart:async';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import '../../../core/utils/colors.dart';
import 'package:circular_seek_bar/circular_seek_bar.dart';
import 'package:timer_splitter/core/styles/box_shadows.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  Timer? timer;
  static int partsNumbers = 3;
  static const double timerDimension = 265;
  bool timerOn = false, timerFinish = false, reload = false;
  int timeHours = 0, timeMinutes = 0, timeSeconds = 15, timeMilliseconds = 0;
  int mainTimeHours = 0, mainTimeMinutes = 0, mainTimeSeconds = 0;

  void startTimer() {
    timer = Timer.periodic(
      const Duration(milliseconds: 1),
      (timer) {
        setState(() {
          timeMilliseconds++;
          if (timeMilliseconds == 120) {
            timeMilliseconds = 0;
            if (timeSeconds > 0) {
              timeSeconds--;
              reload = false;
            } else if (timeMinutes > 0) {
              timeMinutes--;
              timeSeconds = 59;
            } else if (timeHours > 0) {
              timeHours--;
              timeMinutes = 59;
              timeSeconds = 59;
            } else {
              timerOn = false;
              timerFinish = true;
              reload = true;
              timer.cancel();
            }
          }
        });
      },
    );
  }

  void pauseTimer() {
    timer?.cancel();
  }

  void cancelTimer() {
    setState(() {
      timeHours = 0;
      timeMinutes = 0;
      timeSeconds = 0;
    });
    timer?.cancel();
  }

  @override
  void initState() {
    setState(() {
      mainTimeHours = timeHours;
      mainTimeMinutes = timeMinutes;
      mainTimeSeconds = timeSeconds;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: MyColors.mainColor,
                boxShadow: BoxShadows.usedOuterShadow,
                borderRadius: BorderRadius.circular(timerDimension / 2),
              ),
              child: CircularSeekBar(
                barWidth: 5,
                dashGap: 10,
                startAngle: 180,
                sweepAngle: 360,
                animation: true,
                interactive: false,
                innerThumbRadius: 10,
                animDurationMillis: (reload)?1:1000,
                strokeCap: StrokeCap.round,
                width: timerDimension,
                height: timerDimension,
                trackColor: MyColors.thirdColor,
                progressColor: MyColors.secondColor,
                innerThumbColor: MyColors.secondColor,
                innerThumbStrokeWidth: 20,
                progress: 100 -
                    ((timeHours * 1200 + timeMinutes * 60 + timeSeconds) /
                            (mainTimeHours * 1200 + mainTimeMinutes * 60 + mainTimeSeconds)) * 100,
                // progress: 100 - ((currentTime / HomePage.mainTime) * 100),
                dashWidth: (360 - partsNumbers * 10) / partsNumbers,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "أسم المؤقت",
                      style: TextStyle(
                        fontSize: 25,
                        color: MyColors.thirdColor,
                      ),
                    ),
                    /*MyTimer(
                      timeHours: 10,
                      timeMinutes: 0,
                      timeSeconds: 10,
                    ),*/
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Directionality(
                          textDirection: TextDirection.ltr,
                          child: Text(
                            "${timeHours.toString().padLeft(2, '0')}:${timeMinutes.toString().padLeft(2, '0')}:${timeSeconds.toString().padLeft(2, '0')}",
                            style: TextStyle(
                              fontSize: 40,
                              color: MyColors.thirdColor,
                            ),
                          )),
                    ),
                    Text(
                      "data",
                      style: TextStyle(
                        fontSize: 25,
                        color: MyColors.thirdColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  if (timerFinish) {
                    timerOn = true;
                    timerFinish = false;
                    timeHours = mainTimeHours;
                    timeMinutes = mainTimeMinutes;
                    timeSeconds = mainTimeSeconds;
                    startTimer();
                  } else {
                    if (timerOn) {
                      timerOn = false;
                      pauseTimer();
                    } else {
                      timerOn = true;
                      startTimer();
                    }
                  }
                });
              },
              child: Container(
                width: 75,
                height: 75,
                margin: const EdgeInsets.symmetric(vertical: 35),
                decoration: BoxDecoration(
                  color: MyColors.mainColor,
                  boxShadow: (timerOn) ? BoxShadows.usedInnerShadow : BoxShadows.usedOuterShadow,
                  borderRadius: BorderRadius.circular(37.5),
                ),
                child: SvgPicture.asset(
                    (timerOn)
                        ? "assets/icons/Pause.svg"
                        : (timerFinish)
                            ? "assets/icons/Replay.svg"
                            : "assets/icons/PlayButton.svg",
                    fit: BoxFit.none),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
