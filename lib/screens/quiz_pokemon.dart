import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quizpokemonn2/models/pokemon.dart';
import 'package:quizpokemonn2/services/api.dart';

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<Pokemon>? pokemonList; // Lista de Pokémon obtida da API
  int currentQuestion = 0; // Índice da pergunta atual
  int score = 0; // Contagem de respostas corretas
  int scorem = 0; // Contagem de respostas incorretas

  @override
  void initState() {
    super.initState();
    fetchPokemonData(); // Inicializa o carregamento dos dados dos Pokémon
  }

  Future<void> fetchPokemonData() async {
    try {
      // Obtém uma lista de 10 Pokémon da API
      pokemonList = await PokeAPI.getPokemonList(limit: 10);
      loadRandomPokemon(); // Carrega um Pokémon aleatório para a primeira pergunta
      setState(() {}); // Atualiza a interface do aplicativo
    } catch (e) {
      print('Erro ao buscar dados: $e');
    }
  }

  void loadRandomPokemon() {
    if (currentQuestion < 10) {
      final randomPokemon = getRandomPokemon(); // Obtém um Pokémon aleatório
      if (randomPokemon != null) {
        setState(() {
          pokemonList![currentQuestion] = randomPokemon; // Substitui a pergunta atual pelo Pokémon aleatório
        });
      }
    }
  }

  Pokemon? getRandomPokemon() {
    if (pokemonList != null) {
      final random = Random();
      final randomIndex = random.nextInt(pokemonList!.length);
      return pokemonList![randomIndex]; // Retorna um Pokémon aleatório
    }
    return null;
  }

  void checkAnswer(String selectedName) {
    bool isCorrect = pokemonList?[currentQuestion].name == selectedName; // Verifica se a resposta está correta
    String mensagem = isCorrect
        ? 'Correto!'
        : 'Resposta incorreta, correto será ${pokemonList![currentQuestion].name}'; // Mensagem de feedback

    mostrarSnackbar(mensagem); // Exibe um Snackbar com o feedback

    if (isCorrect) {
      setState(() {
        score++; // Aumenta a contagem de respostas corretas
      });
    } else {
      setState(() {
        scorem++; // Aumenta a contagem de respostas incorretas
      });
    }

    if (currentQuestion < 9) {
      loadRandomPokemon(); // Carrega um novo Pokémon para a próxima pergunta
      setState(() {
        currentQuestion++; // Avança para a próxima pergunta
      });
    } else {
      mostrarDialogoFinal(); // Exibe um diálogo de fim de jogo quando todas as perguntas forem respondidas
    }
  }

  void mostrarSnackbar(String mensagem) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(mensagem))); // Exibe um Snackbar com a mensagem
  }

  Future<void> mostrarDialogoFinal() async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Fim do Jogo'),
          content: Text('Sua pontuação de acertos foram  $score de 10 perguntas'), // Exibe a pontuação final
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Center(child: Text('Quiz Pokémon')),
      ),
      body: (pokemonList != null && currentQuestion < 10)
          ? Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Certos: $score',
                      style: const TextStyle(fontSize: 20),
                    ),
                    Text(
                      'Errados: $scorem',
                      style: const TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.network(pokemonList![currentQuestion].image), // Exibe a imagem do Pokémon atual
                ),
                const SizedBox(height: 20),
                ...pokemonList![currentQuestion]
                    .getRandomOptions(pokemonList!) // Obtém opções de nomes de Pokémon
                    .map((option) {
                  return ElevatedButton(
                    onPressed: () => checkAnswer(option), // Verifica a resposta quando um botão é pressionado
                    child: Text(option), // Exibe o nome do Pokémon como opção
                  );
                }),
              ],
            )
          : const Center(child: CircularProgressIndicator()), // Exibe um indicador de carregamento
    );
  }
}
