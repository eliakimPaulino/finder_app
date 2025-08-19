// ignore_for_file: deprecated_member_use

import 'package:finder_app/features/regular_production_page/presentation/controller/regular_production_page_component_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../../common/widgets/buttons/common_buttons.dart';
import '../../../../core/constants/sizes.dart';
import '../../data/datasources/component_local_data_source.dart';
import '../../data/repositories/component_repository_impl.dart';
// import '../../domain/entities/component_entity.dart';
import '../../domain/usecases/get_items.dart';
import '../controllers/component_controller.dart';
import '../../../../core/constants/colors.dart';
import 'widgets/component_page_widget.dart';

class ComponentPage extends StatefulWidget {
  const ComponentPage({super.key});

  @override
  State<ComponentPage> createState() => _ComponentPageState();
}

class _ComponentPageState extends State<ComponentPage> {
  @override
  Widget build(BuildContext context) {
    final dark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    // Usando ChangeNotifierProvider para fornecer o ComponentController
    // e carregar os itens assim que a página for construída.
    return ChangeNotifierProvider(
      create: (_) => ComponentController(
        getItemsUseCase: GetItems(
          ComponentRepositoryImpl(
            localDataSource: ComponentLocalDataSourceImpl(),
          ),
        ),
      )..loadItems(),
      child: Scaffold(
        body: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () => FocusScope.of(context).unfocus(),
          child: Consumer<ComponentController>(
            builder: (context, controller, _) {
              if (controller.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (controller.error.isNotEmpty) {
                return Center(child: Text('Erro: ${controller.error}'));
              }

              return SafeArea(
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 600),
                    child: Column(
                      children: [
                        const SizedBox(height: 16),
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
                            const SizedBox(
                              width: 48,
                            ), // Placeholder for alignment
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Encontre o componente pelo código DTR.',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: dark
                                ? KColors.textPrimaryDark
                                : KColors.textPrimaryLight,
                          ),
                        ),
                        Text(
                          'Lista atualizada em 25/07/2025',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: dark
                                ? KColors.buttonSecondary
                                : KColors.darkBackground,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: TextField(
                            controller: controller.searchController,
                            decoration: InputDecoration(
                              labelText: 'DTR',
                              labelStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: dark
                                    ? KColors.textPrimaryDark
                                    : KColors.textPrimaryLight,
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16.0,
                              ),
                              child: Text(
                                'Total: ${controller.items.length} itens',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: dark
                                      ? KColors.textPrimaryDark
                                      : KColors.textPrimaryLight,
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
                              final component = controller.items[index];
                                  // .formatarDescricao();
                              return Container(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 8,
                                ),
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: dark
                                      ? KColors.darkContainer
                                      : KColors.lightContainer,
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 6,
                                      offset: Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      right: 5,
                                      top: 5,
                                      child: FloatingActionButton.small(
                                        backgroundColor: dark
                                            ? KColors.darkerGrey
                                            : KColors.lightGrey,
                                        tooltip:
                                            'Adicionar à Lista de Produção',
                                        onPressed: () {
                                          final componentController = context
                                              .read<
                                                RegularProductionListProvider
                                              >();

                                          final components = componentController
                                              .componentList
                                              .where(
                                                (c) => c.dtr == component.dtr,
                                              )
                                              .toList();

                                          for (var component in components) {
                                            context
                                                .read<
                                                  RegularProductionListProvider
                                                >()
                                                .addComponentLocationItem(
                                                  component,
                                                );

                                            ScaffoldMessenger.of(
                                              context,
                                            ).showSnackBar(
                                              SnackBar(
                                                backgroundColor:
                                                    KColors.successPrimary,
                                                duration: const Duration(
                                                  seconds: 1,
                                                ),
                                                content: Text(
                                                  '${component.dtr} adicionado com sucesso!',
                                                  style: const TextStyle(
                                                    color:
                                                        KColors.textWhiteLight,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }

                                          context
                                              .read<
                                                RegularProductionListProvider
                                              >()
                                              .addComponentLocationItem(
                                                component,
                                              );
                                        },
                                        child: const Icon(Icons.add),
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          component.description,
                                          style: const TextStyle(
                                            fontSize: KSizes.fontSizeLg,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          component.dtr,
                                          style: const TextStyle(
                                            fontSize: KSizes.fontSizeLg,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        KBuildComponentInfo(
                                          location: component.referenceLocation,
                                          shelf: component.shelf,
                                          position: component.position,
                                        ),
                                      ],
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
              );
            },
          ),
        ),
        floatingActionButton: KFloatingActionButton(
          routeName: '/production-page',
        ),
      ),
    );
  }
}
