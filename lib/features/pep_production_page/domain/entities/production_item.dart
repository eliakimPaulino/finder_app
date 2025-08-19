import 'package:finder_app/features/pep_components/domain/entities/pep_component_entity.dart';

import '../../../components/domain/entities/component_entity.dart';

class ProductionItem {
  final ComponentEntity? location;
  final PepComponentEntity? production;

  ProductionItem({
    required this.location,
    required this.production,
  });
}