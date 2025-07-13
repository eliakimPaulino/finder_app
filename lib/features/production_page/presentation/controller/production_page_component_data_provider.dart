import 'package:finder_app/features/pep_components/domain/entities/pep_component_entity.dart';
import 'package:flutter/material.dart';

import '../../../components/domain/entities/item_entity.dart';
import '../../domain/entities/production_item.dart';

class ProductionListProvider extends ChangeNotifier {
  final List<ProductionItem> _items = [];

  List<ProductionItem> get items => _items;

  void addItem(ComponentEntity? location, PepComponentEntity? production) {
    final itemCode = location?.item ?? production?.item;
    final alreadyExists = _items.any((e) =>
        e.location?.item == itemCode || e.production?.item == itemCode);

    if (!alreadyExists) {
      _items.add(ProductionItem(location: location, production: production));
      notifyListeners();
    }
  }

  void removeItem(String itemCode) {
    _items.removeWhere((e) =>
        e.location?.item == itemCode || e.production?.item == itemCode);
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

