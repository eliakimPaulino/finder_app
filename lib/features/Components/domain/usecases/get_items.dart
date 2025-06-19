import '../entities/item_entity.dart';
import '../repositories/item_repository.dart';

class GetItems {
  final ItemRepository repository;

  GetItems(this.repository);

  Future<List<ItemEntity>> call() async {
    return await repository.getItems();
  }
}
