import 'package:flutter/material.dart';
import 'pages/create_users.dart';
import 'styles/app_colors.dart';

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        crossAxisAlignment: CrossAxisAlignment.center,

        children: <Widget>[
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: Center(
              child: SizedBox(
                width: 250.0,
                height: 50.0,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CreateUsers()),
                    );
                  },
                  child: Text("NOVO JOGO"),
                ),
              ),
            ),
          ),
          const SizedBox(height: 200),
        ],
      ),
      //Center(), // Colocar a img aqui
    );
  }
}
