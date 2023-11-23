import 'package:calculo_imc/config/color_schemes.g.dart';
import 'package:flutter/material.dart';

TextTheme lightTextSchemes = TextTheme(
  labelMedium: TextStyle(color: lightColorScheme.onSecondaryContainer),
  headlineSmall: TextStyle(color: lightColorScheme.onPrimary),
  headlineMedium: TextStyle(color: lightColorScheme.onSecondaryContainer),
  labelLarge: TextStyle(color: lightColorScheme.onPrimary),
);
TextTheme darkTextSchemes = TextTheme(
  labelMedium: TextStyle(color: darkColorScheme.onSecondaryContainer),
  headlineSmall: TextStyle(color: darkColorScheme.onPrimary),
  headlineMedium: TextStyle(color: darkColorScheme.onSecondaryContainer),
  labelLarge: TextStyle(color: darkColorScheme.onPrimary),
);
