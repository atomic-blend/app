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
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xFF004881),
      onPrimary: Color(0xFFE8F3FF),
      secondary: Color(0xFF006875),
      onSecondary: Color(0xFFEDFCFF),
      tertiary: Color(0xFF673AB7),
      onTertiary: Color(0xFFF5EFFF),
      error: Color(0xFFBA1A1A),
      onError: Color(0xFFFFDAD6),
      surface: Color(0xFFF2F2F2),
      surfaceContainer: Colors.white,
      primaryContainer: Color(0xFFE8F3FF),
      onSurface: Colors.black,
    ),
    colors: const FlexSchemeColor(
      // Custom colors
      primary: Color(0xFF004881),
      primaryContainer: Color(0xFFE8F3FF),
      primaryLightRef: Color(0xFF004881),
      secondary: Color(0xFF673AB7),
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
    textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontFamily: 'SpaceGrotesk', fontSize: 88.4, color: Colors.black),
      displayMedium: TextStyle(
          fontFamily: 'SpaceGrotesk', fontSize: 50.5, color: Colors.black),
      displaySmall: TextStyle(
          fontFamily: 'SpaceGrotesk', fontSize: 37.9, color: Colors.black),
      headlineLarge: TextStyle(
          fontFamily: 'SpaceGrotesk', fontSize: 28.4, color: Colors.black),
      headlineMedium: TextStyle(
          fontFamily: 'SpaceGrotesk', fontSize: 21.3, color: Colors.black),
      headlineSmall: TextStyle(
          fontFamily: 'SpaceGrotesk', fontSize: 16, color: Colors.black),
      titleLarge: TextStyle(
          fontFamily: 'SpaceGrotesk',
          fontSize: 33.9,
          color: Colors.black,
          fontWeight: FontWeight.w300),
      titleMedium: TextStyle(
          fontFamily: 'SpaceGrotesk',
          fontSize: 24,
          color: Colors.black,
          fontWeight: FontWeight.w300),
      titleSmall: TextStyle(
          fontFamily: 'SpaceGrotesk',
          fontSize: 17,
          color: Colors.black,
          fontWeight: FontWeight.w300),
      bodyLarge:
          TextStyle(fontFamily: 'Nunito', fontSize: 17, color: Colors.black),
      bodyMedium:
          TextStyle(fontFamily: 'Nunito', fontSize: 13.5, color: Colors.black),
      bodySmall:
          TextStyle(fontFamily: 'Nunito', fontSize: 11, color: Colors.black),
      labelLarge:
          TextStyle(fontFamily: 'Nunito', fontSize: 17, color: Colors.black),
      labelMedium:
          TextStyle(fontFamily: 'Nunito', fontSize: 13.5, color: Colors.black),
      labelSmall:
          TextStyle(fontFamily: 'Nunito', fontSize: 11, color: Colors.black),
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    cupertinoOverrideTheme: const CupertinoThemeData(applyThemeToAll: true),
  );
  // The defined dark theme.
  static ThemeData dark = FlexThemeData.dark(
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xFF004881),
      onPrimary: Color(0xFFE8F3FF),
      secondary: Color(0xFF673AB7),
      onSecondary: Color(0xFFF5EFFF),
      error: Color(0xFFBA1A1A),
      onError: Color(0xFFFFDAD6),
      surface: Color(0xFF181818),
      surfaceContainer: Colors.black,
      onSurface: Colors.white,
    ),
    colors: const FlexSchemeColor(
      // Custom colors
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
    textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontFamily: 'SpaceGrotesk', fontSize: 88.4, color: Colors.white),
      displayMedium: TextStyle(
          fontFamily: 'SpaceGrotesk', fontSize: 50.5, color: Colors.white),
      displaySmall: TextStyle(
          fontFamily: 'SpaceGrotesk', fontSize: 37.9, color: Colors.white),
      headlineLarge: TextStyle(
          fontFamily: 'SpaceGrotesk', fontSize: 28.4, color: Colors.white),
      headlineMedium: TextStyle(
          fontFamily: 'SpaceGrotesk', fontSize: 21.3, color: Colors.white),
      headlineSmall: TextStyle(
          fontFamily: 'SpaceGrotesk', fontSize: 16, color: Colors.white),
      titleLarge: TextStyle(
          fontFamily: 'SpaceGrotesk',
          fontSize: 33.9,
          color: Colors.white,
          fontWeight: FontWeight.w300),
      titleMedium: TextStyle(
          fontFamily: 'SpaceGrotesk',
          fontSize: 24,
          color: Colors.white,
          fontWeight: FontWeight.w300),
      titleSmall: TextStyle(
          fontFamily: 'SpaceGrotesk',
          fontSize: 17,
          color: Colors.white,
          fontWeight: FontWeight.w300),
      bodyLarge:
          TextStyle(fontFamily: 'Nunito', fontSize: 17, color: Colors.white),
      bodyMedium:
          TextStyle(fontFamily: 'Nunito', fontSize: 13.5, color: Colors.white),
      bodySmall:
          TextStyle(fontFamily: 'Nunito', fontSize: 11, color: Colors.white),
      labelLarge:
          TextStyle(fontFamily: 'Nunito', fontSize: 17, color: Colors.white),
      labelMedium:
          TextStyle(fontFamily: 'Nunito', fontSize: 13.5, color: Colors.white),
      labelSmall:
          TextStyle(fontFamily: 'Nunito', fontSize: 11, color: Colors.white),
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
