import 'package:call4help/core/color/light_color.dart';
import 'package:call4help/core/size/border_sizes.dart';
import 'package:flutter/material.dart';

class LightTheme {
  static ThemeData get theme => ThemeData.light(useMaterial3: true).copyWith(
    dividerColor: LightColor.dividerColor,
    dividerTheme: DividerThemeData(color: LightColor.dividerColor, space: 0),
    primaryColor: LightColor.primaryColor,
    switchTheme: SwitchThemeData(
      trackColor: WidgetStateProperty.resolveWith(
        (states) => states.contains(WidgetState.selected)
            ? LightColor.primaryColor
            : LightColor.textGreyColor,
      ),
      trackOutlineColor: WidgetStatePropertyAll(LightColor.secondaryColor),
      thumbColor: WidgetStatePropertyAll(LightColor.secondaryColor),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: LightColor.primaryColor,
      primaryContainer: LightColor.containerColor,
      secondary: LightColor.secondaryColor,
      error: LightColor.errorColor,
      outlineVariant: LightColor.blueColor,
      onSecondary: LightColor.subTextColor,
      onSurface: LightColor.textColor,
      onInverseSurface: LightColor.cardColor,
      inversePrimary: LightColor.blackColor,
      inverseSurface: LightColor.cardGreyColor,
      onSecondaryContainer: LightColor.cardColor2,
      secondaryContainer: LightColor.cardColor3,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: LightColor.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderSizes.buttonBorderRadius,
        ),
        textStyle: TextStyle(
          color: LightColor.elevatedButtonTextColor,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        minimumSize: Size(double.infinity, 50),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderSizes.buttonBorderRadius,
          side: BorderSide(color: LightColor.primaryColor),
        ),
        textStyle: TextStyle(
          color: LightColor.blackColor,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        minimumSize: Size(double.infinity, 50),
      ),
    ),
    typography: Typography(black: TextTheme()),
    textTheme: ThemeData.light().textTheme.apply(
      fontFamily: 'Poppins',
      bodyColor: LightColor.textColor,
      displayColor: LightColor.blackColor,
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: BorderSide(color: LightColor.textGreyColor, width: 1),
        borderRadius: BorderSizes.buttonBorderRadius,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: LightColor.textGreyColor, width: 1),
        borderRadius: BorderSizes.buttonBorderRadius,
      ),
      filled: true,
      fillColor: LightColor.secondaryColor,
    ),
    scaffoldBackgroundColor: Colors.red,
  );
}

extension InputDecorationExtension on InputDecoration {
  static InputDecoration get defaultStyle => InputDecoration(
    filled: true,
    fillColor: LightColor.secondaryColor,
    border: OutlineInputBorder(
      borderRadius: BorderSizes.buttonBorderRadius,
      borderSide: BorderSide(color: LightColor.textGreyColor, width: 1),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderSizes.buttonBorderRadius,
      borderSide: BorderSide(color: LightColor.textGreyColor, width: 1),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderSizes.buttonBorderRadius,
      borderSide: BorderSide(color: LightColor.textGreyColor, width: 1),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderSizes.buttonBorderRadius,
      borderSide: BorderSide(color: LightColor.textGreyColor, width: 1),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderSizes.buttonBorderRadius,
      borderSide: BorderSide(color: LightColor.errorColor, width: 1),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderSizes.buttonBorderRadius,
      borderSide: BorderSide(color: LightColor.errorColor, width: 1),
    ),
    hintStyle: TextStyle(color: LightColor.textGreyColor),
    labelStyle: TextStyle(color: LightColor.textGreyColor),
    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
  );

  InputDecoration applyFm() {
    return copyWith(
      filled: filled ?? defaultStyle.filled,
      fillColor: fillColor ?? defaultStyle.fillColor,
      border: border ?? defaultStyle.border,
      enabledBorder: enabledBorder ?? defaultStyle.enabledBorder,
      focusedBorder: focusedBorder ?? defaultStyle.focusedBorder,
      disabledBorder: disabledBorder ?? defaultStyle.disabledBorder,
      errorBorder: errorBorder ?? defaultStyle.errorBorder,
      focusedErrorBorder: focusedErrorBorder ?? defaultStyle.focusedErrorBorder,
      hintStyle: hintStyle ?? defaultStyle.hintStyle,
      labelStyle: labelStyle ?? defaultStyle.labelStyle,
      contentPadding: contentPadding ?? defaultStyle.contentPadding,
    );
  }
}
