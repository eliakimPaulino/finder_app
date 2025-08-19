import 'package:finder_app/features/components/domain/entities/component_entity.dart';
import 'package:flutter/material.dart';

class RegularProductionListProvider extends ChangeNotifier {
  final List<ComponentEntity> _componentList = [];

  List<ComponentEntity> get componentList => _componentList;

  void addComponentLocationItem(ComponentEntity? location) {
    // final componentCode = location?.dtr;
    final alreadyExists = _componentList.any(
      (component) =>
          component.dtr == location!.dtr &&
          component.position == location.position &&
          component.shelf == location.shelf,
    );

    if (!alreadyExists && location != null) {
      _componentList.add(
        ComponentEntity(
          area: location.area,
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

  void removeItem(String itemCode) {
    _componentList.removeWhere((component) => component.dtr == itemCode);
    notifyListeners();
  }

  void clear() {
    _componentList.clear();
    notifyListeners();
  }
}
