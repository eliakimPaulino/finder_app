import 'package:flutter/material.dart';

import '../../../core/constants/finder_app_colors.dart';
import '../../../core/constants/sizes.dart';

class SelectOptionPage extends StatelessWidget {
  const SelectOptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Selecione uma opção'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Selecione',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 32),

              // Primeiro container
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/dtr-finder');
                },
                child: Container(
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.build, color: Colors.blue.shade700),
                      const SizedBox(width: 16),
                      const Text(
                        'Ir para busca DTR',
                        style: TextStyle(fontSize: KSizes.lg, color: KColors.textInformationPrimary),
                      ),
                    ],
                  ),
                ),
              ),

              // Segundo container
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/pep-finder');
                },
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.green.shade50,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.settings, color: Colors.green.shade700),
                      const SizedBox(width: 16),
                      Text(
                        'Ir para busca PEP',
                        style: TextStyle(fontSize: KSizes.lg, color: Colors.green.shade700),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
