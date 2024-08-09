
import 'package:flutter/material.dart';
import 'package:newtok/application/widgets/error_ui_and_empty_ui_text.dart';
import 'package:newtok/data/repo/excel_service.dart';

class ScreenExcelupload extends StatefulWidget {
  const ScreenExcelupload({super.key});

  @override
  ScreenExceluploadState createState() => ScreenExceluploadState();
}

class ScreenExceluploadState extends State<ScreenExcelupload> {
  final ExcelService _excelService = ExcelService();
  List<Map<String, String>> _data = [];
  bool _isLoading = false;

  Future<void> _handleFileUpload() async {
    setState(() {
      _isLoading = true;
    });
    
    try {
      final data = await _excelService.pickAndProcessExcelFile();
      setState(() {
        _data = data;
        _isLoading = false;
      });

    } catch (e) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Upload Excel"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_isLoading) 
              kCircularProgressIndicator,
            if (!_isLoading && _data.isNotEmpty) 
              Expanded(
                child: ListView.builder(
                  itemCount: _data.length,
                  itemBuilder: (context, index) {
                    final item = _data[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 8.0),
                      child: ListTile(
                        title: Text(item['country'] ?? 'No Country'),
                        subtitle: Text(
                          'State: ${item['state'] ?? 'No State'}, '
                          'District: ${item['district'] ?? 'No District'}, '
                          'City: ${item['city'] ?? 'No City'}',
                        ),
                        onTap: () {
                          // to do 
                        },
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
        _handleFileUpload();
        },
        child:const Column(
          children: [
            SizedBox(height: 5,),
            Icon(Icons.upload),
            Text("Excel"),
          ],
        ),
        ),
    );
  }
}
