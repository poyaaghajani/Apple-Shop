class VariantType {
  String id;
  String name;
  String title;
  VariantTypeEnum type;

  VariantType(
    this.id,
    this.name,
    this.title,
    this.type,
  );

  factory VariantType.fromJson(Map<String, dynamic> json) {
    return VariantType(
      json['id'],
      json['name'],
      json['title'],
      checkVariantType(json['type']),
    );
  }
}

// check product variant type
VariantTypeEnum checkVariantType(String type) {
  switch (type) {
    case 'Color':
      return VariantTypeEnum.color;

    case 'Storage':
      return VariantTypeEnum.storage;

    case 'Voltage':
      return VariantTypeEnum.voltage;

    default:
      return VariantTypeEnum.color;
  }
}

enum VariantTypeEnum { color, storage, voltage }
