import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../models/pokemon_info.dart';
import '../services/pokemon_repository.dart';

part 'pokemon_state.dart';

class PokemonCubit extends Cubit<PokemonState> {
  final PokemonRepository pokemonRepository;
  PokemonCubit(this.pokemonRepository) : super(PokemonInitial());

  Future<void> fetchPokemon([String? name]) async {
    try {
      emit(PokemonInitial());
      final loadPokemon = await pokemonRepository.getPokemon(name);
      emit(PokemonLoadedState(loadPokemon));
    } catch (e) {
      emit(PokemonErrorState(e.toString()));
    }
  }
}
