// ignore_for_file: deprecated_member_use

import 'package:finder_app/core/constants/finder_app_colors.dart';
import 'package:flutter/material.dart';

class KChipTheme {
  KChipTheme._(); // Construtor privado para evitar instanciação

  // Tema claro para Chip
  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: KColors.grey.withOpacity(0.4), // Cor quando desabilitado
    labelStyle: const TextStyle(color: KColors.black), // Estilo do texto do chip
    selectedColor: KColors.primary, // Cor quando selecionado
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12), // Espaçamento interno
    checkmarkColor: KColors.white, // Cor do ícone de seleção
  );

  // Tema escuro para Chip
  static ChipThemeData darkChipTheme = const ChipThemeData(
    disabledColor: KColors.darkerGrey, // Cor quando desabilitado
    labelStyle: TextStyle(color: KColors.white), // Estilo do texto do chip
    selectedColor: KColors.primary, // Cor quando selecionado
    padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12), // Espaçamento interno
    checkmarkColor: KColors.white, // Cor do ícone de seleção
  );
}
