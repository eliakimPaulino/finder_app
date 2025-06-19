import '../../domain/entities/item_entity.dart';

class ItemModel extends ItemEntity {
  const ItemModel({
    required super.item,
    required super.descricao,
    required super.area,
    required super.localReferencia,
    required super.prateleira,
    required super.posicao,
    required super.projeto,
    required super.sigla,
    required super.montagem,
    required super.fluxo,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      item: json['item'] ?? '',
      descricao: json['descricao'] ?? '',
      area: json['area'] ?? '',
      localReferencia: json['local_referencia'] ?? '',
      prateleira: json['prateleira'] ?? '',
      posicao: json['posicao'] ?? '',
      projeto: json['projeto'] ?? '',
      sigla: json['sigla'] ?? '',
      montagem: json['montagem'] ?? '',
      fluxo: json['fluxo'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'item': item,
      'descricao': descricao,
      'area': area,
      'local_referencia': localReferencia,
      'prateleira': prateleira,
      'posicao': posicao,
      'projeto': projeto,
      'sigla': sigla,
      'montagem': montagem,
      'fluxo': fluxo,
    };
  }
}
