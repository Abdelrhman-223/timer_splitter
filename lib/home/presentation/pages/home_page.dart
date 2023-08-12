/*
**********Project Name: timer_splitter
**********File Name: run_timer_page
**********Created At: 12-Aug-23 9:55 AM
**********Author: Abdelrhman Hussein
**********Description: 
*/

import 'package:flutter/material.dart';
import '../../../core/utils/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Home Page",
        style: TextStyle(
          color: MyColors.secondColor,
          fontSize: 25,
        ),
      ),
    );
  }
}
