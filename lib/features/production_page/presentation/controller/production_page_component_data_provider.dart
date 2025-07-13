import 'package:finder_app/features/production_page/data/model/component_combined.dart';
import 'package:flutter/material.dart';

import '../../../components/data/models/component_model.dart';
import '../../../pep_components/data/models/pep_component_model.dart';

class ProductionListProvider extends ChangeNotifier {
  final List<ComponentCombined> _items = [];

  List<ComponentCombined> get items => _items;

  void addItem(ComponentModel? location, PepComponentModel? production) {
    final alreadyExists = _items.any((e) =>
        e.location?.item == location?.item || e.production?.item == production?.item);
    if (!alreadyExists) {
      _items.add(ComponentCombined(location: location, production: production));
      notifyListeners();
    }
  }

  void removeItem(String itemCode) {
    _items.removeWhere((e) => e.location?.item == itemCode || e.production?.item == itemCode);
    notifyListeners();
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }
}
