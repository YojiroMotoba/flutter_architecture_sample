// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repositories.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Repositories _$RepositoriesFromJson(Map<String, dynamic> json) {
  return Repositories(
    json['total_count'] as int,
    (json['items'] as List)
        ?.map(
            (e) => e == null ? null : Item.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$RepositoriesToJson(Repositories instance) =>
    <String, dynamic>{
      'total_count': instance.total_count,
      'items': instance.items,
    };

Item _$ItemFromJson(Map<String, dynamic> json) {
  return Item(
    json['id'] as int,
    json['full_name'] as String,
    json['owner'] == null
        ? null
        : Owner.fromJson(json['owner'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'id': instance.id,
      'full_name': instance.full_name,
      'owner': instance.owner,
    };

Owner _$OwnerFromJson(Map<String, dynamic> json) {
  return Owner(
    json['avatar_url'] as String,
    json['html_url'] as String,
  );
}

Map<String, dynamic> _$OwnerToJson(Owner instance) => <String, dynamic>{
      'avatar_url': instance.avatar_url,
      'html_url': instance.html_url,
    };
