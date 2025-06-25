import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/routes/finder_app_routes.dart';
import 'core/theme/app_theme.dart';
import 'features/components/data/datasources/component_local_data_source.dart';
import 'features/components/data/repositories/component_repository_impl.dart';
import 'features/components/domain/usecases/get_items.dart';
import 'features/components/presentation/controllers/component_controller.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) {
            final controller = ComponentController(
              getItemsUseCase: GetItems(
                ComponentRepositoryImpl(
                  localDataSource: ComponentLocalDataSourceImpl(),
                ),
              ),
            );
            controller.loadItems(); // Chamada fora do construtor, para evitar problemas de ciclo de vida
            // Garante que a lista de itens seja carregada antes de ser usada na UI
            return controller;
          },
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Components Page',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      onGenerateRoute: KFinderAppRoutes.onGenerateRoute,
      initialRoute: '/',
    );
  }
}
