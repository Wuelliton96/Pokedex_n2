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
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) =>  Quiz()));
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            padding: const EdgeInsets.fromLTRB(100, 20, 100, 20),
          ),
          child: const Text('Jogar!', style: TextStyle(fontSize: 50)),
        ),
      ),
    );
  }
}
