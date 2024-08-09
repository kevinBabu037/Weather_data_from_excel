import 'dart:developer';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:excel/excel.dart';
class ExcelService {
  Future<List<Map<String, String>>> pickAndProcessExcelFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['xlsx'],
    );

    List<Map<String, String>> data = [];

    if (result != null && result.files.isNotEmpty) {
      final file = File(result.files.single.path!);
      final bytes = file.readAsBytesSync();
      final excel = Excel.decodeBytes(bytes);

      // ignore: unnecessary_null_comparison
      if (excel != null) {
        for (var table in excel.tables.keys) {
          var sheet = excel.tables[table];
          
          if (sheet != null) {
            // Assuming the first row contains headers
            final headers = sheet.rows.first;
            log('Headers: $headers');
            
            // Process data rows
            for (var row in sheet.rows.skip(1)) {
              final rowData = <String, String>{};
              log('Row: $row');
              
              for (var i = 0; i < headers.length; i++) {
                final key = headers[i]?.toString() ?? '';
                final value = row[i]?.toString() ?? '';
                log('Key: $key, Value: $value');
                rowData[key] = value;
              }
              
              data.add(rowData);
            }
          }
        }
      }
    } else {
      log('No file selected or file is empty.');
    }
     
    return data;
  }
}
