import 'package:flutter/material.dart';

class Exceltable extends StatefulWidget {
  static final id = "Excel Table";
  const Exceltable({super.key});

  @override
  State<Exceltable> createState() => _ExceltableState();
}

class _ExceltableState extends State<Exceltable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("YO'RIQNOMA"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: CreativeTable(),
      ),
    );
  }
}

class CreativeTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(
        color: Colors.deepPurpleAccent,
        width: 2,
      ),
      columnWidths: {
        0: FlexColumnWidth(1.5),
        1: FlexColumnWidth(2),
        2: FlexColumnWidth(1),
        3: FlexColumnWidth(1.5),
        4: FlexColumnWidth(2),
      },
      children: [
        _buildTableRow(
          context,
          'Header 1',
          'Header 2',
          'Header 3',
          'Header 4',
          'Header 5',
          header: true,
        ),
        _buildTableRow(
          context,
          'Row 1 Col 1',
          'Row 1 Col 2',
          'Row 1 Col 3',
          'Row 1 Col 4',
          'Row 1 Col 5',
        ),
        _buildTableRow(
          context,
          'Row 2 Col 1',
          'Row 2 Col 2',
          'Row 2 Col 3',
          'Row 2 Col 4',
          'Row 2 Col 5',
        ),
        _buildTableRow(
          context,
          'Row 3 Col 1',
          'Row 3 Col 2',
          'Row 3 Col 3',
          'Row 3 Col 4',
          'Row 3 Col 5',
        ),
      ],
    );
  }

  TableRow _buildTableRow(BuildContext context, String col1, String col2,
      String col3, String col4, String col5,
      {bool header = false}) {
    return TableRow(
      decoration: BoxDecoration(
        color: header ? Colors.deepPurpleAccent : Colors.white,
        borderRadius: header ? BorderRadius.circular(10) : BorderRadius.zero,
      ),
      children: [
        _buildTableCell(context, col1, header: header),
        _buildTableCell(context, col2, header: header),
        _buildTableCell(context, col3, header: header),
        _buildTableCell(context, col4, header: header),
        _buildTableCell(context, col5, header: header),
      ],
    );
  }

  Widget _buildTableCell(BuildContext context, String text,
      {bool header = false}) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 18,
          fontWeight: header ? FontWeight.bold : FontWeight.normal,
          color: header ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
