import 'package:json_annotation/json_annotation.dart';

import 'ability.dart';
import 'sprites.dart';

part 'pokemon_info.g.dart';

@JsonSerializable(explicitToJson: true)
class PokemonInfo {
  PokemonInfo({
    required this.id,
    required this.name,
    required this.sprites,
    required this.height,
    required this.weight,
    required this.abilities,
    required this.baseExperience,
  });

  final int id;
  final String name;
  final Sprites sprites;
  final int height;
  final int weight;
  final List<Ability> abilities;
  final int baseExperience;

  String getSprites() {
    return sprites.other.home.frontDefault;
  }

  String getAbilities() {
    return abilities[0].ability.name;
  }

  factory PokemonInfo.fromJson(Map<String, dynamic> json) =>
      _$PokemonInfoFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonInfoToJson(this);

  @override
  String toString() {
    return 'abilities: $abilities, baseExperience: $baseExperience, height $height, name $name, sprites $sprites, weight $weight';
  }
}
