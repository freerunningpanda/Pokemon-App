// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonInfo _$PokemonInfoFromJson(Map<String, dynamic> json) => PokemonInfo(
      abilities: (json['abilities'] as List<dynamic>)
          .map((e) => Ability.fromJson(e as Map<String, dynamic>))
          .toList(),
      baseExperience: json['base_experience'] as int,
      height: json['height'] as int,
      name: json['name'] as String,
      sprites: Sprites.fromJson(json['sprites'] as Map<String, dynamic>),
      weight: json['weight'] as int,
    );

Map<String, dynamic> _$PokemonInfoToJson(PokemonInfo instance) =>
    <String, dynamic>{
      'abilities': instance.abilities.map((e) => e.toJson()).toList(),
      'base_experience': instance.baseExperience,
      'height': instance.height,
      'name': instance.name,
      'sprites': instance.sprites.toJson(),
      'weight': instance.weight,
    };
