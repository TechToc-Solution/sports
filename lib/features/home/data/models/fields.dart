class Fields {
  int? id;
  String? name;
  String? label;
  String? type;
  int? pk;
  int? isReadonly;
  String? dropdown;
  int? autocomplete;
  int? isMandatory;
  int? visible;
  String? dir;
  String? searchOp;

  Fields({
    this.id,
    this.name,
    this.label,
    this.type,
    this.pk,
    this.isReadonly,
    this.dropdown,
    this.autocomplete,
    this.isMandatory,
    this.visible,
    this.dir,
    this.searchOp,
  });

  Fields.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    name = json['name'] ?? '';
    label = json['label'] ?? '';
    type = json['type'] ?? '';
    pk = json['pk'] ?? 0;
    isReadonly = json['is_readonly'] ?? 0;
    dropdown = json['dropdown'] ?? ''; // تأكد من أنها ليست null
    autocomplete = json['autocomplete'] ?? 0;
    isMandatory = json['is_mandatory'] ?? 0;
    visible = json['visible'] ?? 0;
    dir = json['dir'] ?? ''; // تجنب null
    searchOp = json['search_op'] ?? ''; // تجنب null
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'label': label,
      'type': type,
      'pk': pk,
      'is_readonly': isReadonly,
      'dropdown': dropdown,
      'autocomplete': autocomplete,
      'is_mandatory': isMandatory,
      'visible': visible,
      'dir': dir,
      'search_op': searchOp,
    };
  }
}
