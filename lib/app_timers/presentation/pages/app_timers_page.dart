/*
**********Project Name: timer_splitter
**********File Name: app_timers_page
**********Created At: 12-Aug-23 9:58 AM
**********Author: Abdelrhman Hussein
**********Description: 
*/

import 'package:flutter/material.dart';
import '../../../core/utils/colors.dart';

class AppTimersPage extends StatelessWidget {
  const AppTimersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "App Timers Page",
        style: TextStyle(
          color: MyColors.secondColor,
          fontSize: 25,
        ),
      ),
    );
  }
}
