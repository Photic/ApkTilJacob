// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notes_grid_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotesGridModel _$NotesGridModelFromJson(Map<String, dynamic> json) {
  return NotesGridModel(
    json['text'] as String,
    json['image'] as String,
    json['color'] as String,
    json['id'] as int,
  );
}

Map<String, dynamic> _$NotesGridModelToJson(NotesGridModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'color': instance.color,
      'image': instance.image,
    };
