import 'package:flutter/material.dart';
import 'package:quizpokemonn2/screens/quiz_pokemon.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Center(child: Text('Quiz Pokémon')),
      ),
      body: Column(
        mainAxisAlignment:
            MainAxisAlignment.center, // Centraliza os elementos verticalmente
        children: [
          const Text(
            'Bem-vindo ao Desafio Pokémon!', // Mensagem de boas-vindas
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 40),
          const Text(
            'Prepare-se para testar seu conhecimento no mundo dos Pokémon e se tornar um Mestre Pokémon!', // Mensagem de boas-vindas
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
            textAlign: TextAlign.center,// Centraliza o texto horizontalmente
          ), // Adiciona um espaçamento vertical
          const SizedBox(height: 50),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Quiz()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: const EdgeInsets.fromLTRB(100, 20, 100, 20),
              ),
              child: const Text('Jogar!', style: TextStyle(fontSize: 24)),
            ),
          ),
        ],
      ),
    );
  }
}
