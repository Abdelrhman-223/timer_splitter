/*
**********Project Name: timer_splitter
**********File Name: main
**********Created At: 29-Jul-23 11:54 AM
**********Author: Abdelrhman Hussein
**********Description:
*/

import 'package:flutter/material.dart';
import 'package:timer_splitter/core/utils/colors.dart';
import 'package:timer_splitter/core/widgets/timer.dart';

import 'core/styles/box_shadows.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "BalooChettan2",
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.mainColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Timer(),
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: MyColors.mainColor,
                borderRadius: BorderRadius.circular(25),
                boxShadow: BoxShadows.darkOuter,
              ),
            ),
            Container(
              width: 50,
              height: 50,
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: MyColors.mainColor,
                borderRadius: BorderRadius.circular(25),
                boxShadow: BoxShadows.darkInner,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
