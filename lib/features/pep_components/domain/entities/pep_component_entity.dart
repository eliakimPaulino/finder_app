class PepComponentEntity {
  final String item;
  final String description;
  final String stripping;
  final String itemImage;
  final String toolCode;
  final String toolImage;
  final String turretPositioning;
  final String turretPositioningImage;
  final String toolAdjustment;
  final String secondToolCode;
  final String secondToolImage;
  final String secondMatrixPositioning;
  final String secondMatrixPositioningImage;
  final String secondToolAdjustment;

  const PepComponentEntity({
    required this.item,
    required this.description,
    required this.stripping,
    required this.itemImage,
    required this.toolCode,
    required this.toolImage,
    required this.turretPositioning,
    required this.turretPositioningImage,
    required this.toolAdjustment,
    required this.secondToolCode,
    required this.secondToolImage,
    required this.secondMatrixPositioning,
    required this.secondMatrixPositioningImage,
    required this.secondToolAdjustment,
  });

  factory PepComponentEntity.fromJson(Map<String, dynamic> json) {
    return PepComponentEntity(
      item: json['item'] ?? '',
      description: json['description'] ?? '',
      stripping: json['stripping'] ?? '',
      itemImage: json['item_image'] ?? '',
      toolCode: json['tool_code'] ?? '',
      toolImage: json['tool_image'] ?? '',
      turretPositioning: json['turret_positioning'] ?? '',
      turretPositioningImage: json['tourret_positioning_image'] ?? '',
      toolAdjustment: json['tool_adjustment'] ?? '',
      secondToolCode: json['second_tool_code'] ?? '',
      secondToolImage: json['second_tool_image'] ?? '',
      secondMatrixPositioning: json['second_matrix_positioning'] ?? '',
      secondMatrixPositioningImage: json['second_matrix_positioning_image'] ?? '',
      secondToolAdjustment: json['second_tool_adjustment'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'item': item,
      'description': description,
      'stripping': stripping,
      'item_image': itemImage,
      'tool_code': toolCode,
      'tool_image': toolImage,
      'turret_positioning': turretPositioning,
      'tourret_positioning_image': turretPositioningImage,
      'tool_adjustment': toolAdjustment,
      'second_tool_code': secondToolCode,
      'second_tool_image': secondToolImage,
      'second_matrix_positioning': secondMatrixPositioning,
      'second_matrix_positioning_image': secondMatrixPositioningImage,
      'second_tool_adjustment': secondToolAdjustment,
    };
  }
}
