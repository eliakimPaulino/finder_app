import 'package:finder_app/features/components/data/models/component_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../../../common/widgets/buttons/common_buttons.dart';
import '../../../../core/constants/colors.dart';
import '../controllers/pep_component_controller.dart';
import 'widgets/pepe_component_page_widget.dart';

class PepComponentPage extends StatefulWidget {
  const PepComponentPage({super.key});

  @override
  State<PepComponentPage> createState() => _PepComponentPageState();
}

class _PepComponentPageState extends State<PepComponentPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PepComponentController(
        getPepItemsUseCase: GetPepItems(
          PepComponentRepositoryImpl(
            localDataSource: PepComponentLocalDataSourceImpl(),
          ),
        ),
      )..loadItems(),
      child: Scaffold(
        body: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () => FocusScope.of(context).unfocus(),
          child: Consumer<PepComponentController>(
            builder: (context, controller, _) {
              if (controller.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (controller.error.isNotEmpty) {
                return Center(child: Text('Erro: ${controller.error}'));
              }

              return SafeArea(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 600),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 8.0,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.arrow_back_ios_rounded),
                                onPressed: () => Navigator.of(context).pop(),
                              ),
                              const Text(
                                'Componentes PEP',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(
                                width: 48,
                              ), // Placeholder for alignment
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12.0,
                            ),
                            child: const Text(
                              'Encontre as informações sobre ferramenta, comprimento de decapagem, posicionamento de matriz e ajuste de ferramenta.\nBasta buscar pelo código DTR do componente.',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
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
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16.0,
                            ),
                            child: Text(
                              'Total: ${controller.items.length} itens',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: KColors.darkGrey,
                              ),
                            ),
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount: controller.items.length,
                              itemBuilder: (context, index) {
                                final item = controller.items[index];
                                return SizedBox(
                                  child: Column(
                                    children: [
                                      KBuildPepComponent(
                                        dtr: item.item,
                                        itemName: item.description,
                                        itemImage: item.itemImage,
                                        stripping: item.stripping,
                                        toolCode: item.toolCode,
                                        toolImage: item.toolImage,
                                        turretPositioning:
                                            item.turretPositioning,
                                        turretPositioningImage:
                                            item.turretPositioningImage,
                                        toolAdjustment: item.toolAdjustment,
                                        secondToolCode: item.secondToolCode,
                                        secondToolImage: item.secondToolImage,
                                        secondMatrixPositioning:
                                            item.secondMatrixPositioning,
                                        secondMatrixPositioningImage:
                                            item.secondMatrixPositioningImage,
                                        secondToolAdjustment:
                                            item.secondToolAdjustment,
                                            location: item as ComponentModel,
                                            production: item,
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        floatingActionButton: KFloatingActionButton(),
      ),
    );
  }
}
