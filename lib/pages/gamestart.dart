import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teste/hammer_game_provider.dart'; // Seu import

class Gamestart extends StatelessWidget {
  const Gamestart({super.key});

  @override
  Widget build(BuildContext context) {
    // ✅ CORRETO: Pede ao Provider a instância existente e "assiste" a mudanças.
    final gameProvider = context.watch<HammerGameProvider>();

    return Scaffold(
      body: Center(
        // 💡 BOA PRÁTICA: Sempre verifique se a lista não está vazia.
        child: gameProvider.jogadores.isEmpty
            ? const Text('Nenhum jogador adicionado ainda.')
            : Text(gameProvider.jogadores[0].nome),
      ),
    );
  }
}
