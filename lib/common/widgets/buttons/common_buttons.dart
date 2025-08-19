import 'package:flutter/material.dart';

class KFloatingActionButton extends StatelessWidget {
  const KFloatingActionButton({super.key, required this.routeName});

  final String routeName;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.pushNamed(context, routeName);
      },
      child: Icon(Icons.list_rounded),
    );
  }
}
