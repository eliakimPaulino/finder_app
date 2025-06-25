import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/sizes.dart';

/// Classe customizada para temas de Checkbox Claro & Escuro
class KCheckboxTheme {
  KCheckboxTheme._(); // Para evitar criação de instâncias

  /// Tema customizável para Checkbox Claro
  static CheckboxThemeData lightCheckboxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(KSizes.xs)), // Formato do checkbox
    checkColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return KColors.white; // Cor do ícone quando selecionado
      } else {
        return KColors.black; // Cor do ícone quando não selecionado
      }
    }),
    fillColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return KColors.primary; // Cor de fundo quando selecionado
      } else {
        return Colors.transparent; // Cor de fundo quando não selecionado
      }
    }),
  );

  /// Tema customizável para Checkbox Escuro
  static CheckboxThemeData darkCheckboxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(KSizes.xs)), // Formato do checkbox
    checkColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return KColors.white; // Cor do ícone quando selecionado
      } else {
        return KColors.black; // Cor do ícone quando não selecionado
      }
    }),
    fillColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return KColors.primary; // Cor de fundo quando selecionado
      } else {
        return Colors.transparent; // Cor de fundo quando não selecionado
      }
    }),
  );
}
