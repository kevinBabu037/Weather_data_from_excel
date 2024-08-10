import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:excel/excel.dart';



class ExcelService {
  Future<List<Map<String, String>>> pickAndProcessExcelFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['xlsx'],
    );

    if (result == null || result.files.isEmpty) {
      return []; // Return an empty list if no file is selected
    }

    final file = File(result.files.single.path!);
    final bytes = file.readAsBytesSync();
    final excel = Excel.decodeBytes(bytes);

    // ignore: unnecessary_null_comparison
    if (excel == null) {
      throw Exception('Error decoding Excel file');
    }

    final List<Map<String, String>> data = [];

    for (var table in excel.tables.keys) {
      final sheet = excel.tables[table];

      if (sheet == null || sheet.rows.isEmpty) {
        continue;
      }

      final headers = sheet.rows.first.map((cell) => cell!.value.toString().trim()).toList();

      for (var row in sheet.rows.skip(1)) {
        final rowData = <String, String>{};

        for (var i = 0; i < headers.length && i < row.length; i++) { 
          final key = headers[i];
          final value = row[i]?.value?.toString().trim() ?? '';
          rowData[key] = value;
        }

        data.add(rowData);
      }
    }

    return data;
  }
}
