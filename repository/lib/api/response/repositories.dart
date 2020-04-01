import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'repositories.g.dart';

@JsonSerializable()
class Repositories {
  Repositories(this.total_count, this.items);

  final int total_count;
  final List<Item> items;

  factory Repositories.fromJson(String jsonString) {
    final repositories = json.decode(jsonString) as Map<String, dynamic>;
    return _$RepositoriesFromJson(repositories);
  }

  Map<String, dynamic> toJson() => _$RepositoriesToJson(this);
}

@JsonSerializable()
class Item {
  Item(this.id, this.full_name, this.owner);

  final int id;
  final String full_name;
  final Owner owner;

  factory Item.fromJson(Map<String, dynamic> items) {
    return _$ItemFromJson(items);
  }

  Map<String, dynamic> toJson() => _$ItemToJson(this);
}

@JsonSerializable()
class Owner {
  Owner(this.avatar_url, this.html_url);

  final String avatar_url;
  final String html_url;

  factory Owner.fromJson(Map<String, dynamic> items) {
    return _$OwnerFromJson(items);
  }

  Map<String, dynamic> toJson() => _$OwnerToJson(this);
}