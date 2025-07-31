// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/sizes.dart';
import '../../../../components/domain/entities/item_entity.dart';
import '../../../../components/presentation/controllers/component_controller.dart';
import '../../../../pep_production_page/presentation/controller/pep_production_page_component_data_provider.dart';
import '../../../domain/entities/pep_component_entity.dart';
import '../pep_component_detail_page.dart';

class KBuildPepComponent extends StatelessWidget {
  final String dtr;
  final String itemImage;
  final String itemName;
  final PepComponentEntity pepComponent;

  // campos necessários pra navegação
  final String stripping;
  final String toolCode;
  final String toolImage;
  final String turretPositioning;
  final String turretPositioningImage;
  final String toolAdjustment;
  final String secondToolCode;
  final String secondToolImage;
  final String secondMatrixPositioning;
  final String secondMatrixPositioningImage;
  final String secondToolAdjustment;

  const KBuildPepComponent({
    super.key,
    required this.dtr,
    required this.itemImage,
    required this.itemName,
    required this.pepComponent,
    // campos necessários pra navegação
    required this.stripping,
    required this.toolCode,
    required this.toolImage,
    required this.turretPositioning,
    required this.turretPositioningImage,
    required this.toolAdjustment,
    required this.secondToolCode,
    required this.secondToolImage,
    required this.secondMatrixPositioning,
    required this.secondMatrixPositioningImage,
    required this.secondToolAdjustment,
  });

  @override
  Widget build(BuildContext context) {
    final dark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: dark ? KColors.darkContainer : KColors.lightContainer,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                spacing: 20,
                children: [
                  // -- Imagem
                  Row(
                    children: [
                      Center(
                        child: GestureDetector(
                          onTap: () => moveToDetailPage(),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              itemImage,
                              height: 90,
                              width: 90,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // -- DTR do componente
                          Text(
                            pepComponent.item,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: KSizes.fontSizeMd,
                              color: dark
                                  ? KColors.textPrimaryDark
                                  : KColors.textPrimaryLight,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: KSizes.sm),
                          SizedBox(
                            width: 150,
                            child: Text(
                              pepComponent.description,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(
                                fontSize: KSizes.fontSizeSm,
                                color: dark
                                    ? KColors.textSecondaryDark
                                    : KColors.textSecondaryLight,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(context, moveToDetailPage());
                            },
                            child: Text(
                              'Toque para saber mais',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(
                                fontSize: KSizes.fontSizeSm,
                                color: dark
                                    ? KColors.textSecondaryDark
                                    : KColors.textSecondaryLight,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Positioned(
                top: 2,
                right: 5,
                child: FloatingActionButton.small(
                  backgroundColor: dark
                      ? KColors.darkerGrey
                      : KColors.lightGrey,
                  tooltip: 'Adicionar à Lista de Produção',
                  onPressed: () async {
                    final componentController = context
                        .read<ComponentController>();

                    ComponentEntity? component;

                    await Future.delayed(Duration(milliseconds: 200));
                    try {
                      print(
                        'Itens no controller: ${componentController.items.length}',
                      );
                      print('Buscando por item: ${pepComponent.item}');
                      component = componentController.items.firstWhere(
                        (c) => c.item == pepComponent.item,
                      );
                    } catch (_) {
                      component = null;
                    }

                    if (component != null) {
                      context.read<PepProductionListProvider>().addItem(
                        component,
                        pepComponent,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: KColors.successPrimary,
                          duration: Duration(seconds: 1),
                          content: Text(
                            '${pepComponent.item} adicionado com sucesso!',
                            style: TextStyle(
                              color: KColors.textWhiteLight,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: KColors.errorSoft,
                          duration: Duration(seconds: 1),
                          content: Text(
                            'Componente não encontrado.',
                            style: TextStyle(color: KColors.textWhiteLight),
                          ),
                        ),
                      );
                    }
                  },
                  child: const Icon(Icons.add),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  MaterialPageRoute<dynamic> moveToDetailPage() {
    return MaterialPageRoute(
      builder: (context) => PepComponentDetailPage(
        itemCode: dtr,
        description: itemName,
        stripping: stripping,
        itemImage: itemImage,
        toolCode: toolCode,
        toolImage: toolImage,
        turretPositioning: turretPositioning,
        turretPositioningImage: turretPositioningImage,
        toolAdjustment: toolAdjustment,
        secondToolCode: secondToolCode,
        secondToolImage: secondToolImage,
        secondMatrixPositioning: secondMatrixPositioning,
        secondMatrixPositioningImage: secondMatrixPositioningImage,
        secondToolAdjustment: secondToolAdjustment,
      ),
    );
  }
}
