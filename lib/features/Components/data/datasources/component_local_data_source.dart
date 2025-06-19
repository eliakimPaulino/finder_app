import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/item_model.dart';

abstract class ItemLocalDataSource {
  Future<List<ItemModel>> getItemsFromJson();
}

class ItemLocalDataSourceImpl implements ItemLocalDataSource {
  @override
  Future<List<ItemModel>> getItemsFromJson() async {
    final String response = await rootBundle.loadString('assets/data/items.json');
    final List<dynamic> data = json.decode(response);

    return data.map((json) => ItemModel.fromJson(json)).toList();
  }
}
