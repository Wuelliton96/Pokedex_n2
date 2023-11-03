import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:math';

class Pokemon {
  String name;
  String url;

  Pokemon({required this.name, required this.url});

  get id {
    var urlParts = url.split('/');
    var id = urlParts.reversed.skip(1).first;
    return int.parse(id);
  }

  get image =>
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${id}.png';

  factory Pokemon.fromJson(Map<String, dynamic> jsonData) {
    return Pokemon(name: jsonData['name'], url: jsonData['url']);
  }

  List<String> getRandomOptions() {
    final random = Random();
    final options = <String>[name];
    while (options.length < 4) {
      final randomIndex = random.nextInt(151);
      final randomPokemon = Pokemon(
          name: 'Random $randomIndex',
          url: 'https://pokeapi.co/api/v2/pokemon/$randomIndex/');
      if (!options.contains(randomPokemon.name)) {
        options.add(randomPokemon.name);
      }
    }
    options.shuffle();
    return options;
  }
}

class PokeAPI {
  static Future<List<Pokemon>> getPokemonList({int limit = 151}) async {
    final response =
        await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=$limit'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List<dynamic> results = data['results'];
      final List<Pokemon> pokemonList =
          results.map((item) => Pokemon.fromJson(item)).toList();
      return pokemonList;
    } else {
      throw Exception('Failed to fetch data: ${response.statusCode}');
    }
  }
}