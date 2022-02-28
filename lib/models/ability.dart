import 'package:json_annotation/json_annotation.dart';

import 'species.dart';

part 'ability.g.dart';

@JsonSerializable()
class Ability {
  Ability({
    required this.ability,
  });

  final Species ability;

  factory Ability.fromJson(Map<String, dynamic> json) =>
      _$AbilityFromJson(json);

  Map<String, dynamic> toJson() => _$AbilityToJson(this);
}
