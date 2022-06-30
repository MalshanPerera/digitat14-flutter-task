import 'package:flutter/material.dart' show AppBar, BuildContext, MediaQuery;
import 'package:intl/intl.dart';

class Utils {
  //Call these variables to get initialized screen sizes//

  ///app bar height
  static final double appBarHeight = AppBar().preferredSize.height;

  ///status bar height
  static late double statusBarHeight;

  ///total screen height without appbar or status bar
  static late double totalBodyHeight;

  ///body height with appbar and status bar reduced
  static late double reducedBodyHeight;

  ///body height with status bar reduced
  static late double contentBodyHeight;

  ///total screen width
  static late double bodyWidth;

  ///Set once in splash screen
  static setScreenSizes(BuildContext context) {
    statusBarHeight = MediaQuery.of(context).padding.top;
    bodyWidth = MediaQuery.of(context).size.width;
    totalBodyHeight = MediaQuery.of(context).size.height;

    reducedBodyHeight = totalBodyHeight - appBarHeight - statusBarHeight;
    contentBodyHeight = reducedBodyHeight - statusBarHeight;
  }

  static getWidth(designMargin) {
    return (designMargin / 414) * bodyWidth;
  }

  static getHeight(designMargin) {
    return (designMargin / 815) * totalBodyHeight;
  }

  static String convertDateTime(String dateTime, [String format = "E, d MMM yyyy h:mm a"]) {
    final DateTime date = DateTime.parse(dateTime);
    return DateFormat(format).format(date).toString();
  }
}
