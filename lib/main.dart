import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // 1. IMPORTE O PACOTE PROVIDER

// Importe seu arquivo de provider
import 'package:teste/hammer_game_provider.dart'; // 2. IMPORTE SEU PROVIDER

//pages
import 'pages/create_users.dart';
import 'pages/info.dart';
import 'pages/config.dart';

//styles
import 'styles/app_colors.dart';
import 'styles/app_styles.dart';

void main() {
  // 3. ENVOLVA O APP COM O PROVIDER
  runApp(
    ChangeNotifierProvider(
      create: (context) => HammerGameProvider(),
      child: const MyApp(), // Seu app agora é "filho" do provider
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hammer',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.verdinJamaicano),
        useMaterial3: true,
      ),
      // A home continua a mesma, mas agora ela consegue "ver" o provider
      home: TelaInicial(),
    );
  }
}

// O resto do seu código (TelaInicial) permanece exatamente o mesmo.
class TelaInicial extends StatelessWidget {
  const TelaInicial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
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
              const Spacer(),
              SizedBox(
                width: 250.0,
                height: 50.0,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.pingaAzul,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        // Assumindo que o nome da sua tela de criação de usuários é CreateUsersScreen ou similar
                        builder: (context) => DynamicTextFieldScreen(),
                      ),
                    );
                  },
                  child: Text("NOVO JOGO", style: AppStyles.titulo),
                ),
              ),
              const SizedBox(height: 150),
            ],
          ),
        ),
      ),
    );
  }
}
