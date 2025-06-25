import 'package:flutter/material.dart';

class KBuildComponentInfo extends StatelessWidget {
  final String name;
  final String local;
  final String shelf;
  final String position;
  final String flow;

  const KBuildComponentInfo({
    super.key,
    required this.name,
    required this.local,
    required this.shelf,
    required this.position,
    required this.flow,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      child: Column(
        spacing: 4.0,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 2.0),
          Text(local),
          Text('Prateleira: $shelf'),
          Text('Posição: $position'),
          Text('Fluxo: $flow'),
        ],
      ),
    );
  }
}
