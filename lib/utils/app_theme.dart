import 'package:flutter/material.dart';

class AppTheme {
  // Light theme colors
  static const Color lightPrimary = Color(0xFF007AFF);
  static const Color lightSecondary = Color(0xFF5856D6);
  static const Color lightSurface = Color(0xFFF2F2F7);
  static const Color lightBackground = Color(0xFFFFFFFF);
  static const Color lightOnSurface = Color(0xFF1C1C1E);
  static const Color lightOnBackground = Color(0xFF1C1C1E);

  // Dark theme colors
  static const Color darkPrimary = Color(0xFF0A84FF);
  static const Color darkSecondary = Color(0xFF5E5CE6);
  static const Color darkSurface = Color(0xFF1C1C1E);
  static const Color darkBackground = Color(0xFF000000);
  static const Color darkOnSurface = Color(0xFFFFFFFF);
  static const Color darkOnBackground = Color(0xFFFFFFFF);

  // Glass effect colors
  static Color glassLight = Colors.white.withOpacity(0.25);
  static Color glassDark = Colors.white.withOpacity(0.15);
  static Color glassBorderLight = Colors.white.withOpacity(0.2);
  static Color glassBorderDark = Colors.white.withOpacity(0.1);

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: lightPrimary,
    scaffoldBackgroundColor: lightBackground,
    colorScheme: const ColorScheme.light(
      primary: lightPrimary,
      secondary: lightSecondary,
      surface: lightSurface,
      background: lightBackground,
      onSurface: lightOnSurface,
      onBackground: lightOnBackground,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 56,
        fontWeight: FontWeight.bold,
        color: lightOnBackground,
      ),
      displayMedium: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w600,
        color: lightOnBackground,
      ),
      headlineLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: lightOnBackground,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        color: lightOnBackground,
        height: 1.6,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        color: lightOnBackground,
        height: 1.5,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: darkPrimary,
    scaffoldBackgroundColor: darkBackground,
    colorScheme: const ColorScheme.dark(
      primary: darkPrimary,
      secondary: darkSecondary,
      surface: darkSurface,
      background: darkBackground,
      onSurface: darkOnSurface,
      onBackground: darkOnBackground,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 56,
        fontWeight: FontWeight.bold,
        color: darkOnBackground,
      ),
      displayMedium: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w600,
        color: darkOnBackground,
      ),
      headlineLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: darkOnBackground,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        color: darkOnBackground,
        height: 1.6,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        color: darkOnBackground,
        height: 1.5,
      ),
    ),
  );

  // Glass morphism decoration
  static BoxDecoration glassDecoration(bool isDark, {double borderRadius = 15}) {
    return BoxDecoration(
      color: isDark ? glassDark : glassLight,
      borderRadius: BorderRadius.circular(borderRadius),
      border: Border.all(
        color: isDark ? glassBorderDark : glassBorderLight,
        width: 1,
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(isDark ? 0.3 : 0.1),
          blurRadius: 20,
          offset: const Offset(0, 10),
        ),
      ],
    );
  }

  // Navigation bar glass decoration
  static BoxDecoration navBarGlassDecoration(bool isDark) {
    return BoxDecoration(
      color: isDark ? glassDark : glassLight,
      border: Border(
        bottom: BorderSide(
          color: isDark ? glassBorderDark : glassBorderLight,
          width: 1,
        ),
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(isDark ? 0.2 : 0.05),
          blurRadius: 10,
          offset: const Offset(0, 2),
        ),
      ],
    );
  }

  // Section background decoration
  static BoxDecoration sectionDecoration(bool isDark, {bool hasGradient = true}) {
    if (hasGradient) {
      return BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: isDark 
            ? [const Color(0xFF1C1C1E), const Color(0xFF2C2C2E)]
            : [const Color(0xFF667eea), const Color(0xFF764ba2)],
        ),
      );
    } else {
      return BoxDecoration(
        color: isDark ? darkSurface : lightSurface,
      );
    }
  }

  // Button glass decoration
  static BoxDecoration buttonGlassDecoration(bool isDark, {bool isPrimary = false}) {
    return BoxDecoration(
      color: isPrimary 
        ? (isDark ? darkPrimary : lightPrimary)
        : (isDark ? glassDark : glassLight),
      borderRadius: BorderRadius.circular(25),
      border: Border.all(
        color: isPrimary 
          ? Colors.transparent
          : (isDark ? glassBorderDark : glassBorderLight),
        width: 1,
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(isDark ? 0.3 : 0.1),
          blurRadius: 15,
          offset: const Offset(0, 5),
        ),
      ],
    );
  }

  // Get text color based on theme
  static Color getTextColor(BuildContext context, {bool isOnSurface = true}) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isOnSurface 
      ? (isDark ? darkOnSurface : lightOnSurface)
      : (isDark ? darkOnBackground : lightOnBackground);
  }

  // Get surface color based on theme
  static Color getSurfaceColor(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark ? darkSurface : lightSurface;
  }
}