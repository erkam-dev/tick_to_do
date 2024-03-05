// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TodoModelImpl _$$TodoModelImplFromJson(Map<String, dynamic> json) =>
    _$TodoModelImpl(
      createdTime: json['createdTime'] == null
          ? null
          : DateTime.parse(json['createdTime'] as String),
      title: json['title'] as String?,
      id: json['id'] as String?,
      description: json['description'] as String?,
      isDone: json['isDone'] as bool?,
    );

Map<String, dynamic> _$$TodoModelImplToJson(_$TodoModelImpl instance) =>
    <String, dynamic>{
      'createdTime': instance.createdTime?.toIso8601String(),
      'title': instance.title,
      'id': instance.id,
      'description': instance.description,
      'isDone': instance.isDone,
    };
