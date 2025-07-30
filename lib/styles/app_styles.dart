import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppStyles {
  // Evita que alguém instancie esta classe
  AppStyles._();

  static final TextStyle titulo = GoogleFonts.poppins(fontSize: 28.0);

  static const TextStyle subtitulo = TextStyle(
    fontSize: 18.0,
    color: AppColors.pretinBomPoZoio,
  );

  static final ButtonStyle botaoElevado = ElevatedButton.styleFrom(
    backgroundColor: AppColors.pingaAzul,
    foregroundColor: Colors.white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
  );
}
