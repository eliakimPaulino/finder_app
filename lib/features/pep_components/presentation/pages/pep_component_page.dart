import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PepComponentPage extends StatefulWidget {
  const PepComponentPage({super.key});

  @override
  State<PepComponentPage> createState() => _PepComponentPageState();
}

class _PepComponentPageState extends State<PepComponentPage> {
  List<dynamic> components = [];

  @override
  void initState() {
    super.initState();
    loadComponents();
  }

  Future<void> loadComponents() async {
    final String jsonString = await rootBundle.loadString(
      'assets/data/pep/pep_440_rev6.json',
    );
    final List<dynamic> jsonData = json.decode(jsonString);
    setState(() {
      components = jsonData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PEP Components'), centerTitle: true),
      body: components.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: components.length,
              itemBuilder: (context, index) {
                final item = components[index];
                return ListTile(
                  title: Text(item['name']),
                  subtitle: Text('ID: ${item['id']}'),
                );
              },
            ),
    );
  }
}
