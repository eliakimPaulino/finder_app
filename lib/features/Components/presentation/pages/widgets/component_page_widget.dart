import 'package:finder_app/core/constants/finder_app_colors.dart';
import 'package:flutter/material.dart';

class KBuildInfoGroup extends StatelessWidget {
  final Map<String, String> infoMap;

  const KBuildInfoGroup({super.key, required this.infoMap});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        bool darkMode = Theme.of(context).brightness == Brightness.dark;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: infoMap.entries.map((entry) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${entry.key}: ",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: darkMode
                          ? KColors.textInformationSoft
                          : KColors.textInformationPrimary,
                    ),
                  ),
                  Expanded(child: SelectableText(entry.value)),
                ],
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
