import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/pep_component_controller.dart';
import 'pep_component_detail_page.dart';

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
        body: Consumer<PepComponentController>(
          builder: (context, controller, _) {
            if (controller.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (controller.error.isNotEmpty) {
              return Center(child: Text('Erro: ${controller.error}'));
            }

            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
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
                        const SizedBox(width: 48), // Placeholder for alignment
                      ],
                    ),
                    const Text(
                          'Encontre aqui as informações sobre ferramenta, comprimento de decapagem, posicionamento de matriz e ajuste de ferramenta.\nBasta buscar pelo código DTR do componente.',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey,
                          ),
                        ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextField(
                        controller: controller.searchController,
                        decoration: InputDecoration(
                          hintText: 'Pesquisar...',
                          prefixIcon: const Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        onChanged: controller.search,
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: controller.items.length,
                        itemBuilder: (context, index) {
                          final item = controller.items[index];
                          return Container(
                            margin: const EdgeInsets.all(8),
                            child: ListTile(
                              leading: CircleAvatar(
                                  radius: 30,
                                  child: ClipOval(
                                    child: Image.asset(
                                      item.itemImage,
                                      fit: BoxFit.cover,
                                      width: 60,
                                      height: 60,
                                      errorBuilder: (context, error, stackTrace) {
                                        return const Icon(
                                          Icons.broken_image,
                                          size: 30,
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              title: Text(item.item),
                              subtitle: Text(item.description),
                              trailing: const Icon(Icons.arrow_forward_ios_rounded),
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PepComponentDetailPage(
                                    itemCode: item.item,
                                    description: item.description,
                                    stripping: item.stripping,
                                    itemImage: item.itemImage,
                                    toolCode: item.toolCode,
                                    toolImage: item.toolImage,
                                    turretPositioning: item.turretPositioning,
                                    turretPositioningImage:
                                        item.turretPositioningImage,
                                    toolAdjustment: item.toolAdjustment,
                                    secondToolCode: item.secondToolCode,
                                    secondToolImage: item.secondToolImage,
                                    secondMatrixPositioning:
                                        item.secondMatrixPositioning,
                                    secondMatrixPositioningImage:
                                        item.secondMatrixPositioningImage,
                                    secondToolAdjustment: item.secondToolAdjustment,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
