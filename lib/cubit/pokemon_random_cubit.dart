import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../models/pokemon_info.dart';
import '../services/pokemon_local_repository.dart';
import '../services/pokemon_repository.dart';

part 'pokemon_random_state.dart';

class PokemonRandomCubit extends Cubit<PokemonRandomState> {
  final PokemonRepository pokemonRepository;
  final PokemonLocalRepository localRepository;
  PokemonRandomCubit(this.pokemonRepository, this.localRepository)
      : super(PokemonRandomInitial());

  Future<void> fetchRandomPokemon() async {
    try {
      emit(PokemonRandomInitial());
      final loadRandomPokemon = await pokemonRepository.getRandomPokemon();
      localRepository.insertPokemon(loadRandomPokemon!);
      emit(PokemonRandomLoadedState(loadRandomPokemon));
    } catch (e) {
      emit(PokemonRandomErrorState(e.toString()));
    }
  }
}
