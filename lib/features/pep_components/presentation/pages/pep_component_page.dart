import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../data/models/pep_component_model.dart';
import 'pep_component_detail_page.dart';

class PepComponentPage extends StatefulWidget {
  const PepComponentPage({super.key});

  @override
  State<PepComponentPage> createState() => _PepComponentPageState();
}

class _PepComponentPageState extends State<PepComponentPage> {
  List<PepComponentModel> components = [];

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
    final List<PepComponentModel> loaded = jsonData
        .map((item) => PepComponentModel.fromJson(item))
        .toList();

    setState(() {
      components = loaded;
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
                final comp = components[index];
                return Card(
                  margin: const EdgeInsets.all(8),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: ClipOval(
                        child: Image.asset(
                          comp.itemImage,
                          fit: BoxFit.cover,
                          width: 60,
                          height: 60,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(Icons.broken_image, size: 30);
                          },
                        ),
                      ),
                    ),
                    title: Text(comp.item),
                    subtitle: Text(comp.description),
                    trailing: const Icon(Icons.arrow_forward_ios_rounded),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => PepComponentDetailPage(
                            itemCode: comp.item,
                            description: components[index].description,
                            stripping: components[index].stripping,
                            itemImage: components[index].itemImage,
                            toolCode: components[index].toolCode,
                            toolImage: components[index].toolImage,
                            turretPositioning: components[index].turretPositioning,
                            turretPositioningImage: components[index].turretPositioningImage,
                            toolAdjustment: components[index].toolAdjustment,
                            secondToolCode: components[index].secondToolCode,
                            secondToolImage: components[index].secondToolImage,
                            secondMatrixPositioning: components[index].secondMatrixPositioning,
                            secondMatrixPositioningImage: components[index].secondMatrixPositioningImage,
                            secondToolAdjustment: components[index].secondToolAdjustment,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}
