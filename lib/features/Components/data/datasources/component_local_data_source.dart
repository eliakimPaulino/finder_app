import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/item_model.dart';

abstract class ComponentLocalDataSource {
  Future<List<ComponentModel>> getItemsFromJson();
}

class ComponentLocalDataSourceImpl implements ComponentLocalDataSource {
  @override
  Future<List<ComponentModel>> getItemsFromJson() async {
    final String response = await rootBundle.loadString('assets/data/psme_components/psme_components.json');
    final List<dynamic> data = json.decode(response);

    return data.map((json) => ComponentModel.fromJson(json)).toList();
  }
}
