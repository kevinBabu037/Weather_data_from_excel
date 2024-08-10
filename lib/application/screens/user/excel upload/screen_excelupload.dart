import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newtok/application/screens/user/excel%20upload/bloc/excelbloc/bloc/excel_bloc.dart';
import 'package:newtok/application/screens/user/excel%20upload/widgets/excel_data.dart';
import 'package:newtok/application/screens/user/excel%20upload/widgets/initial_excel.dart';
import 'package:newtok/application/widgets/error_ui_and_empty_ui_text.dart';

class ScreenExcelupload extends StatefulWidget {
  const ScreenExcelupload({super.key});

  @override
  ScreenExceluploadState createState() => ScreenExceluploadState();
}

class ScreenExceluploadState extends State<ScreenExcelupload> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Upload Excel"),
      ),
      body: BlocBuilder<ExcelBloc, ExcelState>(
        builder: (context, state) {
          if (state is ExcelDataLodingState) {
            return kCircularProgressIndicator;
          } else if(state is ExcelInitialState){
             return const InitialExcelStateWidget();
          }
          else if (state is ExcelDataSuccessState) {
            return ExcelDataWeaterDetailWidget(data: state.data,);
          }
          return centerText('Fail to load data');
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<ExcelBloc>().add(FechExcelDatasEvent( ));
        },
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.upload),
            SizedBox(height: 5),
            Text("Excel"),
          ],
        ),
      ),
    );
  }
}




