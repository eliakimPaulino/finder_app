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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.asset(itemImage, height: 200)),
            const SizedBox(height: 16),
            Text("Item Code: $itemCode", style: const TextStyle(fontWeight: FontWeight.bold)),
            Text("Description: $description", style: const TextStyle(color: Colors.blueGrey)),
            Text("Stripping Length: $stripping", style: const TextStyle(color: Colors.blueGrey)),
            const SizedBox(height: 24),
            const Text("Tooling", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Divider(),

            /// Tabela de dois blocos lado a lado
            _buildToolingTable(context),
          ],
        ),
      ),
    );
  }

  Widget _buildToolingTable(BuildContext context) {
    final entries = [
      ["Tool Code", toolCode, "Tool Image", toolImage],
      ["Turret Positioning", turretPositioning, "Turret Positioning Image", turretPositioningImage],
      ["Tool Adjustments", "Adjustments: ${toolAdjustment}mm", "Second Tool Code", secondToolCode],
      ["Second Tool Image", secondToolImage, "Second Matrix Positioning", secondMatrixPositioning],
      ["Second Matrix Positioning Image", secondMatrixPositioningImage, "Second Tool Adjustments", "Adjustments: $secondToolAdjustment"],
    ];

    return Column(
      children: entries.map((e) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: _buildLabelValue(e[0], e[1])),
              const SizedBox(width: 16),
              Expanded(child: _buildLabelValue(e[2], e[3])),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildLabelValue(String label, String value) {
    final isImage = value.endsWith('.png') || value.endsWith('.jpg');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        isImage
            ? Image.asset(
                value,
                height: 50,
                width: 50,
                errorBuilder: (_, __, ___) => const Text("No image", style: TextStyle(fontSize: 12)),
              )
            : Text(value, style: const TextStyle(fontSize: 14)),
      ],
    );
  }
}

// class PepComponentDetailPage extends StatelessWidget {
//   final PepComponentEntity component;

//   const PepComponentDetailPage({super.key, required this.component});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Component Details")),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           children: [
//             Image.asset(component.itemImage),
//             const SizedBox(height: 16),
//             Text("Item Code: ${component.item}", style: const TextStyle(fontWeight: FontWeight.bold)),
//             Text("Description: ${component.description}"),
//             Text("Stripping Length: ${component.stripping}"),
//             const SizedBox(height: 20),
//             const Text("Tooling", style: TextStyle(fontWeight: FontWeight.bold)),
//             const Divider(),
//             // Exibição dos demais campos como na imagem
//             _toolingItem("Tool Code", component.toolCode),
//             _toolingItem("Tool Image", component.toolImage),
//             _toolingItem("Turret Positioning", component.turretPositioning),
//             _toolingItem("Tool Adjustment", component.toolAdjustment),
//             _toolingItem("Second Tool Code", component.secondToolCode),
//             _toolingItem("Second Tool Image", component.secondToolImage),
//             _toolingItem("Second Matrix Positioning", component.secondMatrixPositioning),
//             _toolingItem("Second Tool Adjustment", component.secondToolAdjustment),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _toolingItem(String label, String value) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4),
//       child: Row(
//         children: [
//           Expanded(flex: 2, child: Text("$label:", style: const TextStyle(fontWeight: FontWeight.bold))),
//           Expanded(flex: 3, child: Text(value)),
//         ],
//       ),
//     );
//   }
// }
