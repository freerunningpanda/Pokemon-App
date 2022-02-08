import 'package:json_annotation/json_annotation.dart';

import 'home.dart';

part 'other.g.dart';

@JsonSerializable()
class Other {
  Other({
    required this.home,
  });

  final Home home;

  factory Other.fromJson(Map<String, dynamic> json) => _$OtherFromJson(json);

  Map<String, dynamic> toJson() => _$OtherToJson(this);
}
