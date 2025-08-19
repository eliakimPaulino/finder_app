// ignore_for_file: deprecated_member_use

import 'package:finder_app/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:finder_app/features/pep_production_page/presentation/controller/pep_production_page_component_data_provider.dart';

class PepProductionPage extends StatelessWidget {
  const PepProductionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    final list = context.watch<PepProductionListProvider>().items;

    /*final seenCodes = <String>{};
    final filteredList = list.where((item) {
      return seenCodes.add(item.production!.toolCode);
    }).toList();*/

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 400),
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
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.expand_circle_down_sharp),
                        onPressed: () {
                          context.read<PepProductionListProvider>().clear();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: KColors.infoSoft,
                              duration: Duration(seconds: 2),
                              content: Text(
                                'Lista foi limpa com sucesso!',
                                style: TextStyle(color: KColors.textWhiteLight),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'Componentes Selecionados:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      headerRow(120, 'DTR'),
                      headerRow(100, 'LOCAL'),
                      headerRow(80, 'PRAT.'),
                      headerRow(50, 'POS.'),
                    ],
                  ),
                  Center(
                    child: SizedBox(
                      height: 200,
                      width: 350,
                      child: SizedBox(
                        height: 200,
                        width: 350,
                        child: Center(
                          child: ListView.builder(
                            itemCount: list.length,
                            itemBuilder: (context, index) {
                              final item = list[index];

                              return tableField(
                                item.location!.dtr,
                                item.location!.referenceLocation,
                                item.location!.shelf,
                                item.location!.position,
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'Ferramentas para producão:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      height: 310,
                      margin: EdgeInsets.only(top: 5, bottom: 5),
                      child: ListView.builder(
                        itemCount: list.length,
                        itemBuilder: (context, index) {
                          final item = list[index];

                          return Container(
                            margin: EdgeInsets.only(top: 4),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                              color: dark ? KColors.darkerGrey : KColors.lightContainer,
                              boxShadow: [
                                BoxShadow(
                                  color:Colors.black.withOpacity(0.1),
                                  blurRadius: 6,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: ListTile(
                              tileColor: Colors.transparent,
                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  item.production!.itemImage,
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              title: Text(item.location!.dtr, style: TextStyle(fontWeight: FontWeight.bold),),
                              subtitle: Text(
                                'Ferramentas:\n• ${item.production!.toolCode}\n• ${item.production!.secondToolCode}',
                              ),
                              trailing: Column(
                                spacing: 4,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(4.0),
                                    child: Image.asset(
                                      item.production!.toolImage,
                                      width: 45,
                                      height: 22,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(4.0),
                                    child: Image.asset(
                                      item.production!.secondToolImage,
                                      width: 45,
                                      height: 22,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Row tableField(String dtr, String local, String shelf, String flow) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            // -- DTR
            Container(
              padding: EdgeInsets.all(2),
              height: 25,
              width: 120,
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(color: Colors.grey.shade400, width: .5),
              ),
              child: Center(child: Text(dtr, style: TextStyle(fontSize: 14))),
            ),

            //-- LOCAL
            Container(
              padding: EdgeInsets.all(3),
              height: 25,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(color: Colors.grey.shade400, width: .5),
              ),
              child: SizedBox(
                width: 85,
                child: Text(
                  local,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ),

            //-- PRATELEIRA
            Container(
              padding: EdgeInsets.all(2),
              height: 25,
              width: 80,
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(color: Colors.grey.shade400, width: .5),
              ),
              child: Center(child: Text(shelf, style: TextStyle(fontSize: 14))),
            ),

            //-- POSICAO
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
