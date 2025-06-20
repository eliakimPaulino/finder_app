import '../../domain/entities/item_entity.dart';
import '../../domain/repositories/item_repository.dart';
import '../datasources/component_local_data_source.dart';

class ComponentRepositoryImpl implements ComponentRepository {
  final ComponentLocalDataSource localDataSource;

  ComponentRepositoryImpl({required this.localDataSource});

  @override
  Future<List<ComponentEntity>> getItems() async {
    return await localDataSource.getItemsFromJson();
  }
}
