import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/sizes.dart';
import '../../../core/utils/screen_utils.dart';
import 'widgets/main_page_widgets.dart';

class SelectOptionPage extends StatelessWidget {
  const SelectOptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final screenType = ScreenUtils.getDeviceType(constraints);

          final double verticalSpacingMid =
              screenType == DeviceScreenType.mobile
              ? MediaQuery.of(context).size.height * 0.05
              : MediaQuery.of(context).size.height * 0.1;

          final double titleFontSize = KSizes.fontSizeDisplay;

          final double subtitleFontSize = screenType == DeviceScreenType.mobile
              ? KSizes.fontSizeMd
              : KSizes.fontSizeLg;
          final double iconSize = screenType == DeviceScreenType.mobile
              ? KSizes.iconMd
              : KSizes.iconLg;

          return Scaffold(
            body: SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 600),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.2,
                        ),
                        Text(
                          'Bem-vindo ao\nFinder',
                          style: TextStyle(
                            fontSize: titleFontSize,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 50),
                        Text(
                          'Encontre o que precisa, de forma rápida e fácil',
                          style: TextStyle(
                            fontSize: subtitleFontSize,
                            fontWeight: FontWeight.w400,
                            color: KColors.darkGrey,
                          ),
                        ),
                        SizedBox(height: verticalSpacingMid),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            buildOptionCard(
                              context,
                              title: 'BIN',
                              description: 'Encontrar\nBin',
                              route: '/dtr-finder',
                              iconColor: Colors.blue.shade700,
                              textColor: KColors.textInformationPrimaryLight,
                              iconSize: iconSize,
                            ),
                            buildOptionCard(
                              context,
                              title: 'PEP',
                              description: 'PEP',
                              route: '/pep-finder',
                              iconColor: Colors.green.shade700,
                              textColor: Colors.green.shade700,
                              iconSize: iconSize,
                            ),
                          ],
                        ),
                        SizedBox(height: 60),
                        Center(
                          child: Row(
                            mainAxisSize: MainAxisSize
                                .min, // faz com que a Row só ocupe o espaço necessário
                            children: [
                              Text(
                                'Desenvolvido por Eliakim',
                                style: TextStyle(
                                  fontSize: subtitleFontSize,
                                  fontWeight: FontWeight.w400,
                                  color: KColors.darkGrey,
                                ),
                              ),
                              const SizedBox(
                                width: 32,
                              ), // espaço entre texto e avatar
                              CircleAvatar(
                                radius: 32, // tamanho do avatar
                                backgroundImage: AssetImage(
                                  'assets/images/profile/me.jpeg',
                                ),
                                backgroundColor: Colors.transparent,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
