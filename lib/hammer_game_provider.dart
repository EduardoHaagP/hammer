import 'package:flutter/material.dart';

// A LÓGICA VIVE AQUI, ISOLADA.
// Esta classe não sabe nada sobre MaterialApp ou Scaffolds.
class HammerGameProvider extends ChangeNotifier {
  List<Jogador> jogadores = [];
  final int maximoDeJogadores = 5;

  void adicionarNovoJogador(String nome) {}
  // ... resto da lógica
}

class Jogador {}
