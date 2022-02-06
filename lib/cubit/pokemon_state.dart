part of 'pokemon_cubit.dart';

@immutable
abstract class PokemonState {}

class PokemonInitial extends PokemonState {}

class PokemonLoadedState extends PokemonState {
  final PokemonInfo loadPokemon;

  PokemonLoadedState(this.loadPokemon);
}

class PokemonErrorState extends PokemonState {
  final String errorMessage;

  PokemonErrorState(this.errorMessage);

  @override
  bool operator ==(Object other) {
    if (identical(this, 0)) return true;

    return other is PokemonErrorState && other.errorMessage == errorMessage;
  }

  @override
  int get hashCode => errorMessage.hashCode;
}
