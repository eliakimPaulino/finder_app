import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class KBottomSheetTheme {
  KBottomSheetTheme._(); // Construtor privado para evitar instanciação

  // Tema claro para BottomSheet
  static BottomSheetThemeData lightBottomSheetTheme = BottomSheetThemeData(
    showDragHandle: true, // Exibe a alça de arrastar
    backgroundColor: KColors.white, // Cor de fundo do BottomSheet
    modalBackgroundColor: KColors.white, // Cor de fundo do modal BottomSheet
    constraints: const BoxConstraints(minWidth: double.infinity), // Largura mínima
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)), // Formato com bordas arredondadas
  );

  // Tema escuro para BottomSheet
  static BottomSheetThemeData darkBottomSheetTheme = BottomSheetThemeData(
    showDragHandle: true, // Exibe a alça de arrastar
    backgroundColor: KColors.black, // Cor de fundo do BottomSheet
    modalBackgroundColor: KColors.black, // Cor de fundo do modal BottomSheet
    constraints: const BoxConstraints(minWidth: double.infinity), // Largura mínima
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)), // Formato com bordas arredondadas
  );
}
