import 'package:finder_app/core/constants/colors.dart';
import 'package:finder_app/core/constants/sizes.dart';
import 'package:flutter/material.dart';

class KBuildComponentInfo extends StatelessWidget {
  final String location;
  final String shelf;
  final String position;

  const KBuildComponentInfo({
    super.key,
    required this.location,
    required this.shelf,
    required this.position,
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
            'Local: $location',
            style: TextStyle(
              fontSize: KSizes.fontSizeMd,
              color: dark ? KColors.textPrimaryDark : KColors.textPrimaryLight,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Prateleira: $shelf",

                style: TextStyle(
                  fontSize: KSizes.fontSizeSm,
                  color: dark
                      ? KColors.textSecondaryDark
                      : KColors.textSecondaryLight,
                ),
              ),
              Text(
                'Posição: $position',
                style: TextStyle(
                  fontSize: KSizes.fontSizeSm,
                  color: dark
                      ? KColors.textSecondaryDark
                      : KColors.textSecondaryLight,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
