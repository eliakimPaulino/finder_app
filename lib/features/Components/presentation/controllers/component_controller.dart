import 'package:flutter/material.dart';
import '../../domain/entities/component_entity.dart';
import '../../domain/usecases/get_items.dart';

class ComponentController extends ChangeNotifier {
  final GetItems getItemsUseCase;

  ComponentController({required this.getItemsUseCase});

  final TextEditingController searchController = TextEditingController();

  List<ComponentEntity> _allItems = [];
  List<ComponentEntity> _filteredItems = [];
  bool _isLoading = true;
  String _error = '';

  List<ComponentEntity> get items => _filteredItems;
  bool get isLoading => _isLoading;
  String get error => _error;

  Future<void> loadItems() async {
    _isLoading = true;
    notifyListeners();

    try {
      final items = await getItemsUseCase();
      _allItems = items;
      _filteredItems = items;
      _error = '';
    } catch (e) {
      _error = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }

  void search(String query) {
    _filteredItems = _allItems
        .where((item) => item.dtr.toLowerCase().contains(query))
        .toList();
    notifyListeners();
  }
}
