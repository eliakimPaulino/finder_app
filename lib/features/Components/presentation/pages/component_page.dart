import 'package:finder_app/features/Components/data/datasources/component_local_data_source.dart';
import 'package:flutter/material.dart';
import '../../domain/entities/item_entity.dart';
import '../../domain/usecases/get_items.dart';
import '../../data/repositories/component_repository_impl.dart';
import 'widgets/component_page_widget.dart';

class ComponentPage extends StatelessWidget {
  const ComponentPage({super.key});

  @override
  Widget build(BuildContext context) {
    final GetItems getItems = GetItems(
      ComponentRepositoryImpl(localDataSource: ComponentLocalDataSourceImpl()),
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Itens')),
      body: FutureBuilder<List<ComponentEntity>>(
        future: getItems(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          }

          final items = snapshot.data ?? [];
           final itemsTransformados = items.map((item) => item.formatarDescricao()).toList();

          return ListView.builder(
            itemCount: itemsTransformados.length,
            itemBuilder: (_, index) {
              final item = itemsTransformados[index];
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 6,
                      offset: Offset(0, 2),
                    ),
                  ],
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.descricao,
                      style: TextStyle(
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
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
