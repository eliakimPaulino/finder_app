import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/pep_component_model.dart';

abstract class PepLocalComponentDatasource {
  Future<List<PepComponentModel>> getAllComponents();
}

class LocalComponentDatasourceImpl implements PepLocalComponentDatasource {
  @override
  Future<List<PepComponentModel>> getAllComponents() async {
    final data = await rootBundle.loadString('assets/data/pep/pep_449_rev6.json');
    final decoded = jsonDecode(data) as List;
    return decoded.map((e) => PepComponentModel.fromJson(e)).toList();
  }
}
