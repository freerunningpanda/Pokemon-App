import 'package:json_annotation/json_annotation.dart';

import 'other.dart';

part 'sprites.g.dart';

@JsonSerializable()
class Sprites {
  Sprites({required this.other});
  final Other other;

  factory Sprites.fromJson(Map<String, dynamic> json) =>
      _$SpritesFromJson(json);

  Map<String, dynamic> toJson() => _$SpritesToJson(this);
}
