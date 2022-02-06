import 'package:json_annotation/json_annotation.dart';

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
  final int weight;

  factory PokemonInfo.fromJson(Map<String, dynamic> json) =>
      _$PokemonInfoFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonInfoToJson(this);
}

@JsonSerializable()
class Ability {
  Ability({
    required this.ability,
    required this.isHidden,
    required this.slot,
  });

  final Species ability;
  final bool isHidden;
  final int slot;

  factory Ability.fromJson(Map<String, dynamic> json) =>
      _$AbilityFromJson(json);

  Map<String, dynamic> toJson() => _$AbilityToJson(this);
}

@JsonSerializable()
class Species {
  Species({
    required this.name,
    required this.url,
  });

  final String name;
  final String url;

  factory Species.fromJson(Map<String, dynamic> json) =>
      _$SpeciesFromJson(json);

  Map<String, dynamic> toJson() => _$SpeciesToJson(this);
}
