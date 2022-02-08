import 'package:json_annotation/json_annotation.dart';

import 'ability.dart';
import 'species.dart';
import 'sprites.dart';

part 'pokemon_info.g.dart';

@JsonSerializable()
class PokemonInfo {
  PokemonInfo({
    required this.abilities,
    required this.baseExperience,
    required this.forms,
    required this.height,
    required this.heldItems,
    required this.id,
    required this.locationAreaEncounters,
    required this.name,
    required this.order,
    required this.pastTypes,
    required this.species,
    required this.sprites,
    required this.weight,
  });

  final List<Ability> abilities;
  final int baseExperience;
  final List<Species> forms;
  final int height;
  final List<dynamic> heldItems;
  final int id;
  final String locationAreaEncounters;
  final String name;
  final int order;
  final List<dynamic> pastTypes;
  final Species species;
  final Sprites sprites;
  final int weight;

  factory PokemonInfo.fromJson(Map<String, dynamic> json) =>
      _$PokemonInfoFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonInfoToJson(this);
}
