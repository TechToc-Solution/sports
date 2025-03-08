import 'package:sports/features/home/data/models/fields.dart';

class MyFormData {
  int? id;
  String? name;
  String? label;
  String? tableName;
  int? showAlways;
  List<Fields>? fields;

  MyFormData({
    this.id,
    this.name,
    this.label,
    this.tableName,
    this.showAlways,
    this.fields,
  });

  MyFormData.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    name = json['name'] ?? '';
    label = json['label'] ?? '';
    tableName = json['table_name'] ?? '';
    showAlways = json['show_always'] ?? 0;
    if (json['fields'] != null) {
      fields = (json['fields'] as List)
          .map((field) => Fields.fromJson(field))
          .toList();
    } else {
      fields = [];
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'label': label,
      'table_name': tableName,
      'show_always': showAlways,
      'fields': fields?.map((field) => field.toJson()).toList() ?? [],
    };
  }
}
