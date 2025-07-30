import 'package:flutter/material.dart';

// A LÓGICA VIVE AQUI, ISOLADA.
// Esta classe não sabe nada sobre MaterialApp ou Scaffolds.
class HammerGameProvider extends ChangeNotifier {
  // A lista já começa vazia. É mais seguro e limpo.
  final List<Jogador> jogadores = [];
  final int maximoDeJogadores = 5;

  // REMOVIDO: 'quantidadeAtual' é redundante. Podemos sempre usar 'jogadores.length'.
  // int quantidadeAtual = 0;

  /// Adiciona um novo jogador à lista, se o limite não foi atingido.
  void adicionarNovoJogador(String nome) {
    // 1. VERIFICAÇÃO DE SEGURANÇA: Impede que mais jogadores que o máximo sejam adicionados.
    if (jogadores.length >= maximoDeJogadores) {
      return; // Sai da função
    }

    // 2. LÓGICA CORRETA: Usa o método .add() para inserir um novo jogador no FIM da lista.
    jogadores.add(Jogador(nome, 0));

    // 3. PONTO MAIS IMPORTANTE: Notifica os widgets que estão "ouvindo" que houve uma mudança.
    // Sem isso, a sua tela NUNCA será atualizada.
    notifyListeners();
  }

  /// Adiciona pontos a um jogador específico usando seu índice na lista.
  void adicionarPontuacao(int indiceDoJogador, int pontuacaoParaAdicionar) {
    // 1. VERIFICAÇÃO DE SEGURANÇA: Garante que o índice existe na lista para evitar erros.
    if (indiceDoJogador < 0 || indiceDoJogador >= jogadores.length) {
      return; // Sai da função
    }

    // 2. LÓGICA CORRETA: Acessa o jogador pelo índice e soma a nova pontuação.
    jogadores[indiceDoJogador].pontuacao += pontuacaoParaAdicionar;

    // 3. PONTO MAIS IMPORTANTE: Notifica os widgets para atualizarem a pontuação na tela.
    notifyListeners();
  }

  /// Remove um jogador da lista.
  void removerJogador(int indiceDoJogador) {
    if (indiceDoJogador < 0 || indiceDoJogador >= jogadores.length) {
      return;
    }
    jogadores.removeAt(indiceDoJogador);
    notifyListeners();
  }
}

/// Classe do Modelo de Dados (Model)
/// Representa um único jogador.
class Jogador {
  String nome;
  int pontuacao;

  Jogador(this.nome, this.pontuacao);
}