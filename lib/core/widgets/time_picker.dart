/*
**********Project Name: timer_splitter
**********File Name: timer
**********Created At: 29-Jul-23 11:13 AM
**********Author: Abdelrhman Hussein
**********Description: The final shape of Timer that i created, it uses the TimeViewer to show the time wheel.
*/

import 'package:flutter/material.dart';
import 'package:timer_splitter/core/components/time_viewer.dart';
import 'package:timer_splitter/core/utils/colors.dart';
import '../styles/box_shadows.dart';

class TimePicker extends StatelessWidget {
  const TimePicker({super.key});

  //Val to easily Change the dimension of the container of the timer.
  static const double timerDimension = 250;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: timerDimension,
      height: timerDimension,
      margin: const EdgeInsets.symmetric(vertical: 20),
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      decoration: BoxDecoration(
        //get the created outer box shadow
        color: MyColors.mainColor,
        boxShadow: BoxShadows.usedOuterShadow,
        borderRadius: BorderRadius.circular(timerDimension / 2),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TimeViewer(times: 4, timeMode: "س"),
          TimeViewer(times: 60, timeMode: "د"),
          TimeViewer(times: 60, timeMode: "ث"),
        ],
      ),
    );
  }
}
