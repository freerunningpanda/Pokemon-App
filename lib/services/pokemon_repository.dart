import 'pokemon_api_provider.dart';
import '../models/pokemon_info.dart';

class PokemonRepository {
  final pokemonApiProvider = PokemonApiProvider();
  Future<PokemonInfo?> getPokemon(String? name) =>
      pokemonApiProvider.getPokemonInfo(name);
  Future<PokemonInfo?> getRandomPokemon() =>
      pokemonApiProvider.getRandomPokemon();
}
