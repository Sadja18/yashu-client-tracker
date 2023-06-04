import 'package:flutter/material.dart';
import 'package:table_sticky_headers/table_sticky_headers.dart';

class TableView extends StatefulWidget {
  const TableView({super.key});

  @override
  State<TableView> createState() => _TableViewState();
}

class _TableViewState extends State<TableView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text('table view'),
    );
  }
}
