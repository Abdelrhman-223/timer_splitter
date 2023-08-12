/*
**********Project Name: timer_splitter
**********File Name: history_age
**********Created At: 12-Aug-23 10:01 AM
**********Author: Abdelrhman Hussein
**********Description: 
*/

import 'package:flutter/material.dart';
import '../../../core/utils/colors.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "History Page",
        style: TextStyle(
          color: MyColors.secondColor,
          fontSize: 25,
        ),
      ),
    );
  }
}
