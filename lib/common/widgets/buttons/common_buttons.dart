import 'package:flutter/material.dart';

class KFloatingActionButton extends StatelessWidget {
  const KFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.pushNamed(context, '/production-page');
      },
      child: Icon(Icons.list_rounded),
    );
  }
}
