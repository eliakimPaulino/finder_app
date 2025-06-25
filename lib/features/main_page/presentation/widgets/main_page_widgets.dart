import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/sizes.dart';

Widget buildOptionCard(
  BuildContext context, {
  required String title,
  required String description,
  required String route,
  required Color iconColor,
  required Color textColor,
  required double iconSize,
}) {
  return Column(
    children: [
      GestureDetector(
        onTap: () => Navigator.pushNamed(context, route),
        child: Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            color: Colors.grey.shade50,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            children: [
              Icon(Icons.search, color: iconColor, size: iconSize),
              const SizedBox(height: 8),
              Text(
                title,
                style: TextStyle(fontSize: KSizes.lg, color: textColor),
              ),
            ],
          ),
        ),
      ),
      Text(
        description,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: KColors.darkGrey,
        ),
      ),
    ],
  );
}