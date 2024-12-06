import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

// // Define headline5 as part of the TextTheme to avoid errors in flutter_map
// extension LegacyTextTheme on TextTheme {
//   TextStyle? get headline5 => titleLarge;
//}

class AppTheme {
  // Tema claro
  static ThemeData lightTheme = FlexThemeData.light(
    colors: const FlexSchemeColor(
      // Custom colors
      primary: Color(0xFF001A72),
      primaryContainer: Color(0xFF90ADF0),
      primaryLightRef: Color(0xFF001A72),
      secondary: Color(0xFF00A74A),
      secondaryContainer: Color(0xFFB4F3A4),
      secondaryLightRef: Color(0xFF00A74A),
      tertiary: Color(0xFFFFD700),
      tertiaryContainer: Color(0xFFFFF499),
      tertiaryLightRef: Color(0xFFFFD700),
      appBarColor: Color(0xFFB4F3A4),
      error: Color(0xFFE40002),
      errorContainer: Color(0xFFE17B84),
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
    textTheme: ThemeData.light().textTheme.copyWith(
          headlineSmall: ThemeData.light().textTheme.titleLarge,
          //headline5: ThemeData.light().textTheme.titleLarge,
          // Define headline5 here
        ),
    //cupertinoOverrideTheme: const CupertinoThemeData(applyThemeToAll: true),
  );

  // Tema oscuro
  static ThemeData darkTheme = FlexThemeData.dark(
    colors: const FlexSchemeColor(
      // Custom colors
      primary: Color(0xFF9FC9FF),
      primaryContainer: Color(0xFF00325B),
      primaryLightRef: Color(0xFF001A72),
      secondary: Color(0xFFFFB59D),
      secondaryContainer: Color(0xFF872100),
      secondaryLightRef: Color(0xFF00A74A),
      tertiary: Color(0xFF86D2E1),
      tertiaryContainer: Color(0xFF004E59),
      tertiaryLightRef: Color(0xFFFFD700),
      appBarColor: Color(0xFFB4F3A4),
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
    textTheme: ThemeData.dark().textTheme.copyWith(
          headlineSmall: ThemeData.dark().textTheme.titleLarge,
          //headline5: ThemeData.dark().textTheme.titleLarge, // Define headline5 here
        ),
    //cupertinoOverrideTheme: const CupertinoThemeData(applyThemeToAll: true),
  );

  // static ThemeMode themeMode = ThemeMode.system; En caso de querer usar el tema por defecto del teléfono ;)
}
