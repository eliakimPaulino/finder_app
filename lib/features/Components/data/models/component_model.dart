import '../../domain/entities/component_entity.dart';

class ComponentModel extends ComponentEntity {
  const ComponentModel({
    required super.dtr,
    required super.description,
    required super.area,
    required super.referenceLocation,
    required super.shelf,
    required super.position,
  });

  factory ComponentModel.fromJson(Map<String, dynamic> json) {
    return ComponentModel(
      dtr: json['dtr']?.toString() ?? '',
      description: json['description']?.toString() ?? '',
      area: json['area']?.toString() ?? '',
      referenceLocation: json['reference_location']?.toString() ?? '',
      shelf: json['shelf']?.toString() ?? '',
      position: json['position']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'dtr': dtr,
      'description': description,
      'area': area,
      'reference_location': referenceLocation,
      'shelf': shelf,
      'position': position,
    };
  }
}
