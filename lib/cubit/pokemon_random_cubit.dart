import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../models/pokemon_info.dart';
import '../services/pokemon_repository.dart';

part 'pokemon_random_state.dart';

class PokemonRandomCubit extends Cubit<PokemonRandomState> {
  final PokemonRepository pokemonRepository;
  PokemonRandomCubit(this.pokemonRepository) : super(PokemonRandomInitial());

  Future<void> fetchRandomPokemon() async {
    try {
      emit(PokemonRandomInitial());
      final loadRandomPokemon = await pokemonRepository.getRandomPokemon();
      emit(PokemonRandomLoadedState(loadRandomPokemon));
    } catch (e) {
      emit(PokemonRandomErrorState(e.toString()));
    }
  }
}
