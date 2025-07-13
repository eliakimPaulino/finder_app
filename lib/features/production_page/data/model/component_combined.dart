import '../../../components/data/models/component_model.dart';
import '../../../pep_components/data/models/pep_component_model.dart';

class ComponentCombined {
  final PepComponentModel? production;
  final ComponentModel? location;

  ComponentCombined({
    required this.production,
    required this.location,
  });
}
