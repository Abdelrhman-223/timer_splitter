/*
**********Project Name: timer_splitter
**********File Name: sitting_page
**********Created At: 12-Aug-23 9:56 AM
**********Author: Abdelrhman Hussein
**********Description: 
*/

import 'package:flutter/material.dart';
import 'package:timer_splitter/core/utils/colors.dart';

class SittingPage extends StatelessWidget {
  const SittingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Sitting Page",
        style: TextStyle(
          color: MyColors.secondColor,
          fontSize: 25,
        ),
      ),
    );
  }
}
