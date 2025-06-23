import 'package:flutter/material.dart';

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
      // appBar: AppBar(
      //   title: const Text("Component Details"),
      //   leading: const Icon(Icons.arrow_back_ios_rounded),
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
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
                    "Detalhes do Terminal",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 48), // Espaço para o ícone de voltar
                ],
              ),
              const SizedBox(height: 16),
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
              const SizedBox(height: 12),
              Text(
                itemCode,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Text(
                "Descrição: $description",
                style: const TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "Decapagem: $stripping",
                style: const TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 16),
              const Divider(),
              const Text(
                "Para crimpagem use as seguintes ferramentas:",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              // const SizedBox(height: 8),

              /// Tabela de dois blocos lado a lado
              _buildToolingTable(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildToolingTable(BuildContext context) {
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
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 4),
        isImage
            ? ClipRRect(
                borderRadius: BorderRadius.circular(
                  12,
                ),
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
