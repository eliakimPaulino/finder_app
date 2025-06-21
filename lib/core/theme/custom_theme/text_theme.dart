import 'package:flutter/material.dart';

class KTextTheme {
  KTextTheme._(); // Construtor privado para prevenir instanciação

  static TextTheme lightTheme = TextTheme(

    /*---- HEADLINE: TITULOS GRANDES TOPO DE TELA ----*/
    headlineLarge: TextStyle().copyWith(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    headlineMedium: TextStyle().copyWith(
      fontSize: 24.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    headlineSmall: TextStyle().copyWith(
      fontSize: 16.0,
      fontWeight: FontWeight.w300,
      color: Colors.black,
    ),

    /* TITLE: TITULO MENOR, NOME DE SEÇÃO, TITULO DE CARD */
    titleLarge: TextStyle().copyWith(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: Colors.black87,
    ),
    titleMedium: TextStyle().copyWith(
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
      color: Colors.black54,
    ),
    titleSmall: TextStyle().copyWith(
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      color: Colors.black45,
    ),

    /* BODY: TEXTO PRINCIPAL, USADO PARA PARAGRAFOS, DESCRIÇÕES E CONTEÚDOS COMUNS. */
    bodyLarge: TextStyle().copyWith(
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
    bodyMedium: TextStyle().copyWith(
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
    bodySmall: TextStyle().copyWith(
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),

    /* LABEL: TEXTO DE RÓTULO, USADO PARA BOTÕES, ETIQUETAS E INSTRUÇÕES CURTAS. */
    labelLarge: TextStyle().copyWith(
      fontSize: 12.0,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    ),
    labelMedium: TextStyle().copyWith(
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
  );

  static TextTheme darkTheme = TextTheme(

    /*---- HEADLINE: TITULOS GRANDES TOPO DE TELA ----*/
    headlineLarge: TextStyle().copyWith(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headlineMedium: TextStyle().copyWith(
      fontSize: 24.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    headlineSmall: TextStyle().copyWith(
      fontSize: 16.0,
      fontWeight: FontWeight.w300,
      color: Colors.white,
    ),

    /* TITLE: TITULO MENOR, NOME DE SEÇÃO, TITULO DE CARD */
    titleLarge: TextStyle().copyWith(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    titleMedium: TextStyle().copyWith(
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
    titleSmall: TextStyle().copyWith(
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ),

    /* BODY: TEXTO PRINCIPAL, USADO PARA PARAGRAFOS, DESCRIÇÕES E CONTEÚDOS COMUNS. */
    bodyLarge: TextStyle().copyWith(
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ),
    bodyMedium: TextStyle().copyWith(
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ),
    bodySmall: TextStyle().copyWith(
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ),

    /* LABEL: TEXTO DE RÓTULO, USADO PARA BOTÕES, ETIQUETAS E INSTRUÇÕES CURTAS. */
    labelLarge: TextStyle().copyWith(
      fontSize: 12.0,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
    labelMedium: TextStyle().copyWith(
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ),
  );

}
