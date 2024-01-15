// ignore_for_file: file_names, prefer_const_constructors, prefer_const_constructors_in_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';

class ReusableRow extends StatefulWidget {
  final String title;
  final String image;

  ReusableRow({required this.title, required this.image, Key? key}) : super(key: key);

  @override
  State<ReusableRow> createState() => _ReusableRowState();
}

class _ReusableRowState extends State<ReusableRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          Expanded(
            child: Container(
              height: 100,
              color: Colors.orange,
              child: Row(
                children: [Text(widget.title)],
              ),
            ),
          ),
          // VerticalDivider(
          //   width: 4,
          //   color: Colors.black,
          // ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                height: 100,
                child: Row(
                  children: [Image.asset(widget.image,fit: BoxFit.cover,)],
                ),
              ),
            )
          ),
        ],
      );
  }
}
