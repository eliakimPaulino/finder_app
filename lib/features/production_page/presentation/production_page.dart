import 'package:flutter/material.dart';

class ProductionPage extends StatelessWidget {
  const ProductionPage({super.key});

  @override
  Widget build(BuildContext context) {
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
              Table(
                border: TableBorder.all(color: Colors.grey.shade400),
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                columnWidths: const {
                  0: FixedColumnWidth(100),
                  1: FixedColumnWidth(100),
                  2: FixedColumnWidth(60),
                  3: FixedColumnWidth(80),
                  4: FixedColumnWidth(50),
                },
                children: [
                  _buildHeaderRow(),
                  _buildDataRow(
                    "DTR0000139774",
                    "CONTATO PRATEADO MACHO 1mm² HAN D",
                    "P.S.M.E. Pequenas Sub-Montagens Elétricas",
                    "P275",
                    "FL06",
                  ),
                  _buildDataRow(
                    "DTR0000139774",
                    "CONTATO PRATEADO MACHO 1mm² HAN D",
                    "P.S.M.E. Pequenas Sub-Montagens Elétricas",
                    "P275",
                    "FL06",
                  ),
                  _buildDataRow(
                    "DTR0000139774",
                    "CONTATO PRATEADO MACHO 1mm² HAN D",
                    "P.S.M.E. Pequenas Sub-Montagens Elétricas",
                    "P275",
                    "FL06",
                  ),
                  _buildDataRow(
                    "DTR0000139774",
                    "CONTATO PRATEADO MACHO 1mm² HAN D",
                    "P.S.M.E. Pequenas Sub-Montagens Elétricas",
                    "P275",
                    "FL06",
                  ),
                  _buildDataRow(
                    "DTR0000139774",
                    "CONTATO PRATEADO MACHO 1mm² HAN D",
                    "P.S.M.E. Pequenas Sub-Montagens Elétricas",
                    "P275",
                    "FL06",
                  ),
                  _buildDataRow(
                    "DTR0000139774",
                    "CONTATO PRATEADO MACHO 1mm² HAN D",
                    "P.S.M.E. Pequenas Sub-Montagens Elétricas",
                    "P275",
                    "FL06",
                  ),
                  // ... Adicione as outras linhas
                ],
              ),
              const SizedBox(height: 10),
              const Text(
                'Ferramentas',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 10),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                ),
                itemCount: 4, // Set to the number of tools you want to display
                itemBuilder: (context, index) {
                  return GridTile(
                    header: const GridTileBar(
                      backgroundColor: Colors.black45,
                      // leading: Icon(Icons.engineering_rounded),
                      title: Text('Ferramenta:'),
                    ),
                    // footer: const GridTileBar(backgroundColor: Colors.black45, leading: Icon(Icons.engineering_rounded),),
                    child: Image.asset(
                      'assets/images/tools/09_99_000_0191_harting.png',
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

TableRow _buildHeaderRow() {
  return TableRow(
    decoration: BoxDecoration(color: Colors.blue),
    children: [
      _cell("DTR", isBold: true),
      _cell("DESCRIÇÃO", isBold: true),
      _cell("LOCAL", isBold: true),
      _cell("PRATELEIRA", isBold: true),
      _cell("FLUXO", isBold: true),
    ],
  );
}

TableRow _buildDataRow(
  String dtr,
  String description,
  String local,
  String shelf,
  String flow,
) {
  return TableRow(
    decoration: BoxDecoration(
      color: description.contains("non insulated")
          ? Colors.blue[50]
          : Colors.transparent,
    ),
    children: [
      _cell(dtr),
      _cell(description),
      _cell(local),
      _cell(shelf),
      _cell(flow),
    ],
  );
}

Widget _cell(String text, {bool isBold = false}) {
  return Padding(
    padding: const EdgeInsets.all(6.0),
    child: Text(
      text,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
        fontSize: 14,
      ),
    ),
  );
}
