import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:newtok/data/repo/excel_service.dart';

part 'excel_event.dart';
part 'excel_state.dart';

class ExcelBloc extends Bloc<ExcelEvent, ExcelState> {
  ExcelBloc() : super(ExcelInitialState()) {

      ExcelService excelService =ExcelService();

    on<FechExcelDatasEvent>((event, emit) async {
      emit(ExcelDataLodingState());
      
      List<Map<String, String>> data = await excelService.pickAndProcessExcelFile();

      if (data.isNotEmpty) {
        emit(ExcelDataSuccessState(data: data));
      } else {
        emit(ExcelDataErrorState());
      }
    });
  }
}
