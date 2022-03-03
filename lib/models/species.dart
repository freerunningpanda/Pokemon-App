import 'package:json_annotation/json_annotation.dart';

part 'species.g.dart';

@JsonSerializable()
class Species {
  Species({
    required this.name,
  });

  final String name;

  factory Species.fromJson(Map<String, dynamic> json) =>
      _$SpeciesFromJson(json);

  Map<String, dynamic> toJson() => _$SpeciesToJson(this);
}
