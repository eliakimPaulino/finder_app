import 'package:flutter/material.dart';
import '../../domain/entities/item_entity.dart';
import '../../domain/usecases/get_items.dart';
import '../../data/repositories/item_repository_impl.dart';

class ItemPage extends StatelessWidget {
  const ItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    final GetItems getItems = GetItems(ItemRepositoryImpl());

    return Scaffold(
      appBar: AppBar(title: const Text('Itens')),
      body: FutureBuilder<List<ItemEntity>>(
        future: getItems(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          }

          final items = snapshot.data ?? [];

          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (_, index) {
              final item = items[index];
              return ListTile(
                title: Text(item.descricao),
                subtitle: Text('Projeto: ${item.projeto} - Posição: ${item.posicao}'),
              );
            },
          );
        },
      ),
    );
  }
}
