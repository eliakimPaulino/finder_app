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
  static const Color textInformationSoft = Color(0xFF20A5FA); // Texto informativo suave
  static const Color textInformationMedium = Color(0xFF2085FA); // Texto informativo médio
  static const Color textInformationPrimary = Color(0xFF2065FA); // Texto informativo primário

  // Cores de fundo
  static const Color lightBackground = Color(0xFFF3F5F7); // Fundo claro
  static const Color darkBackground = Color(0xFF252525); // Fundo escuro
  static const Color primaryBackground = Color(0xFFF3F5FF); // Fundo principal

  // Cores para containers de fundo
  static const Color lightContainer = Color(0xFFEFEFF1); // Container claro
  static Color darkContainer = Color(0xFF2C2C2C); // Container escuro

  // Cores de botões
  static const Color buttonPrimary = Color(0xFF4b68ff); // Botão primário
  static const Color buttonSecondary = Color(0xFF6C757D); // Botão secundário
  static const Color buttonDisabled = Color(0xFFC4C4C4); // Botão desabilitado

  // Cores de borda
  static const Color borderPrimary = Color(0xFFD9D9D9); // Borda primária
  static const Color borderSecondary = Color(0xFFE6E6E6); // Borda secundária

// Cores para estados de erro (ex: falhas, mensagens críticas)
static const Color errorPrimary = Color(0xFFD32F2F); // Cor de destaque para erros importantes
static const Color errorMedium  = Color(0xFFEF4444); // Usada em textos ou ícones de erro
static const Color errorSoft    = Color(0xFFF87171); // Plano de fundo suave para alertas de erro

// Cores para estados de sucesso (ex: ações concluídas, confirmações)
static const Color successPrimary = Color(0xFF22C55E); // Cor principal para indicar sucesso
static const Color successMedium  = Color(0xFF34D399); // Texto ou ícone de sucesso
static const Color successSoft    = Color(0xFF4ADE80); // Fundo suave para mensagens positivas

// Cores para avisos (ex: ações arriscadas, alertas de atenção)
static const Color warningPrimary = Color(0xFFFBBF24); // Cor principal para avisos críticos
static const Color warningMedium  = Color(0xFFFCD34D); // Ícones ou mensagens de atenção
static const Color warningSoft    = Color(0xFFFDE68A); // Fundo suave para áreas de aviso

// Cores para informações (ex: dicas, status neutros)
static const Color infoPrimary = Color(0xFF2563EB); // Cor principal para mensagens informativas
static const Color infoMedium  = Color(0xFF3D82F6); // Usada em texto ou ícone de informação
static const Color infoSoft    = Color(0xFF60A5FA); // Fundo leve para blocos informativos

// Cores neutras (ex: separadores, elementos de interface neutros)
static const Color neutralPrimary = Color(0xFFBCBCBC); // Elementos neutros de destaque (ex: bordas)
static const Color neutralMedium  = Color(0xFFBCC4D0); // Usado em textos secundários ou linhas
static const Color neutralSoft    = Color(0xFFE5E7EB); // Fundo neutro ou áreas de descanso visual
static const Color black          = Color(0xFF232323); // Preto profundo — ideal para títulos ou texto em destaque
static const Color darkerGrey     = Color(0xFF4F4F4F); // Cinza muito escuro — usado para texto principal em fundos claros
static const Color darkGrey       = Color(0xFF939393); // Cinza escuro — ótimo para textos secundários ou desativados
static const Color grey           = Color(0xFFE0E0E0); // Cinza padrão — usado em divisores, bordas ou fundos neutros
static const Color softGrey       = Color(0xFFF4F4F4); // Cinza suave — ideal como plano de fundo de listas ou cards
static const Color lightGrey      = Color(0xFFF9F9F9); // Cinza muito claro — usado como background base ou containers
static const Color white          = Color(0xFFFFFFFF); // Branco puro — usado para superfícies principais e contraste máximo
}
