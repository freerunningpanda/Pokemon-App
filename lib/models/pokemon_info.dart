import 'package:json_annotation/json_annotation.dart';

import 'ability.dart';
import 'species.dart';
import 'sprites.dart';

part 'pokemon_info.g.dart';

@JsonSerializable(explicitToJson: true)
class PokemonInfo {
  PokemonInfo({
    required this.abilities,
    required this.baseExperience,
    required this.height,
    required this.name,
    required this.sprites,
    required this.weight,
  });

  final List<Ability> abilities;
  final int baseExperience;
  final int height;
  final String name;
  final Sprites sprites;
  final int weight;

  factory PokemonInfo.fromJson(Map<String, dynamic> json) =>
      _$PokemonInfoFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonInfoToJson(this);
}
