import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../data/datasources/component_local_data_source.dart';
import '../../data/repositories/component_repository_impl.dart';
import '../../domain/usecases/get_items.dart';
import '../controllers/component_controller.dart';
import '../../../../core/constants/finder_app_colors.dart';
import '../../../../core/constants/sizes.dart';
import 'widgets/component_page_widget.dart';

class ComponentPage extends StatefulWidget {
  const ComponentPage({super.key});

  @override
  State<ComponentPage> createState() => _ComponentPageState();
}

class _ComponentPageState extends State<ComponentPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ComponentController(
        getItemsUseCase: GetItems(
          ComponentRepositoryImpl(
            localDataSource: ComponentLocalDataSourceImpl(),
          ),
        ),
      )..loadItems(),
      child: Scaffold(
        body: Consumer<ComponentController>(
          builder: (context, controller, _) {
            if (controller.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (controller.error.isNotEmpty) {
              return Center(child: Text('Erro: ${controller.error}'));
            }

            return SafeArea(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back_ios_rounded),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                      const Text(
                        'Componentes Double Bin',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 48), // Placeholder for alignment
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Encontre, buscando pelo código DTR do componente.',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: KColors.darkGrey,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextField(
                      controller: controller.searchController,
                      decoration: const InputDecoration(
                        labelText: 'DTR',
                        labelStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: KColors.darkGrey,
                        ),
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.search),
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: controller.search,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          'Total: ${controller.items.length} itens',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: KColors.darkGrey,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: ListView.builder(
                      itemCount: controller.items.length,
                      itemBuilder: (_, index) {
                        final component = controller.items[index]
                            .formatarDescricao();
                        return Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              KSizes.inputFieldRadius,
                            ),
                            border: Border.all(color: KColors.borderPrimary),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                component.descricao,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 2),
                              KBuildComponentInfo(
                                name: component.item,
                                local: component.localReferencia,
                                shelf: component.prateleira,
                                position: component.posicao,
                                flow: component.fluxo,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
