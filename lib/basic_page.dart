/*
**********Project Name: timer_splitter
**********File Name: home_page
**********Created At: 11-Aug-23 7:47 PM
**********Author: Abdelrhman Hussein
**********Description: The page to contain the other pages and the bottom navigation bar.
*/

import 'package:flutter/material.dart';
import 'package:timer_splitter/add_timer/presentation/pages/add_timer_page.dart';
import 'package:timer_splitter/app_timers/presentation/pages/app_timers_page.dart';
import 'package:timer_splitter/core/utils/colors.dart';
import 'package:timer_splitter/history/presentation/pages/history_age.dart';
import 'package:timer_splitter/home/presentation/pages/home_page.dart';
import 'package:timer_splitter/sitting/presentation/pages/sitting_page.dart';

import 'core/widgets/icon_button.dart';

class BasicPage extends StatefulWidget {
  const BasicPage({super.key});

  @override
  State<BasicPage> createState() => _BasicPageState();
}

class _BasicPageState extends State<BasicPage> {
  int bottomNavigationBarItemIndex = 2;

  List<Widget> pages = [
    HistoryPage(),
    SittingPage(),
    HomePage(),
    AppTimersPage(),
    AddTimerPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.mainColor,
      body: IndexedStack(
        index: bottomNavigationBarItemIndex,
        children: pages,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Row(
          textDirection: TextDirection.ltr,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  bottomNavigationBarItemIndex = 0;
                });
              },
              child: BottomNavigationIconButton(
                itemIndex: 0,
                selectedIndex: bottomNavigationBarItemIndex,
                iconPath: "assets/icons/History.svg",
                addButton: false,
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  bottomNavigationBarItemIndex = 1;
                });
              },
              child: BottomNavigationIconButton(
                itemIndex: 1,
                selectedIndex: bottomNavigationBarItemIndex,
                iconPath: "assets/icons/Sitting.svg",
                addButton: false,
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  bottomNavigationBarItemIndex = 2;
                });
              },
              child: BottomNavigationIconButton(
                itemIndex: 2,
                selectedIndex: bottomNavigationBarItemIndex,
                iconPath: (bottomNavigationBarItemIndex != 2)
                    ? "assets/icons/Home.svg"
                    : "assets/icons/Add.svg",
                addButton: true,
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  bottomNavigationBarItemIndex = 3;
                });
              },
              child: BottomNavigationIconButton(
                itemIndex: 3,
                selectedIndex: bottomNavigationBarItemIndex,
                iconPath: "assets/icons/Timers.svg",
                addButton: false,
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  bottomNavigationBarItemIndex = 4;
                });
              },
              child: BottomNavigationIconButton(
                itemIndex: 4,
                selectedIndex: bottomNavigationBarItemIndex,
                iconPath: "assets/icons/SandClock.svg",
                addButton: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
