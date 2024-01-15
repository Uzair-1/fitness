// ignore_for_file: camel_case_types, file_names

import 'package:flutter/material.dart';

class AddWeek_Name extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const AddWeek_Name({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.arrow_forward),
        title: Text(title),
        subtitle: const Text('Exercise'),
        trailing: const Icon(Icons.arrow_forward_ios, size: 15),
        onTap: onTap,
      ),
    );
  }
}
