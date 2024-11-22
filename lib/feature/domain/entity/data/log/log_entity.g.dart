// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LogEntityImpl _$$LogEntityImplFromJson(Map<String, dynamic> json) =>
    _$LogEntityImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
      message: json['message'] as String?,
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$$LogEntityImplToJson(_$LogEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'message': instance.message,
      'createdAt': instance.createdAt,
    };
