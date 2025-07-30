import 'package:flutter/material.dart';
import 'package:teste/pages/gamestart.dart';
import 'package:teste/styles/app_colors.dart';
import 'package:teste/hammer_game_provider.dart';
import 'package:teste/styles/app_styles.dart';

// Nossa tela principal, que é um StatefulWidget
class DynamicTextFieldScreen extends StatefulWidget {
  const DynamicTextFieldScreen({super.key});

  @override
  State<DynamicTextFieldScreen> createState() => _DynamicTextFieldScreenState();
}

class _DynamicTextFieldScreenState extends State<DynamicTextFieldScreen> {
  // 1. Lista para armazenar os controladores de cada caixa de texto.
  // Usar controladores é a forma recomendada de gerenciar o texto.
  final List<TextEditingController> _controllers = [];
  final int _maxFields = 5; // Quantidade máxima de caixas
  final int _minFields = 1; // Quantidade máxima de caixas

  @override
  void initState() {
    super.initState();
    // 2. Começamos com uma caixa de texto por padrão.
    _addTextField();
  }

  // 3. Função para adicionar uma nova caixa de texto
  void _addTextField() {
    // Verifica se o limite máximo foi atingido
    if (_controllers.length < _maxFields) {
      // setState notifica o Flutter que o estado mudou,
      // fazendo com que a UI seja reconstruída.
      setState(() {
        _controllers.add(TextEditingController());
      });
    } else {
      // Opcional: Mostra uma mensagem se o limite for atingido
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Limite máximo de 5 caixas atingido!')),
      );
    }
  }

  // 4. Função para salvar e exibir os valores (exemplo)
  void _saveValues() {
    for (int i = 0; i < _controllers.length; i++) {
      HammerGameProvider().adicionarNovoJogador(_controllers[i].text);
    }
    // Aqui você poderia salvar os dados em um banco de dados, enviar para uma API, etc.
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Valores Salvos'),
        content: const Text('Os valores foram impressos no console de debug.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  // 5. É MUITO IMPORTANTE liberar os recursos dos controladores
  // quando a tela for descartada para evitar vazamentos de memória.
  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Caixas de Texto Dinâmicas')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // 6. Usamos um ListView.builder para construir a lista de caixas de texto
            // de forma eficiente.
            Expanded(
              child: ListView.builder(
                itemCount: _controllers.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: TextField(
                      controller: _controllers[index],
                      decoration: InputDecoration(
                        labelText: 'Caixa de Texto ${index + 1}',
                        border: const OutlineInputBorder(),
                        // Opcional: Adiciona um botão para remover uma caixa específica
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.remove_circle),
                          onPressed: () {
                            if (_controllers.length != _minFields) {
                              setState(() {
                                _controllers[index].dispose();
                                _controllers.removeAt(index);
                              });
                            }
                          },
                        ), // aqui
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            // 7. Botão para adicionar mais caixas de texto
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  // Desabilita o botão se o limite for atingido
                  onPressed: _controllers.length < _maxFields
                      ? _addTextField
                      : null,
                  icon: const Icon(Icons.add),
                  label: const Text('Adicionar Caixa'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.pingaAzul,
                    foregroundColor: Colors.white,
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: _saveValues,
                  icon: const Icon(Icons.save),
                  label: const Text('Salvar'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.verdinJamaicano,
                    foregroundColor: Colors.white,
                  ),
                ),
                ElevatedButton(
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
                      MaterialPageRoute(builder: (context) => Gamestart()),
                    );
                  },
                  child: Text("NOVO JOGO", style: AppStyles.titulo),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
