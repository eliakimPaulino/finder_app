import 'package:flutter/material.dart';

/*----- Temas de Elevated Button para Claro & Escuro -----*/

class KElevatedButtonTheme {

  /*----------------- Tema Claro -----------------*/
  static ElevatedButtonThemeData lightElevatedButtonTheme =
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0, // Sem sombra
          foregroundColor: Colors.white, // Cor do texto/ícone do botão
          backgroundColor: Colors.blue, // Cor de fundo do botão
          disabledForegroundColor: Colors.grey, // Cor do texto/ícone quando desabilitado
          disabledBackgroundColor: Colors.grey, // Cor de fundo quando desabilitado
          side: const BorderSide(color: Colors.blue), // Cor da borda
          padding: const EdgeInsets.symmetric(vertical: 12.0), // Espaçamento interno vertical
          textStyle: const TextStyle(
            fontSize: 16.0,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ), // Estilo do texto
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.0), // Raio da borda
          ),
        ),
      );

  /*----------------- Tema Escuro -----------------*/
  static ElevatedButtonThemeData darkElevatedButtonTheme =
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0, // Sem sombra
          foregroundColor: Colors.white, // Cor do texto/ícone do botão
          backgroundColor: Colors.blue, // Cor de fundo do botão
          disabledForegroundColor: Colors.grey, // Cor do texto/ícone quando desabilitado
          disabledBackgroundColor: Colors.grey, // Cor de fundo quando desabilitado
          side: const BorderSide(color: Colors.blue), // Cor da borda
          padding: const EdgeInsets.symmetric(vertical: 12.0), // Espaçamento interno vertical
          textStyle: const TextStyle(
            fontSize: 16.0,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ), // Estilo do texto
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0), // Raio da borda
          ),
        ),
      );
}
