import 'package:flutter/material.dart';

class KBuildComponentInfo extends StatelessWidget {
  final String local;
  final String shelf;
  final String position;
  final String flow;

  const KBuildComponentInfo({
    super.key,
    required this.local,
    required this.shelf,
    required this.position,
    required this.flow,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 4),
          Text(
            local,
            style: TextStyle(
              fontSize: 14,
              color: Colors.greenAccent,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Prateleira: $shelf",
                style: TextStyle(color: Colors.grey[300]),
              ),
              Text(
                'Posição: $position',
                style: TextStyle(color: Colors.grey[300]),
              ),
              Text("Fluxo: $flow", style: TextStyle(color: Colors.grey[300])),
            ],
          ),
        ],
      ),
    );
  }
}
