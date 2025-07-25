import 'package:flutter/material.dart';

class CreateUsers extends StatelessWidget {
  const CreateUsers({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resultados da Rodada'),
        // O Flutter adiciona automaticamente um botão de "voltar" aqui
        // que já chama o Navigator.pop() para você!
      ),
      body: Center(
        child: Text('Aqui ficarão os resultados!'),
      ),
    );
  }
}