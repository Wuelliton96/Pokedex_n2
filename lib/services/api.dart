import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quizpokemonn2/models/pokemon.dart';

class PokeAPI {
  // Método estático para obter uma lista de Pokémon da API
  static Future<List<Pokemon>> getPokemonList({int limit = 151}) async {
    // Faz uma solicitação HTTP GET à API da PokéAPI com um limite opcional
    final response = await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=$limit'));

    if (response.statusCode == 200) {
      // Se a resposta da API for bem-sucedida (código 200), continue o processamento
      final data = jsonDecode(response.body); // Decodifica os dados JSON da resposta
      final List<dynamic> results = data['results']; // Obtém a lista de resultados dos Pokémon
      final List<Pokemon> pokemonList = results.map((item) => Pokemon.fromJson(item)).toList();
      // Mapeia os resultados para objetos Pokemon e cria uma lista
      return pokemonList; // Retorna a lista de Pokémon
    } else {
      throw Exception('Failed to fetch data: ${response.statusCode}');
      // Se a resposta da API não for bem-sucedida, lança uma exceção com o código de status
    }
  }
}
