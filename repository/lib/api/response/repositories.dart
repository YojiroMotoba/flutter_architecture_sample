import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'repositories.g.dart';

@JsonSerializable()
class Repositories {
  Repositories(this.total_count);

  final int total_count;

  factory Repositories.fromJson(String jsonString) {
    final repositories = json.decode(jsonString) as Map<String, dynamic>;
    return _$RepositoriesFromJson(repositories);
  }

  Map<String, dynamic> toJson() => _$RepositoriesToJson(this);
}
