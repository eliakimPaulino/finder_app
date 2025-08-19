import 'package:finder_app/features/pep_components/domain/entities/pep_component_entity.dart';
import 'package:flutter/material.dart';

import '../../../components/domain/entities/component_entity.dart';
import '../../domain/entities/production_item.dart';

class PepProductionListProvider extends ChangeNotifier {
  final List<ProductionItem> _items = [];
  final List<ComponentEntity> _componentList = [];

  List<ProductionItem> get items => _items;
  List<ComponentEntity> get componentList => _componentList;

  void addComponentLocationItem(ComponentEntity? location) {
    final componentCode = location?.dtr;
    final alreadyExists = componentList.any((component) => component.dtr == componentCode);

    if (!alreadyExists) {
      componentList.add(
        ComponentEntity(
          area: location!.area,
          dtr: location.dtr,
          description: location.description,
          referenceLocation: location.referenceLocation,
          position: location.position,
          shelf: location.shelf,
        ),
      );
      notifyListeners();
    }
  }

  void addItem(ComponentEntity? location, PepComponentEntity? production) {
    final itemCode = location?.dtr ?? production?.item;
    final alreadyExists = _items.any(
      (e) => e.location?.dtr == itemCode || e.production?.item == itemCode,
    );

    if (itemCode == null) return;
    
    if (!alreadyExists) {
      _items.add(ProductionItem(location: location, production: production));
      notifyListeners();
    }
  }

  void removeItem(String itemCode) {
    _items.removeWhere(
      (e) => e.location?.dtr == itemCode || e.production?.item == itemCode,
    );
    notifyListeners();
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }

  ProductionItem? getByItemCode(String itemCode) {
    return _items.firstWhere(
      (e) => e.location?.dtr == itemCode || e.production?.item == itemCode,
      /*orElse: () => null*/
    );
  }
}
