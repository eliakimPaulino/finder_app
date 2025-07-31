import 'package:finder_app/features/pep_components/presentation/controllers/pep_component_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/routes/finder_app_routes.dart';
import 'core/theme/app_theme.dart';
import 'features/components/data/datasources/component_local_data_source.dart';
import 'features/components/data/repositories/component_repository_impl.dart';
import 'features/components/domain/usecases/get_items.dart';
import 'features/components/presentation/controllers/component_controller.dart';
import 'features/pep_components/domain/entities/pep_component_entity.dart';
import 'features/production_page/presentation/controller/production_page_component_data_provider.dart';

void main() {
  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductionListProvider()),
        ChangeNotifierProvider(
          create: (_) {
            final controller = PepComponentController(
              getPepItemsUseCase: GetPepItems(
                PepComponentRepositoryImpl(
                  localDataSource: PepComponentLocalDataSourceImpl(),
                ),
              ),
            );
            controller.loadItems();
          },
        ),
        ChangeNotifierProvider(
          create: (_) {
            final controller = ComponentController(
              getItemsUseCase: GetItems(
                ComponentRepositoryImpl(
                  localDataSource: ComponentLocalDataSourceImpl(),
                ),
              ),
            );
            controller
                .loadItems();
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
