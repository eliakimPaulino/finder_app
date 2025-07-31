import 'package:finder_app/features/pep_components/domain/entities/pep_component_entity.dart';
import 'package:flutter/material.dart';

import '../../../components/domain/entities/item_entity.dart';
import '../../domain/entities/production_item.dart';

class PepProductionListProvider extends ChangeNotifier {
  final List<ProductionItem> _items = [];
  final List<ComponentEntity> _componentList = [];

  List<ProductionItem> get items => _items;
  List<ComponentEntity> get componentList => _componentList;

  void addComponentLocationItem(ComponentEntity? location) {
    final componentCode = location?.item;
    final alreadyExists = componentList.any((component) => component.item == componentCode);

    if (!alreadyExists) {
      componentList.add(
        ComponentEntity(
          area: location!.area,
          descricao: location.descricao,
          fluxo: location.fluxo,
          item: location.item,
          localReferencia: location.localReferencia,
          montagem: location.montagem,
          posicao: location.posicao,
          prateleira: location.prateleira,
          projeto: location.projeto,
          sigla: location.sigla,
        ),
      );
      notifyListeners();
    }
  }

  void addItem(ComponentEntity? location, PepComponentEntity? production) {
    final itemCode = location?.item ?? production?.item;
    final alreadyExists = _items.any(
      (e) => e.location?.item == itemCode || e.production?.item == itemCode,
    );

    if (itemCode == null) return;
    
    if (!alreadyExists) {
      _items.add(ProductionItem(location: location, production: production));
      notifyListeners();
    }
  }

  void removeItem(String itemCode) {
    _items.removeWhere(
      (e) => e.location?.item == itemCode || e.production?.item == itemCode,
    );
    notifyListeners();
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }

  ProductionItem? getByItemCode(String itemCode) {
    return _items.firstWhere(
      (e) => e.location?.item == itemCode || e.production?.item == itemCode,
      /*orElse: () => null*/
    );
  }
}
