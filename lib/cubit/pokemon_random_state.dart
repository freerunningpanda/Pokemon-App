part of 'pokemon_random_cubit.dart';

@immutable
abstract class PokemonRandomState {}

class PokemonRandomInitial extends PokemonRandomState {}

class PokemonRandomLoadedState extends PokemonRandomState {
  final PokemonInfo loadPokemon;

  PokemonRandomLoadedState(this.loadPokemon);
}

class PokemonRandomErrorState extends PokemonRandomState {
  final String errorMessage;

  PokemonRandomErrorState(this.errorMessage);

  @override
  bool operator ==(Object other) {
    if (identical(this, 0)) return true;

    return other is PokemonRandomErrorState &&
        other.errorMessage == errorMessage;
  }

  @override
  int get hashCode => errorMessage.hashCode;
}
