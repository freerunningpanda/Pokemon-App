import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../models/pokemon_info.dart';
import '../services/pokemon_repository.dart';
import '../services/pokemon_local_repository.dart';

part 'pokemon_state.dart';

class PokemonCubit extends Cubit<PokemonState> {
  final PokemonRepository pokemonRepository;
  final PokemonLocalRepository localRepository;
  PokemonCubit(this.pokemonRepository, this.localRepository)
      : super(PokemonInitial());

  Future<void> fetchPokemon([String? name]) async {
    try {
      emit(PokemonInitial());
      // var pokemon = await localRepository.getPokemon(name);
      // if (pokemon == null) {
      //   pokemon = await pokemonRepository.getPokemon(name);
      //   localRepository.insertPokemon(pokemon!);
      // }
      var pokemon = await pokemonRepository.getPokemon(name);
      localRepository.insertPokemon(pokemon!);
      emit(PokemonLoadedState(pokemon));
    } catch (e) {
      emit(PokemonErrorState(e.toString()));
    }
  }
}
