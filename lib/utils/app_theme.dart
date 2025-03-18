import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
/// The [AppTheme] defines light and dark themes for the app.
///
/// Theme setup for FlexColorScheme package v8.
/// Use same major flex_color_scheme package version. If you use a
/// lower minor version, some properties may not be supported.
/// In that case, remove them after copying this theme to your
/// app or upgrade package to version 8.1.1.
///
/// Use in [MaterialApp] like this:
///
/// MaterialApp(
///   theme: AppTheme.light,
///   darkTheme: AppTheme.dark,
/// );
abstract final class AppTheme {
  // The defined light theme.
  static ThemeData light = FlexThemeData.light(
  colors: const FlexSchemeColor( // Custom colors
    primary: Color(0xFF004881),
    primaryContainer: Color(0xFFF9F9F9),
    primaryLightRef: Color(0xFF004881),
    secondary: Color(0xFF4C9BBA),
    secondaryContainer: Color(0xFFF5EFFF),
    secondaryLightRef: Color(0xFF4C9BBA),
    tertiary: Color(0xFF006875),
    tertiaryContainer: Color(0xFFEDFCFF),
    tertiaryLightRef: Color(0xFF006875),
    appBarColor: Color(0xFFDFF4FF),
    error: Color(0xFFBA1A1A),
    errorContainer: Color(0xFFFFDAD6),
  ),
  subThemesData: const FlexSubThemesData(
    interactionEffects: true,
    tintedDisabledControls: true,
    useM2StyleDividerInM3: true,
    inputDecoratorIsFilled: true,
    inputDecoratorBorderType: FlexInputBorderType.outline,
    alignedDropdown: true,
    navigationRailUseIndicator: true,
    navigationRailLabelType: NavigationRailLabelType.all,
  ),
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
  cupertinoOverrideTheme: const CupertinoThemeData(applyThemeToAll: true),
  );
  // The defined dark theme.
  static ThemeData dark = FlexThemeData.dark(
  colors: const FlexSchemeColor( // Custom colors
    primary: Color(0xFF9FC9FF),
    primaryContainer: Color(0xFF00325B),
    primaryLightRef: Color(0xFF004881),
    secondary: Color(0xFFFFB59D),
    secondaryContainer: Color(0xFF872100),
    secondaryLightRef: Color(0xFF4C9BBA),
    tertiary: Color(0xFF86D2E1),
    tertiaryContainer: Color(0xFF004E59),
    tertiaryLightRef: Color(0xFF006875),
    appBarColor: Color(0xFFDFF4FF),
    error: Color(0xFFFFB4AB),
    errorContainer: Color(0xFF93000A),
  ),
  subThemesData: const FlexSubThemesData(
    interactionEffects: true,
    tintedDisabledControls: true,
    blendOnColors: true,
    useM2StyleDividerInM3: true,
    inputDecoratorIsFilled: true,
    inputDecoratorBorderType: FlexInputBorderType.outline,
    alignedDropdown: true,
    navigationRailUseIndicator: true,
    navigationRailLabelType: NavigationRailLabelType.all,
  ),
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
  cupertinoOverrideTheme: const CupertinoThemeData(applyThemeToAll: true),
  );
}
