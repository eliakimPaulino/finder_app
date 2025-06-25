import 'package:flutter/material.dart';

import '../../features/components/presentation/pages/component_page.dart';
import '../../features/main_page/presentation/main_page_presentation.dart';
import '../../features/pep_components/presentation/pages/pep_component_page.dart';

class KFinderAppRoutes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const SelectOptionPage());

      case '/dtr-finder':
        return MaterialPageRoute(builder: (_) => const ComponentPage());

      case '/pep-finder':
        return MaterialPageRoute(builder: (_) => const PepComponentPage());
      
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text('Erro')),
        body: const Center(child: Text('Rota não encontrada')),
      ),
    );
  }
}
