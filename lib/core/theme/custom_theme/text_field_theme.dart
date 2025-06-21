// ignore_for_file: deprecated_member_use

import 'package:finder_app/core/constants/finder_app_colors.dart';
import 'package:flutter/material.dart';

import '../../constants/sizes.dart';

class KTextFormFieldTheme {
  KTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3, // Número máximo de linhas para mensagens de erro
    prefixIconColor: KColors.darkGrey, // Cor do ícone prefixo
    suffixIconColor: KColors.darkGrey, // Cor do ícone sufixo
    // constraints: const BoxConstraints.expand(height: KSizes.inputFieldHeight), // Restrições de altura do campo (comentado)
    labelStyle: const TextStyle().copyWith(fontSize: KSizes.fontSizeMd, color: KColors.black), // Estilo do rótulo
    hintStyle: const TextStyle().copyWith(fontSize: KSizes.fontSizeSm, color: KColors.black), // Estilo da dica
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal), // Estilo da mensagem de erro
    floatingLabelStyle: const TextStyle().copyWith(color: KColors.black.withOpacity(0.8)), // Estilo do rótulo flutuante
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(KSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: KColors.grey),
    ), // Borda padrão
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(KSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: KColors.grey),
    ), // Borda quando habilitado
    focusedBorder:const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(KSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: KColors.darkBackground),
    ), // Borda quando focado
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(KSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: KColors.warningPrimary),
    ), // Borda em caso de erro
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(KSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 2, color: KColors.warningMedium),
    ), // Borda em caso de erro e focado
  );

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 2, // Número máximo de linhas para mensagens de erro
    prefixIconColor: KColors.darkGrey, // Cor do ícone prefixo
    suffixIconColor: KColors.darkGrey, // Cor do ícone sufixo
    // constraints: const BoxConstraints.expand(height: KSizes.inputFieldHeight), // Restrições de altura do campo (comentado)
    labelStyle: const TextStyle().copyWith(fontSize: KSizes.fontSizeMd, color: KColors.white), // Estilo do rótulo
    hintStyle: const TextStyle().copyWith(fontSize: KSizes.fontSizeSm, color: KColors.white), // Estilo da dica
    floatingLabelStyle: const TextStyle().copyWith(color: KColors.white.withOpacity(0.8)), // Estilo do rótulo flutuante
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(KSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: KColors.darkGrey),
    ), // Borda padrão
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(KSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: KColors.darkGrey),
    ), // Borda quando habilitado
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(KSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: KColors.white),
    ), // Borda quando focado
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(KSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: KColors.warningPrimary),
    ), // Borda em caso de erro
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(KSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 2, color: KColors.warningMedium),
    ), // Borda em caso de erro e focado
  );
}
