// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class KColors {
  // Cores principais do tema do app
  static const Color primary = Color(0xFF4b68ff); // Cor primária
  static const Color secondary = Color(0xFFFFE24B); // Cor secundária
  static const Color accent = Color(0xFFb0c7ff); // Cor de destaque/acento

  // Cores Gradientes
  static const Gradient linearGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF4b68ff), Color(0xFFFFE24B), Color(0xFFb0c7ff)],
  );

  // Cores para textos
  static const Color textPrimary = Color(0xFF333333); // Texto principal
  static const Color textSecondary = Color(0xFF6C757D); // Texto secundário
  static const Color textWhite = Colors.white; // Texto branco

  // Cores de fundo
  static const Color light = Color(0xFFF6F6F6); // Fundo claro
  static const Color dark = Color(0xFF272727); // Fundo escuro
  static const Color primaryBackground = Color(0xFFF3F5FF); // Fundo principal

  // Cores para containers de fundo
  static const Color lightContainer = Color(0xFFF6F6F6); // Container claro
  static Color darkContainer = KColors.white.withOpacity(
    0.1,
  ); // Container escuro com opacidade

  // Cores de botões
  static const Color buttonPrimary = Color(0xFF4b68ff); // Botão primário
  static const Color buttonSecondary = Color(0xFF6C757D); // Botão secundário
  static const Color buttonDisabled = Color(0xFFC4C4C4); // Botão desabilitado

  // Cores de borda
  static const Color borderPrimary = Color(0xFFD9D9D9); // Borda primária
  static const Color borderSecondary = Color(0xFFE6E6E6); // Borda secundária

  // Cores para estados de erro e validação
  static const Color error = Color(0xFFD32F2F); // Erro
  static const Color success = Color(0xFF388E3C); // Sucesso
  static const Color warning = Color(0xFFF57C00); // Aviso
  static const Color info = Color(0xFF1976D2); // Informação

  // Tons neutros
  static const Color black = Color(0xFF232323); // Preto
  static const Color darkerGrey = Color(0xFF4F4F4F); // Cinza mais escuro
  static const Color darkGrey = Color(0xFF939393); // Cinza escuro
  static const Color grey = Color(0xFFE0E0E0); // Cinza
  static const Color softGrey = Color(0xFFF4F4F4); // Cinza suave
  static const Color lightGrey = Color(0xFFF9F9F9); // Cinza claro
  static const Color white = Color(0xFFFFFFFF); // Branco
}
