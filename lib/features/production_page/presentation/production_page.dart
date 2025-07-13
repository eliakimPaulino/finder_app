// ignore_for_file: deprecated_member_use

import 'package:finder_app/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:finder_app/features/production_page/presentation/controller/production_page_component_data_provider.dart';

class ProductionPage extends StatelessWidget {
  const ProductionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final list = context.watch<ProductionListProvider>().items;

    final seenCodes = <String>{};
    final filteredList = list.where((item) {
      return seenCodes.add(item.production!.toolCode);
    }).toList();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios_rounded),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  const Text(
                    'Lista de Produção',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                  ),
                  IconButton(
                    icon: const Icon(Icons.expand_circle_down_sharp),
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(height: 15),
              const Text(
                'Componentes Selecionados:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  headerRow(100, 'DTR'),
                  headerRow(100, 'DESCRIÇÃO'),
                  headerRow(90, 'LOCAL'),
                  headerRow(50, 'PRAT.'),
                  headerRow(50, 'POS.'),
                ],
              ),
              Flexible(
                child: SizedBox(
                  height: 200,
                  child: ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      final item = list[index];

                      return tableField(
                        item.location!.item,
                        item.location!.descricao,
                        item.location!.localReferencia,
                        item.location!.prateleira,
                        item.location!.posicao,
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'Ferramentas para producão:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              // const SizedBox(height: 10),
              Flexible(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      margin: EdgeInsets.all(5),
                      width: MediaQuery.of(context).size.width / 2.5,
                      child: ListView.builder(
                        itemCount: filteredList.length,
                        itemBuilder: (context, index) {
                          final item = filteredList[index];

                          return Visibility(
                            visible: item.production!.toolImage.contains('N/A')
                                ? false
                                : true,
                            child: Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              clipBehavior: Clip.hardEdge,
                              child: Stack(
                                children: [
                                  // 🔹 Imagem de fundo
                                  Positioned.fill(
                                    child: Image.asset(
                                      item
                                          .production!
                                          .toolImage, // coloque o caminho da sua imagem aqui
                                      fit: BoxFit.contain,
                                    ),
                                  ),

                                  // 🔸 Gradiente escuro na base
                                  Positioned.fill(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Colors.transparent,
                                            Colors.black.withOpacity(0.6),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),

                                  // 🔸 Texto posicionado
                                  Positioned(
                                    left: 10,
                                    bottom: 10,
                                    child: Text(
                                      item.production!.toolCode,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    // --
                    Container(
                      margin: EdgeInsets.all(5),
                      width: MediaQuery.of(context).size.width / 2.5,
                      child: ListView.builder(
                        itemCount: filteredList
                            .length, // Set to the number of tools you want to display
                        itemBuilder: (context, index) {
                          final item = filteredList[index];

                          return Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            clipBehavior: Clip.hardEdge,
                            child: Visibility(
                              visible: !(item.production?.secondToolImage.contains('N') ?? true),
                              child: Stack(
                                children: [
                                  // 🔹 Imagem de fundo
                                  Positioned.fill(
                                    child: Image.asset(
                                      item
                                          .production!
                                          .secondToolImage, // coloque o caminho da sua imagem aqui
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                              
                                  // 🔸 Gradiente escuro na base
                                  Positioned.fill(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Colors.transparent,
                                            Colors.black.withOpacity(0.6),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                              
                                  // 🔸 Texto posicionado
                                  Positioned(
                                    left: 10,
                                    bottom: 10,
                                    child: Text(
                                      item.production!.secondToolCode,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row tableField(
    String dtr,
    String description,
    String local,
    String shelf,
    String flow,
  ) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(2),
          height: 25,
          width: 100,
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(color: Colors.grey.shade400, width: .5),
          ),
          child: Center(child: Text(dtr, style: TextStyle(fontSize: 14))),
        ),
        Container(
          padding: EdgeInsets.all(2),
          height: 25,
          width: 100,
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(color: Colors.grey.shade400, width: .5),
          ),
          child: Center(
            child: Text(
              description,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 14),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(2),
          height: 25,
          width: 90,
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(color: Colors.grey.shade400, width: .5),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 85,
                  child: Text(
                    local,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(2),
          height: 25,
          width: 50,
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(color: Colors.grey.shade400, width: .5),
          ),
          child: Center(child: Text(shelf, style: TextStyle(fontSize: 14))),
        ),
        Container(
          padding: EdgeInsets.all(2),
          height: 25,
          width: 50,
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(color: Colors.grey.shade400, width: .5),
          ),
          child: Center(child: Text(flow, style: TextStyle(fontSize: 14))),
        ),
      ],
    );
  }

  Container headerRow(double width, String columnName) {
    return Container(
      height: 25,
      width: width,
      decoration: BoxDecoration(
        color: Colors.blue,
        border: Border.all(color: Colors.grey.shade400, width: .5),
      ),
      child: Center(
        child: Text(
          columnName,
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
