/*
**********Project Name: timer_splitter
**********File Name: add_timer_page
**********Created At: 12-Aug-23 9:57 AM
**********Author: Abdelrhman Hussein
**********Description: 
*/

import 'package:flutter/material.dart';
import '../../../core/utils/colors.dart';

class AddTimerPage extends StatelessWidget {
  const AddTimerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Add Timer Page",
        style: TextStyle(
          color: MyColors.secondColor,
          fontSize: 25,
        ),
      ),
    );
  }
}
