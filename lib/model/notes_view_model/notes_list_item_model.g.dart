// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notes_list_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotesListItemModel _$NotesListItemModelFromJson(Map<String, dynamic> json) {
  return NotesListItemModel(
    json['id'] as int,
    json['text'] as String,
    json['radio'] as int,
    json['primaryKey'] as int,
  );
}

Map<String, dynamic> _$NotesListItemModelToJson(NotesListItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'radio': instance.radio,
      'primaryKey': instance.primaryKey,
    };
