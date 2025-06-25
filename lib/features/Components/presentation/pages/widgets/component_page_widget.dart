import 'package:finder_app/core/constants/colors.dart';
import 'package:finder_app/core/constants/sizes.dart';
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
    final dark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 4),
          Text(
            local,
            style: TextStyle(
              fontSize: KSizes.fontSizeMd,
              color: dark ? KColors.textPrimaryDark : KColors.textPrimaryLight,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Prateleira: $shelf",
                 
                style: TextStyle(fontSize: KSizes.fontSizeSm, color: dark ? KColors.textSecondaryDark : KColors.textSecondaryLight),
              ),
              Text(
                'Posição: $position',
                style: TextStyle(fontSize: KSizes.fontSizeSm, color: dark ? KColors.textSecondaryDark : KColors.textSecondaryLight),
              ),
              Text("Fluxo: $flow", style: TextStyle(fontSize: KSizes.fontSizeSm, color: dark ? KColors.textSecondaryDark : KColors.textSecondaryLight)),
            ],
          ),
        ],
      ),
    );
  }
}
