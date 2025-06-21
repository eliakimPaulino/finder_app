import 'package:finder_app/features/Components/data/datasources/component_local_data_source.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/finder_app_colors.dart';
import '../../../../core/constants/sizes.dart';
import '../../domain/entities/item_entity.dart';
import '../../domain/usecases/get_items.dart';
import '../../data/repositories/component_repository_impl.dart';
import 'widgets/component_page_widget.dart';

class ComponentPage extends StatefulWidget {
  const ComponentPage({super.key});

  @override
  State<ComponentPage> createState() => _ComponentPageState();
}

class _ComponentPageState extends State<ComponentPage> {
  final GetItems getItems = GetItems(
    ComponentRepositoryImpl(localDataSource: ComponentLocalDataSourceImpl()),
  );

  final TextEditingController searchController = TextEditingController();

  List<ComponentEntity> _allItems = [];
  List<ComponentEntity> _filteredItems = [];
  bool _isLoading = true;
  String _error = '';

  @override
  void initState() {
    super.initState();
    _fetchItems();
  }

  Future<void> _fetchItems() async {
    try {
      final items = await getItems();
      setState(() {
        _allItems = items;
        _filteredItems = items;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }

  void searchComponent(String query) {
    final filtered = _allItems.where((item) {
      final codigoItem = item.item.toLowerCase();
      final search = query.toLowerCase();
      return codigoItem.contains(search);
    }).toList();

    setState(() {
      _filteredItems = filtered;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Itens')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: searchController,
              decoration: const InputDecoration(
                labelText: 'Buscar',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: searchComponent,
            ),
          ),
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : _error.isNotEmpty
                ? Center(child: Text('Erro: $_error'))
                : ListView.builder(
                    itemCount: _filteredItems.length,
                    itemBuilder: (_, index) {
                      final item = _filteredItems[index].formatarDescricao();
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
                              },
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
  }
}
