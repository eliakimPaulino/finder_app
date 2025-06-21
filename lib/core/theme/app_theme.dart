import 'package:finder_app/core/constants/finder_app_colors.dart';
import 'package:flutter/material.dart';

import 'custom_theme/appbar_theme.dart';
import 'custom_theme/bottom_sheet_theme.dart';
import 'custom_theme/checkbox_theme.dart';
import 'custom_theme/chip_theme.dart';
import 'custom_theme/outlined_button_theme.dart';
import 'custom_theme/text_field_theme.dart';
import 'custom_theme/text_theme.dart';

class AppTheme {
  AppTheme._(); /* Construtor privado para prevenir instanciação */

  /* 
    Esta classe é um singleton, então é usado um construtor privado para evitar que seja instanciada.
    Este é um padrão comum no Flutter para criar uma classe de tema que armazena os temas do app.
    A classe foi projetada para armazenar instâncias estáticas finais dos temas claro e escuro.
*/

  /*------------------ TEMA CLARO ------------------*/
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    textTheme: KTextTheme.lightTheme,
    chipTheme: KChipTheme.lightChipTheme,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: KAppBarTheme.lightAppBarTheme,
    checkboxTheme: KCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: KBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: KColors.accent,
        foregroundColor: KColors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
    ),
    outlinedButtonTheme: KOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: KTextFormFieldTheme.lightInputDecorationTheme,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: KColors.accent,
      foregroundColor: KColors.black,
      elevation: 4,
      shape: CircleBorder(),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: KColors.accent, // Cor do texto do botão
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ), // Estilo do texto
      ),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: KColors.accent,
      selectionColor: KColors.accent,
      selectionHandleColor: KColors.primary,
    ),
    listTileTheme: const ListTileThemeData(
      iconColor: KColors.black, // Cor dos ícones
      textColor: KColors.black, // Cor do texto
      tileColor: Colors.white, // Cor de fundo do tile
      selectedColor:
          KColors.accent, // Cor do texto/ícone quando selecionado
      selectedTileColor:
          KColors.accent, // Cor de fundo quando selecionado
    ),
  );

  /*----------------- TEMA ESCURO -----------------*/
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    textTheme: KTextTheme.darkTheme,
    chipTheme: KChipTheme.darkChipTheme,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: KAppBarTheme.darkAppBarTheme,
    checkboxTheme: KCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: KBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: KColors.primary,
        foregroundColor: KColors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
    ),
    outlinedButtonTheme: KOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: KTextFormFieldTheme.darkInputDecorationTheme,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: KColors.primary,
      foregroundColor: KColors.white,
      elevation: 4,
      shape: CircleBorder(),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: KColors.primary, // Cor do texto do botão
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ), // Estilo do texto
      ),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: KColors.primary,
      selectionColor: KColors.primary,
      selectionHandleColor: KColors.primary,
    ),
    listTileTheme: const ListTileThemeData(
      iconColor: KColors.white,
      textColor: KColors.white,
      tileColor: Colors.black,
      selectedColor: KColors.primary,
      selectedTileColor: KColors.primary,
    ),
  );
}
