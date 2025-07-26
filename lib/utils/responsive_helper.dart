import 'package:flutter/material.dart';

class ResponsiveHelper {
  static const double mobileBreakpoint = 768;
  static const double tabletBreakpoint = 1024;
  static const double desktopBreakpoint = 1200;

  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < mobileBreakpoint;
  }

  static bool isTablet(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= mobileBreakpoint && width < tabletBreakpoint;
  }

  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= tabletBreakpoint;
  }

  static double getHorizontalPadding(BuildContext context) {
    if (isMobile(context)) {
      return 20;
    } else if (isTablet(context)) {
      return 40;
    } else {
      return 50;
    }
  }

  static double getVerticalPadding(BuildContext context) {
    if (isMobile(context)) {
      return 40;
    } else if (isTablet(context)) {
      return 60;
    } else {
      return 100;
    }
  }

  static double getFontSize(BuildContext context, double baseFontSize) {
    if (isMobile(context)) {
      return baseFontSize * 0.8;
    } else if (isTablet(context)) {
      return baseFontSize * 0.9;
    } else {
      return baseFontSize;
    }
  }

  static int getFlexValue(BuildContext context, int desktopFlex, int mobileFlex) {
    return isMobile(context) ? mobileFlex : desktopFlex;
  }

  static MainAxisAlignment getMainAxisAlignment(BuildContext context,
      {MainAxisAlignment mobile = MainAxisAlignment.center,
      MainAxisAlignment desktop = MainAxisAlignment.spaceBetween}) {
    return isMobile(context) ? mobile : desktop;
  }

  static CrossAxisAlignment getCrossAxisAlignment(BuildContext context,
      {CrossAxisAlignment mobile = CrossAxisAlignment.center,
      CrossAxisAlignment desktop = CrossAxisAlignment.start}) {
    return isMobile(context) ? mobile : desktop;
  }

  static Widget buildResponsiveWidget(BuildContext context,
      {required Widget mobile, required Widget tablet, required Widget desktop}) {
    if (isMobile(context)) {
      return mobile;
    } else if (isTablet(context)) {
      return tablet;
    } else {
      return desktop;
    }
  }
}