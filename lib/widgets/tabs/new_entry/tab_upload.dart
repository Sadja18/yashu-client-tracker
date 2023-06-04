import 'dart:io';
import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework;

import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';

class ExcelUpload extends StatefulWidget {
  const ExcelUpload({super.key});

  @override
  State<ExcelUpload> createState() => _ExcelUploadState();
}

class _ExcelUploadState extends State<ExcelUpload> {
  File? _selectedFile;
  List<List<dynamic>>? _excelData;

  Future<void> _openFilePicker() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['xlsx', 'xls'],
    );

    if (result != null) {
      setState(() {
        _selectedFile = File(result.files.single.path!);
      });
    }
  }

  Future<void> _parseExcel() async {
    if (_selectedFile != null) {
      var bytes = _selectedFile!.readAsBytesSync();
      var excel = Excel.decodeBytes(bytes);

      var sheet = excel['Sheet1'];
      var rows = sheet.rows;

      setState(() {
        _excelData = rows;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.80,
      width: MediaQuery.of(context).size.width * 0.90,
      alignment: Alignment.center,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: _openFilePicker,
              child: Text('Select Excel File'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _parseExcel,
              child: Text('Parse Excel'),
            ),
            SizedBox(height: 20.0),
            if (_excelData != null)
              Expanded(
                child: ListView.builder(
                  itemCount: _excelData!.length,
                  itemBuilder: (context, index) {
                    var row = _excelData![index];
                    return ListTile(
                      title: Text(row.join(', ')),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
