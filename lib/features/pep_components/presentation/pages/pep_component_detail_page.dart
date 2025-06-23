import 'package:flutter/material.dart';

import '../../domain/entities/pep_component_entity.dart';

class PepComponentDetailPage extends StatelessWidget {
  final String itemCode;
  final String description;
  final String stripping;
  final String itemImage;
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

  const PepComponentDetailPage({
    super.key,
    required this.itemCode,
    required this.description,
    required this.stripping,
    required this.itemImage,
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
    return Scaffold(
      appBar: AppBar(
        title: const Text("Component Details"),
        leading: const BackButton(),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                    16,
                  ), // Ajuste o raio como quiser
                  child: Image.asset(
                    itemImage,
                    height: 200,
                    width: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "DTR: $itemCode",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Text(
                "Descrição: $description",
                style: const TextStyle(color: Colors.grey, fontSize: 14),
              ),
              Text(
                "Decapagem: $stripping",
                style: const TextStyle(color: Colors.grey, fontSize: 14),
              ),
              const SizedBox(height: 12),
              // const Text(
              //   "Ferramenta(s)",
              //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              // ),
              // const SizedBox(height: 8),
              const Divider(),

              /// Tabela de dois blocos lado a lado
              _buildToolingTable(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildToolingTable(BuildContext context) {
    // final entries = [
    //   ["Imagem da Ferramenta", toolImage,"Código da Ferramenta", toolCode],
    //   ["Posicionador Tourret", turretPositioning, "Imagem Posicionador", turretPositioningImage],
    //   ["Ajuste de Ferramenta", "Ajuste: $toolAdjustment", "Código Segunda Ferramenta", secondToolCode],
    //   ["Imagem Segunda Ferramenta", secondToolImage, "Segunda Matriz de Posicionamento", secondMatrixPositioning],
    //   ["Imagem Segunda Matriz de Posicionamento", secondMatrixPositioningImage, "Ajuste Segunda Ferramenta", "Ajuste: $secondToolAdjustment"],
    // ];
    final entries = [
      ["", toolImage, "", secondToolImage],
      ["Ferramenta", toolCode, "Ferramenta", secondToolCode],
      ["Ajuste", toolAdjustment, "Ajuste", secondToolAdjustment],
      [
        "Posicionador Tourret",
        turretPositioning,
        "Posicionador Tourret",
        secondMatrixPositioning,
      ],
      [
        "Imagem Posicionador",
        turretPositioningImage,
        "Imagem Posicionador",
        secondMatrixPositioningImage,
      ],
    ];

    return Column(
      children: entries.map((e) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(width: 20),
              Expanded(child: _buildLabelValue(e[0], e[1])),
              const SizedBox(width: 30),
              Expanded(child: _buildLabelValue(e[2], e[3])),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildLabelValue(String label, String value) {
    final isImage = value.endsWith('.png');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.blueGrey,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        isImage
            ?
              // CircleAvatar(
              //     radius: 35,
              //     child: ClipOval(
              //       child: Image.asset(
              //         value,
              //         height: 70,
              //         width: 70,
              //         fit: BoxFit.cover,
              //         errorBuilder: (_, __, ___) => const Text(
              //           "Sem imagem",
              //           style: TextStyle(fontSize: 12),
              //         ),
              //       ),
              //     ),
              //   )
              ClipRRect(
                borderRadius: BorderRadius.circular(
                  12,
                ), // Raio da borda arredondada
                child: Image.asset(
                  value,
                  width: 120,
                  height: 70,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    width: 70,
                    height: 70,
                    color: Colors.grey.shade300,
                    alignment: Alignment.center,
                    child: const Text(
                      "Sem imagem",
                      style: TextStyle(fontSize: 12),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              )
            : Text(value, style: const TextStyle(fontSize: 14)),
      ],
    );
  }
}
