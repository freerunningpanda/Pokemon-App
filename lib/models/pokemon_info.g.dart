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
      forms: (json['forms'] as List<dynamic>)
          .map((e) => Species.fromJson(e as Map<String, dynamic>))
          .toList(),
      height: json['height'] as int,
      heldItems: json['held_items'] as List<dynamic>,
      id: json['id'] as int,
      locationAreaEncounters: json['location_area_encounters'] as String,
      name: json['name'] as String,
      order: json['order'] as int,
      pastTypes: json['past_types'] as List<dynamic>,
      species: Species.fromJson(json['species'] as Map<String, dynamic>),
      weight: json['weight'] as int,
    );

Map<String, dynamic> _$PokemonInfoToJson(PokemonInfo instance) =>
    <String, dynamic>{
      'abilities': instance.abilities,
      'base_experience': instance.baseExperience,
      'forms': instance.forms,
      'height': instance.height,
      'held_items': instance.heldItems,
      'id': instance.id,
      'location_area_encounters': instance.locationAreaEncounters,
      'name': instance.name,
      'order': instance.order,
      'past_types': instance.pastTypes,
      'species': instance.species,
      'weight': instance.weight,
    };

Ability _$AbilityFromJson(Map<String, dynamic> json) => Ability(
      ability: Species.fromJson(json['ability'] as Map<String, dynamic>),
      isHidden: json['is_hidden'] as bool,
      slot: json['slot'] as int,
    );

Map<String, dynamic> _$AbilityToJson(Ability instance) => <String, dynamic>{
      'ability': instance.ability,
      'is_hidden': instance.isHidden,
      'slot': instance.slot,
    };

Species _$SpeciesFromJson(Map<String, dynamic> json) => Species(
      name: json['name'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$SpeciesToJson(Species instance) => <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };
