/*
**********Project Name: timer_splitter
**********File Name: main
**********Created At: 29-Jul-23 11:54 AM
**********Author: Abdelrhman Hussein
**********Description: the main page of the app that runs it.
*/

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'basic_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ar', 'AE'), // English, no country code
      ],
      theme: ThemeData(
        fontFamily: "BalooChettan2",
      ),
      home: const BasicPage(),
    );
  }
}