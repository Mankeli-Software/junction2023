// ignore_for_file: avoid_redundant_argument_values

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// {@template app_theme}
/// A class that contains all the theme data for the app.
/// See this for a typescale generator: https://m2.material.io/design/typography/the-type-system.html#type-scale
/// {@endtemplate}
class AppTheme extends ChangeNotifier {
  /// {@macro app_theme}
  late AppTheme dynamicTheme;

  /// {@macro app_theme}
  void initialize() {
    PlatformDispatcher.instance.onPlatformBrightnessChanged = _update;

    _update();
  }

  void _update() {
    final brightness = PlatformDispatcher.instance.platformBrightness;
    dynamicTheme = brightness == Brightness.dark ? AppThemeDark() : AppThemeLight();

    notifyListeners();
  }

  /// {@macro app_theme}
  Color get primaryColor => throw UnimplementedError();

  /// {@macro app_theme}
  Color get onPrimaryColor => throw UnimplementedError();

  /// {@macro app_theme}
  Color get secondaryColor => throw UnimplementedError();

  /// {@macro app_theme}
  Color get onSecondaryColor => throw UnimplementedError();

  /// {@macro app_theme}
  Color get backgroundColor => throw UnimplementedError();

  /// {@macro app_theme}
  Color get onBackgroundColor => throw UnimplementedError();

  /// {@macro app_theme}
  Color get containerColor => throw UnimplementedError();

  /// {@macro app_theme}
  Color get onContainerColor => throw UnimplementedError();

  /// {@macro app_theme}
  Color get textColor => throw UnimplementedError();

  /// {@macro app_theme}
  Color get errorColor => throw UnimplementedError();

  /// {@macro app_theme}
  Color get successColor => throw UnimplementedError();

  /// {@macro app_theme}
  Brightness get brightness => throw UnimplementedError();

  /// {@macro app_theme}
  TextStyle get displayLarge => GoogleFonts.montserrat(
        color: textColor,
        fontSize: 97,
        fontWeight: FontWeight.w300,
        letterSpacing: -1.5,
      );

  /// {@macro app_theme}
  TextStyle get displayMedium => GoogleFonts.montserrat(
        color: textColor,
        fontSize: 61,
        fontWeight: FontWeight.w300,
        letterSpacing: -0.5,
      );

  /// {@macro app_theme}
  TextStyle get displaySmall => GoogleFonts.montserrat(
        color: textColor,
        fontSize: 48,
        fontWeight: FontWeight.w400,
      );

  /// {@macro app_theme}
  TextStyle get headlineMedium => GoogleFonts.montserrat(
        color: textColor,
        fontSize: 34,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
      );

  /// {@macro app_theme}
  TextStyle get headlineSmall => GoogleFonts.montserrat(
        color: textColor,
        fontSize: 24,
        fontWeight: FontWeight.w400,
      );

  /// {@macro app_theme}
  TextStyle get titleLarge => GoogleFonts.montserrat(
        color: textColor,
        fontSize: 20,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.15,
      );

  /// {@macro app_theme}
  TextStyle get titleMedium => GoogleFonts.montserrat(
        color: textColor,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.15,
      );

  /// {@macro app_theme}
  TextStyle get titleSmall => GoogleFonts.montserrat(
        color: textColor,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
      );

  /// {@macro app_theme}
  TextStyle get bodyLarge => GoogleFonts.rubik(
        color: textColor,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
      );

  /// {@macro app_theme}
  TextStyle get bodyMedium => GoogleFonts.rubik(
        color: textColor,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
      );

  /// {@macro app_theme}
  TextStyle get bodySmall => GoogleFonts.rubik(
        color: textColor,
        fontSize: 12,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.4,
      );

  /// {@macro app_theme}
  TextStyle get labelLarge => GoogleFonts.rubik(
        color: textColor,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 1.25,
      );

  /// {@macro app_theme}
  TextStyle get labelSmall => GoogleFonts.rubik(
        color: textColor,
        fontSize: 10,
        fontWeight: FontWeight.w400,
        letterSpacing: 1.5,
      );

  /// {@macro app_theme}
  ThemeData get themeData => ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryColor,
          primary: primaryColor,
          secondary: secondaryColor,
          background: backgroundColor,
          primaryContainer: containerColor,
          brightness: brightness,
          onBackground: onBackgroundColor,
          onPrimary: onPrimaryColor,
          onSecondary: onSecondaryColor,
          onPrimaryContainer: onContainerColor,
        ),
        primaryTextTheme: TextTheme(
          displayLarge: displayLarge,
          displayMedium: displayMedium,
          displaySmall: displaySmall,
          headlineMedium: headlineMedium,
          headlineSmall: headlineSmall,
          titleLarge: titleLarge,
          titleMedium: titleMedium,
          titleSmall: titleSmall,
          bodyLarge: bodyLarge,
          bodyMedium: bodyMedium,
          bodySmall: bodySmall,
          labelLarge: labelLarge,
          labelSmall: labelSmall,
        ),
        textTheme: TextTheme(
          displayLarge: displayLarge,
          displayMedium: displayMedium,
          displaySmall: displaySmall,
          headlineMedium: headlineMedium,
          headlineSmall: headlineSmall,
          titleLarge: titleLarge,
          titleMedium: titleMedium,
          titleSmall: titleSmall,
          bodyLarge: bodyLarge,
          bodyMedium: bodyMedium,
          bodySmall: bodySmall,
          labelLarge: labelLarge,
          labelSmall: labelSmall,
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(8),
            ),
            borderSide: BorderSide(
              color: containerColor.withOpacity(0.5),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(8),
            ),
            borderSide: BorderSide(
              color: containerColor,
            ),
          ),
          errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
            borderSide: BorderSide(
              color: Colors.red,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(8),
            ),
            borderSide: BorderSide(
              color: errorColor,
            ),
          ),
          labelStyle: labelLarge,
          hintStyle: bodyLarge.copyWith(
            color: textColor.withOpacity(0.8),
          ),
          errorStyle: bodyLarge.copyWith(color: errorColor),
        ),
      );
}

/// {@macro app_theme}
///
/// A light colored implementation of [AppTheme].
class AppThemeLight extends AppTheme {
  @override
  Brightness get brightness => Brightness.light;

  @override
  Color get primaryColor => const Color(0xFF00677C);

  @override
  Color get onPrimaryColor => const Color(0xFFFFFFFF);

  @override
  Color get secondaryColor => const Color(0xFF006E27);

  @override
  Color get onSecondaryColor => const Color(0xFFFFFFFF);

  @override
  Color get backgroundColor => const Color(0xFFFBFCFE);

  @override
  Color get onBackgroundColor => const Color(0xFF191C1D);

  @override
  Color get containerColor => const Color(0xFFdde7eb);

  @override
  Color get onContainerColor => const Color(0xFF001F27);

  @override
  Color get textColor => const Color(0xFF191C1D);

  @override
  Color get errorColor => const Color(0xFFAA2828);

  @override
  Color get successColor => const Color(0xFF238821);
}

/// {@macro app_theme}
///
/// A dark colored implementation of [AppTheme].
class AppThemeDark extends AppTheme {
  @override
  Brightness get brightness => Brightness.dark;

  @override
  Color get primaryColor => const Color(0xFF33D7FE);

  @override
  Color get onPrimaryColor => const Color(0xFF003642);

  @override
  Color get secondaryColor => const Color(0xFF64DF76);

  @override
  Color get onSecondaryColor => const Color(0xFF003911);

  @override
  Color get backgroundColor => const Color(0xFF191C1D);

  @override
  Color get onBackgroundColor => const Color(0xFFE1E3E4);

  @override // TODO(JTorkk): Might be bad color in dark mode
  Color get containerColor => const Color(0xFF004E5E);

  @override
  Color get onContainerColor => const Color(0xFFB1ECFF);

  @override
  Color get textColor => const Color(0xFFE1E3E4);

  @override
  Color get errorColor => const Color(0xFFAA2828);

  @override
  Color get successColor => const Color(0xFF238821);
}
