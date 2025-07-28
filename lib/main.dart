import 'package:flutter/material.dart';

//pages
import 'pages/create_users.dart';
import 'pages/info.dart';
import 'pages/config.dart';

//styles
import 'styles/app_colors.dart';
import 'styles/app_styles.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hammer', // Mude o título para algo relevante
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
        useMaterial3: true, // É uma boa prática adicionar isso
      ),
      home: TelaInicial(),
    );
  }
}

class TelaInicial extends StatelessWidget {
  const TelaInicial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          // Adiciona margens nas laterais para um visual mais limpo
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10),
          child: Column(
            // crossAxisAlignment centraliza os itens na horizontal, o que é bom!
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // 1. A Row preenchida com os botões
              Row(
                // Empurra os botões para as extremidades
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.info_outline),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Infos()),
                      );
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.tag),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Config()),
                      );
                    },
                  ),
                ],
              ),

              // 2. O Spacer empurra o botão de baixo para o fim
              const Spacer(),

              // 3. O botão "NOVO JOGO"
              SizedBox(
                width: 250.0, 
                height: 50.0,
                child: ElevatedButton(
                  style: AppStyles.botaoElevado,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CreateUsers()),
                    );
                  },
                  child: Text("NOVO JOGO", style: AppStyles.titulo),
                ),
              ),

              // 4. Um espaço final para o botão não colar na borda
              const SizedBox(height: 150),
            ],
          ),
        ),
      ),
    );
  }
}
