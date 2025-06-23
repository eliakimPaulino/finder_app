import '../../domain/entities/pep_component_entity.dart';

class PepComponentModel extends PepComponentEntity {
  PepComponentModel({
    required super.item,
    required super.description,
    required super.stripping,
    required super.itemImage,
    required super.toolCode,
    required super.toolImage,
    required super.turretPositioning,
    required super.turretPositioningImage,
    required super.toolAdjustment,
    required super.secondToolCode,
    required super.secondToolImage,
    required super.secondMatrixPositioning,
    required super.secondMatrixPositioningImage,
    required super.secondToolAdjustment,
  });

  factory PepComponentModel.fromJson(Map<String, dynamic> json) {
    return PepComponentModel(
      item: json['item'],
      description: json['description'],
      stripping: json['stripping'],
      itemImage: json['item_image'],
      toolCode: json['tool_code'],
      toolImage: json['tool_image'],
      turretPositioning: json['turret_positioning'],
      turretPositioningImage: json['tourret_positioning_image'],
      toolAdjustment: json['tool_adjustment'],
      secondToolCode: json['second_tool_code'],
      secondToolImage: json['second_tool_image'],
      secondMatrixPositioning: json['second_matrix_positioning'],
      secondMatrixPositioningImage: json['second_matrix_positioning_image'],
      secondToolAdjustment: json['second_tool_adjustment'],
    );
  }
}
