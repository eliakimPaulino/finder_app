import 'package:finder_app/features/pep_components/presentation/controllers/pep_component_controller.dart';
import 'package:finder_app/features/regular_production_page/presentation/controller/regular_production_page_component_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/routes/finder_app_routes.dart';
import 'core/theme/app_theme.dart';
import 'features/components/data/datasources/component_local_data_source.dart';
import 'features/components/data/repositories/component_repository_impl.dart';
import 'features/components/domain/usecases/get_items.dart';
import 'features/components/presentation/controllers/component_controller.dart';

void main() {
  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) {
            final controller = RegularProductionListProvider();
            controller.addComponentLocationItem(null); // Initialize with null or appropriate value
            return controller;
          },
        ),
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
