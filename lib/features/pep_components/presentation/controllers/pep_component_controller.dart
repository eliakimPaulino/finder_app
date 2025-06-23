import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../data/models/pep_component_model.dart';

// camada controller para gerenciar o estado dos componentes PEP
class PepComponentController extends ChangeNotifier{
  final GetPepItems getPepItemsUseCase;

  PepComponentController({required this.getPepItemsUseCase});

  final TextEditingController searchController = TextEditingController();

  List<PepComponentModel> _allItems = [];
  List<PepComponentModel> _filteredItems = [];
  bool _isLoading = true;
  String _error = '';

  List<PepComponentModel> get items => _filteredItems;
  bool get isLoading => _isLoading;
  String get error => _error;

  Future<void> loadItems() async {
    _isLoading = true;
    notifyListeners();

    try {
      final items = await getPepItemsUseCase();
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
        .where((item) => item.item.toLowerCase().contains(query.toLowerCase()))
        .toList();
    notifyListeners();
  }
}

// camada usecase para buscar os componentes PEP
class GetPepItems {
  final PepComponentRepository repository;

  GetPepItems(this.repository);
  Future<List<PepComponentModel>> call() async {
    // This method should be implemented to fetch PEP components.

    return await repository.getPepItems();
  }
}

// camada repository para interagir com a fonte de dados
class PepComponentRepository {
  // This class should be implemented to interact with the data source.
  Future<List<PepComponentModel>> getPepItems() async {
    // This method should be implemented to fetch PEP components.

    return [];
  }
}

class PepComponentRepositoryImpl implements PepComponentRepository {
  final PepComponentLocalDataSource localDataSource;

  PepComponentRepositoryImpl({required this.localDataSource});

  @override
  Future<List<PepComponentModel>> getPepItems() async {
    // This method should be implemented to fetch PEP components from the local data source.
    return await localDataSource.getPepItemsFromJson();
  }
}

abstract class PepComponentLocalDataSource {
  // This class should be implemented to define the local data source methods.
  Future<List<PepComponentModel>> getPepItemsFromJson();
}

// camada local datasource para carregar os componentes PEP de um arquivo JSON
class PepComponentLocalDataSourceImpl implements PepComponentLocalDataSource{
  @override
  Future<List<PepComponentModel>> getPepItemsFromJson() async {
    // This method should be implemented to load PEP components from a JSON file.
    final String response = await rootBundle.loadString('assets/data/pep/pep_440_rev6.json');
    final List<dynamic> data = json.decode(response);

    return data.map((json) => PepComponentModel.fromJson(json)).toList();
  }
}