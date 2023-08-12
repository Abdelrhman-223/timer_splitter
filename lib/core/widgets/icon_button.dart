/*
**********Project Name: timer_splitter
**********File Name: icon_button
**********Created At: 12-Aug-23 10:35 AM
**********Author: Abdelrhman Hussein
**********Description: custom bottom navigation icon button.
*/

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../styles/box_shadows.dart';
import '../utils/colors.dart';

class BottomNavigationIconButton extends StatelessWidget {
  final int itemIndex, selectedIndex;
  final String iconPath;
  final bool addButton;

  const BottomNavigationIconButton({
    super.key,
    required this.itemIndex,
    required this.selectedIndex,
    required this.iconPath,
    required this.addButton,
  });

  static const double addButtonDimension = 75, otherButtonsDimension = 50;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (addButton) ? addButtonDimension : otherButtonsDimension,
      height: (addButton) ? addButtonDimension : otherButtonsDimension,
      decoration: BoxDecoration(
        color: MyColors.mainColor,
        boxShadow:
            (itemIndex == selectedIndex) ? BoxShadows.usedInnerShadow : BoxShadows.usedOuterShadow,
        borderRadius: BorderRadius.circular(addButtonDimension / 2),
      ),
      child: SvgPicture.asset(
        iconPath,
        fit: BoxFit.none,
        color: (itemIndex == selectedIndex) ? MyColors.secondColor : MyColors.thirdColor,
      ),
    );
  }
}
