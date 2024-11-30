// ignore_for_file: file_names

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  // Tema claro
  static ThemeData lightTheme = FlexThemeData.light(
    scheme: FlexScheme.blackWhite,
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
    //cupertinoOverrideTheme: const CupertinoThemeData(applyThemeToAll: true),
  );

  // Tema oscuro
  static ThemeData darkTheme = FlexThemeData.dark(
    scheme: FlexScheme.blackWhite,
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
    //cupertinoOverrideTheme: const CupertinoThemeData(applyThemeToAll: true),
  );

  // static ThemeMode themeMode = ThemeMode.system; En caso de querer usar el tema por defecto del teléfono ;)
}
