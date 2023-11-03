import 'dart:math';

class Pokemon {
  String name;
  String url;

  Pokemon({required this.name, required this.url});

  // Obtém o ID do Pokémon a partir da URL
  get id {
    var urlParts = url.split('/');
    var id = urlParts.reversed.skip(1).first;
    return int.parse(id);
  }

  // Constrói a URL da imagem oficial do Pokémon
  get image =>
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${id}.png';

  factory Pokemon.fromJson(Map<String, dynamic> jsonData) {
    // Converte os dados JSON em um objeto Pokemon
    return Pokemon(name: jsonData['name'], url: jsonData['url']);
  }

  // Obtém uma lista de opções de nomes de Pokémon aleatórios
  List<String> getRandomOptions(List<Pokemon> pokemonList) {
    final random = Random();
    final options = <String>[name];

    // Enquanto não houver 4 opções únicas, continue adicionando
    while (options.length < 4) {
      final randomIndex = random.nextInt(pokemonList.length);
      final randomPokemon = pokemonList[randomIndex];

      // Certifique-se de que não estamos duplicando opções
      if (!options.contains(randomPokemon.name)) {
        options.add(randomPokemon.name);
      }
    }
    
    // Embaralhe as opções antes de retornar
    options.shuffle();
    return options;
  }
}
