import 'package:flutter/material.dart';

import '../../../core/constants/finder_app_colors.dart';
import '../../../core/constants/sizes.dart';

class SelectOptionPage extends StatelessWidget {
  const SelectOptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   title: const Text('Selecione uma opção'),
        //   centerTitle: true,
        // ),
        body: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.2),
              const Text(
                'Bem-vindo ao\nFinder',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 16),
              const Text(
                'Encontre o que precisa, de forma rápida e fácil',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: KColors.darkGrey,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/dtr-finder');
                        },
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
                              Icon(Icons.search, color: Colors.blue.shade700),
                              const SizedBox(width: 16),
                              const Text(
                                'BIN',
                                style: TextStyle(
                                  fontSize: KSizes.lg,
                                  color: KColors.textInformationPrimary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Text(
                        ' Encontrar\nDouble Bin',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: KColors.darkGrey,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/pep-finder');
                        },
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
                              Icon(Icons.search, color: Colors.green.shade700),
                              const SizedBox(width: 16),
                              Text(
                                'PEP',
                                style: TextStyle(
                                  fontSize: KSizes.lg,
                                  color: Colors.green.shade700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Text(
                        '       Buscar\nOrientação PEP',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: KColors.darkGrey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
