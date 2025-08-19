import '../entities/component_entity.dart';
import '../repositories/item_repository.dart';

class GetItems {
  final ComponentRepository repository;

  GetItems(this.repository);

  Future<List<ComponentEntity>> call() async {
    return await repository.getItems();
  }
}
