import 'package:flutter/material.dart';
import '../../constants/finder_app_colors.dart';
import '../../constants/sizes.dart';

class KAppBarTheme{
  KAppBarTheme._();

  /// Tema customizável para AppBar Claro
  /// Este tema é usado para o modo claro do aplicativo.
  /// Define a aparência da AppBar, incluindo cor de fundo, tema dos ícones e estilo do texto do título.
  static const lightAppBarTheme = AppBarTheme(
    elevation: 0, // Sem sombra
    centerTitle: false, // Título não centralizado
    scrolledUnderElevation: 0, // Sem sombra ao rolar
    backgroundColor: KColors.accent, // Cor de fundo transparente
    surfaceTintColor: Colors.transparent, // Sem cor de superfície
    iconTheme: IconThemeData(color: KColors.black, size: KSizes.iconMd), // Cor e tamanho dos ícones
    actionsIconTheme: IconThemeData(color: KColors.black, size: KSizes.iconMd), // Cor e tamanho dos ícones de ação
    titleTextStyle: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600, color: KColors.black), // Estilo do texto do título
  );

  /// Tema para AppBar Escuro
  /// Este tema é usado para a AppBar no modo escuro.
  /// Define a cor de fundo como transparente, ícones brancos e título em branco.
  static const darkAppBarTheme = AppBarTheme(
    elevation: 0, // Sem sombra
    centerTitle: false, // Título não centralizado
    scrolledUnderElevation: 0, // Sem sombra ao rolar
    backgroundColor: KColors.primary, // Cor de fundo transparente
    surfaceTintColor: Colors.transparent, // Sem cor de superfície
    iconTheme: IconThemeData(color: KColors.white, size: KSizes.iconMd), // Cor e tamanho dos ícones
    actionsIconTheme: IconThemeData(color: KColors.white, size: KSizes.iconMd), // Cor e tamanho dos ícones de ação
    titleTextStyle: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600, color: KColors.white), // Estilo do texto do título
  );
}