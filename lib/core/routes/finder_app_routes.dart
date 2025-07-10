import 'package:finder_app/features/production_page/presentation/production_page.dart';
import 'package:flutter/material.dart';

import '../../features/authentication/presentation/page/login.dart';
import '../../features/components/presentation/pages/component_page.dart';
import '../../features/main_page/presentation/main_page_presentation.dart';
import '../../features/pep_components/presentation/pages/pep_component_page.dart';

class KFinderAppRoutes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      case '/':
        return MaterialPageRoute(builder: (_) => const SelectOptionPage());

      case '/dtr-finder':
        return MaterialPageRoute(builder: (_) => const ComponentPage());

      case '/pep-finder':
        return MaterialPageRoute(builder: (_) => const PepComponentPage());

      case '/production-page':
        return MaterialPageRoute(builder: (_) => const ProductionPage());

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
