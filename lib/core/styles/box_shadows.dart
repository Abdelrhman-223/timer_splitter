/*
**********Project Name: timer_splitter
**********File Name: box_shadows
**********Created At: 29-Jul-23 11:13 AM
**********Author: Abdelrhman Hussein
**********Description: Create shadows for components.
*/

import 'package:flutter/cupertino.dart';

BoxShadow boxShadow(bool negativeOffset, BlurStyle blurStyle, Color shadowColor) {
  return BoxShadow(
    blurRadius: 5,
    spreadRadius: 0,
    offset: (negativeOffset) ? const Offset(-2, -2) : const Offset(2, 2),
    blurStyle: blurStyle,
    color: shadowColor,
  );
}

class BoxShadows {
  static List<BoxShadow> usedOuterShadow = darkOuter;
  static List<BoxShadow> usedInnerShadow = darkInner;

  static List<BoxShadow> darkOuter = [
    boxShadow(true, BlurStyle.normal, const Color.fromRGBO(225, 225, 225, 0.15)),
    boxShadow(false, BlurStyle.normal, const Color.fromRGBO(0, 0, 0, 1)),
  ];

  static List<BoxShadow> darkInner = [
    boxShadow(false, BlurStyle.solid, const Color.fromRGBO(225, 225, 225, 0.15)),
    boxShadow(true, BlurStyle.solid, const Color.fromRGBO(0, 0, 0, 1)),
  ];
  static List<BoxShadow> lightOuter = [
    boxShadow(true, BlurStyle.outer, const Color.fromRGBO(0, 0, 0, 0.25)),
    boxShadow(false, BlurStyle.outer, const Color.fromRGBO(0, 0, 0, 0.25)),
  ];
  static List<BoxShadow> lightInner = [
    boxShadow(false, BlurStyle.inner, const Color.fromRGBO(0, 0, 0, 0.25)),
    boxShadow(true, BlurStyle.inner, const Color.fromRGBO(0, 0, 0, 0.25)),
  ];
}
