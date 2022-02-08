import 'dart:math';

import 'package:dio/dio.dart';

import '../models/pokemon_info.dart';

class PokemonApiProvider {
  Future<PokemonInfo> getPokemonInfo(String? name) async {
    final dio = Dio();
    var response = await dio.get('https://pokeapi.co/api/v2/pokemon/$name');
    if (response.statusCode == 200) {
      final PokemonInfo pokemonInfo = PokemonInfo.fromJson(response.data);
      return pokemonInfo;
    } else {
      throw Exception("Couldn't load Pokemon's info");
    }
  }

  Future<PokemonInfo> getRandomPokemon() async {
    final dio = Dio();
    int pokemonIndex;
    Random random;
    int min = 1;
    int max = 898;
    random = Random();
    pokemonIndex = min + random.nextInt(max - min);
    var response =
        await dio.get('https://pokeapi.co/api/v2/pokemon/$pokemonIndex');
    if (response.statusCode == 200) {
      final PokemonInfo randomPokemonInfo = PokemonInfo.fromJson(response.data);
      return randomPokemonInfo;
    } else {
      throw Exception("Couldn't load random Pokemon");
    }
  }
}
