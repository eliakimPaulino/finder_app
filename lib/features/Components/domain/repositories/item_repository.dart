import '../entities/item_entity.dart';

abstract class ComponentRepository {
  Future<List<ComponentEntity>> getItems();
}
