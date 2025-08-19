import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/colors.dart';
import 'regular_production_page_component_data_provider.dart';

class RegularProductionPage extends StatelessWidget {
  const RegularProductionPage({super.key});

  @override
  Widget build(BuildContext context) {
    // final dark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    final list = context.watch<RegularProductionListProvider>().componentList;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
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
                        context.read<RegularProductionListProvider>().clear();
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
                              final component = list[index];

                              return tableField(
                                component.dtr,
                                component.referenceLocation,
                                component.shelf,
                                component.position,
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
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
}
