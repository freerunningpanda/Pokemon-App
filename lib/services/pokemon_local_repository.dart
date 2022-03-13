import '../models/pokemon_info.dart';

import '../db/pokemon_database.dart';

class PokemonLocalRepository {
  Future<void> insertPokemon(PokemonInfo pokemonInfo) =>
      PokemonDatabase.instance.insertPokemon(pokemonInfo);
  Future<PokemonInfo?> getPokemon(String? name) =>
      PokemonDatabase.instance.getPokemon(name);
}
