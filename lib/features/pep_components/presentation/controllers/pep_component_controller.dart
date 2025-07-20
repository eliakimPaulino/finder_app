import 'dart:convert';

import 'package:finder_app/features/pep_components/domain/entities/pep_component_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// camada controller para gerenciar o estado dos componentes PEP
class PepComponentController extends ChangeNotifier{
  final GetPepItems getPepItemsUseCase;

  PepComponentController({required this.getPepItemsUseCase});

  final TextEditingController searchController = TextEditingController();

  List<PepComponentEntity> _allItems = [];
  List<PepComponentEntity> _filteredItems = [];
  bool _isLoading = true;
  String _error = '';

  List<PepComponentEntity> get items => _filteredItems;
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

// --

// camada usecase para buscar os componentes PEP
class GetPepItems {
  final PepComponentRepository repository;

  GetPepItems(this.repository);
  Future<List<PepComponentEntity>> call() async {

    return await repository.getPepItems();
  }
}

//--

/* camada repository para interagir com a fonte de dados */
class PepComponentRepository {
  Future<List<PepComponentEntity>> getPepItems() async {

    return [];
  }
}

class PepComponentRepositoryImpl implements PepComponentRepository {
  final PepComponentLocalDataSource localDataSource;

  PepComponentRepositoryImpl({required this.localDataSource});

  @override
  Future<List<PepComponentEntity>> getPepItems() async {
    return await localDataSource.getPepItemsFromJson();
  }
}

// --

abstract class PepComponentLocalDataSource {
  Future<List<PepComponentEntity>> getPepItemsFromJson();
}

// camada local datasource para carregar os componentes PEP de um arquivo JSON
class PepComponentLocalDataSourceImpl implements PepComponentLocalDataSource{
  @override
  Future<List<PepComponentEntity>> getPepItemsFromJson() async {
    final String response = await rootBundle.loadString('assets/data/pep/pep_440_rev6.json');
    final List<dynamic> data = json.decode(response);

    return data.map((json) => PepComponentEntity.fromJson(json)).toList();
  }
}