part of 'excel_bloc.dart';

@immutable
sealed class ExcelState {}

final class ExcelInitialState extends ExcelState {}

final class ExcelDataLodingState extends ExcelState {}

final class ExcelDataSuccessState extends ExcelState {
  final List<Map<String, String>> data;

  ExcelDataSuccessState({required this.data});
}

final class ExcelDataErrorState extends ExcelState {}