// ignore_for_file: camel_case_types, file_names

import 'package:flutter/material.dart';

class Add_Week extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const Add_Week({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios, size: 15),
        onTap: onTap,
      ),
    );
  }
}
