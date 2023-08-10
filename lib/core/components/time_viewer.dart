/*
**********Project Name: timer_splitter
**********File Name: time_viewer
**********Created At: 29-Jul-23 11:13 AM
**********Author: Abdelrhman Hussein
**********Description: Its the code to view list of numbers (Time) with infinity loop, it use loop-page-view package.
*/

import 'package:flutter/material.dart';
import 'package:loop_page_view/loop_page_view.dart';
import 'package:timer_splitter/core/utils/colors.dart';

class TimeViewer extends StatelessWidget {
  //var to get the number of time to show.
  final int times;

  //hours "h", minuets "m", seconds "s".
  final String timeMode;

  const TimeViewer({super.key, required this.times, required this.timeMode});

  //the height of the list view.
  static const double timeDimension = 100;

  //to save the time in map to ease access.
  static Map<String, int> time = {
    "hours": 0,
    "minutes": 0,
    "seconds": 0,
  };

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: TextDirection.ltr,
      children: [
        StatefulBuilder(
          builder: (context, setState) => SizedBox(
            height: timeDimension,
            //dividing the dimension to get the width of the list.
            width: timeDimension / 2,
            child: LoopPageView.builder(
              itemCount: times,
              scrollDirection: Axis.vertical,
              controller: LoopPageController(
                //fraction to show just three items of the list that presented in page view.
                viewportFraction: 0.4,
              ),
              itemBuilder: (context, index) => Container(
                alignment: Alignment.center,
                child: Text(
                  //written like that to make numbers like "00".
                  (index < 10) ? "0$index" : index.toString(),

                  // next code to make only selected item has the style with larger font and soled color.
                  // the condition is if the selected index = the saved time in time map variable and the time mode on the same index mode then the condition will be true.
                  style: ((index == time["hours"]   && (timeMode == "h" || timeMode == "س")) ||
                          (index == time["minutes"] && (timeMode == "m" || timeMode == "د")) ||
                          (index == time["seconds"] && (timeMode == "s" || timeMode == "ث")))
                      ? TextStyle(
                          // this code will work when condition is true.
                          fontSize: 28,
                          color: MyColors.thirdColor,
                        )
                      : TextStyle(
                          // this code will work when condition is false.
                          fontSize: 20,
                          color: MyColors.thirdColor.withOpacity(0.5),
                        ),
                ),
              ),
              onPageChanged: (value) {
                //this code to save the new value of time in Time var, it depends on time mode.
                setState(() {
                  if (timeMode == "h" || timeMode == "س") {
                    time["hours"] = value;
                  } else if (timeMode == "m" || timeMode == "د") {
                    time["minutes"] = value;
                  } else if (timeMode == "s" || timeMode == "ث") {
                    time["seconds"] = value;
                  }
                });
              },
            ),
          ),
        ),
        Text(
          //
          timeMode,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            color: MyColors.thirdColor,
          ),
        ),
      ],
    );
  }
}
