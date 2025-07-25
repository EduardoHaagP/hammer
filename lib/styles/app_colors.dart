import 'package:flutter/material.dart';

// Classe apenas para organizar nossas constantes de cor.
class AppColors {
  // O 'static const' significa que esses valores são constantes em tempo de compilação
  // e podem ser usados sem criar uma instância da classe (ex: AppColors.primary)
  
  static const Color primary = Color(0xFF3F51B5); // Cor principal
  static const Color background = Color(0xFF121212); // Fundo escuro como no wireframe
  static const Color surface = Color(0xFF1E1E1E); // Cor dos cards e superfícies
  static const Color text = Colors.white; // Cor do texto principal
  static const Color textSecondary = Colors.grey; // Cor do texto secundário
  static const Color accent = Color(0xFFBB86FC); // Uma cor de destaque
}