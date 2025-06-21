import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/datasources/component_local_data_source.dart';
import '../../data/repositories/component_repository_impl.dart';
import '../../domain/usecases/get_items.dart';
import '../controllers/component_controller.dart';
import '../../../../core/constants/finder_app_colors.dart';
import '../../../../core/constants/sizes.dart';
import 'widgets/component_page_widget.dart';

class ComponentPage extends StatelessWidget {
  const ComponentPage({super.key});

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
        appBar: AppBar(title: const Text('Itens')),
        body: Consumer<ComponentController>(
          builder: (context, controller, _) {
            if (controller.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (controller.error.isNotEmpty) {
              return Center(child: Text('Erro: ${controller.error}'));
            }

            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    controller: controller.searchController,
                    decoration: const InputDecoration(
                      labelText: 'DTR',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.search),
                    ),
                    onChanged: controller.search,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: controller.items.length,
                    itemBuilder: (_, index) {
                      final item = controller.items[index].formatarDescricao();
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
                          boxShadow: [
                            const BoxShadow(
                              blurRadius: 6,
                              offset: Offset(0, 2),
                            ),
                          ],
                          border: Border.all(color: KColors.darkGrey),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.descricao,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            KBuildInfoGroup(
                              infoMap: {
                                'Item': item.item,
                                'Local Referência': item.localReferencia,
                                'Prateleira': item.prateleira,
                                'Posição': item.posicao,
                                'Fluxo': item.fluxo,
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
