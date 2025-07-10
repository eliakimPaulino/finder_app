import 'package:flutter/material.dart';

class ProductionPage extends StatelessWidget {
  const ProductionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 600),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios_rounded),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  const Text(
                    'Lista de Produção',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                  ),
                  IconButton(
                    icon: const Icon(Icons.expand_circle_down_sharp),
                    onPressed: () {},
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
