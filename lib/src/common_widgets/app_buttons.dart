import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:salim_cbt/src/themes/theme.dart';

import 'app_text.dart';

class AppButtons {
  static Widget mainButton(
    String text, {
    Function? onPressed,
    double fontSize = 16,
    Color buttonColor = const Color(0xff8E97FD),
    Color textColor = Colors.white,
    EdgeInsets padding = const EdgeInsets.all(0),
    double radius = 25,
  }) {
    return ElevatedButton(
      onPressed: () {
        if (onPressed != null) {
          onPressed.call();
        }
      },
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ), backgroundColor: buttonColor,
        elevation: 0,
        padding: padding,
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: AppText.normalText(
          text,
          fontSize: fontSize,
          color: textColor,
          isBold: false,
        ),
      ),
    );
  }

  static Widget secondaryButton(
    String icon,
    String text, {
    Function? onPressed,
    double fontSize = 16,
    Color buttonColor = Colors.white,
    Color textColor = Colors.black,
    Color borderColor = Colors.black,
    EdgeInsets padding = const EdgeInsets.all(0),
    double radius = 25,
  }) {
    return ElevatedButton(
      onPressed: () {
        if (onPressed != null) {
          onPressed.call();
        }
      },
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ), backgroundColor: buttonColor,
        elevation: 0,
        padding: padding,
        // add border color
        side: BorderSide(color: borderColor, width: 0.1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Row(
          children: [
            SizedBox(width: 15),
            SvgPicture.asset(
              width: 25,
              height: 25,
              icon,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 25),
            AppText.normalText(
              text,
              fontSize: fontSize,
              color: textColor,
            ),
          ],
        ),
      ),
    );
  }

  static Widget borderedButton(
    String text, {
    Function? onPressed,
    double fontSize = 12,
    Color buttonColor = Colors.white,
    Color textColor = Colors.white,
    Color borderColor = Colors.white,
    double radius = 4,
  }) {
    return Container(
      width: 100,
      height: 33,
      child: ElevatedButton(
        onPressed: () {
          if (onPressed != null) {
            onPressed.call();
          }
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ), backgroundColor: buttonColor.withOpacity(0),
          elevation: 0,
          side: BorderSide(color: borderColor, width: 1),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: AppText.normalText(
            text,
            isBold: true,
            fontSize: fontSize,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
