import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:secure_personal_finance/model/notes_view_model/notes_list_item_model.dart';

part 'notes_grid_model.g.dart';

@JsonSerializable()
class NotesGridModel {
  final int id;
  final String text;
  final String color;
  String image;

  @JsonKey(ignore: true)
  List<NotesListItemModel> items;

  NotesGridModel(this.text, this.image, this.color, [this.id, this.items]) {
    if (image.length == 0) {
      this.image = "lib/assets/images/default.png";
    }
  }

  Color getColor() {
    return Color(int.parse(color.split('(0x')[1].split(')')[0], radix: 16));
  }

  /// Construct [object] from JSON
  factory NotesGridModel.fromJson(Map<String, dynamic> json) => _$NotesGridModelFromJson(json);

  /// Returns [object] to JSON.
  Map<String, dynamic> toJson() => _$NotesGridModelToJson(this);
}
