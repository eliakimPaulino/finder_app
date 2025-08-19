import '../entities/component_entity.dart';

abstract class ComponentRepository {
  Future<List<ComponentEntity>> getItems();
}
