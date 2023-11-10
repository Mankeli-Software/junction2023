import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:j_mp/resource/resource.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('AppTheme', () {
    group('AppThemeLight', () {
      late AppThemeLight light;

      setUp(() {
        light = AppThemeLight();
      });
      test('has a primary color', () {
        expect(light.primaryColor, isA<Color>());
      });
      test('has a secondary color', () {
        expect(light.secondaryColor, isA<Color>());
      });
      test('has a background color', () {
        expect(light.backgroundColor, isA<Color>());
      });
      test('has a container color', () {
        expect(light.containerColor, isA<Color>());
      });
      test('has a text color', () {
        expect(light.textColor, isA<Color>());
      });
      test('has ThemeData', () {
        expect(light.themeData, isA<ThemeData>());
      });
      test('brightness is light', () {
        expect(light.brightness, Brightness.light);
      });
    });

    group('AppThemeDark', () {
      late AppThemeDark dark;

      setUp(() {
        dark = AppThemeDark();
      });
      test('has a primary color', () {
        expect(dark.primaryColor, isA<Color>());
      });
      test('has a secondary color', () {
        expect(dark.secondaryColor, isA<Color>());
      });
      test('has a background color', () {
        expect(dark.backgroundColor, isA<Color>());
      });
      test('has a container color', () {
        expect(dark.containerColor, isA<Color>());
      });
      test('has a text color', () {
        expect(dark.textColor, isA<Color>());
      });
      test('has ThemeData', () {
        expect(dark.themeData, isA<ThemeData>());
      });
      test('brightness is dark', () {
        expect(dark.brightness, Brightness.dark);
      });
    });
  });
}
