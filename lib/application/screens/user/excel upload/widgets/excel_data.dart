import 'package:flutter/material.dart';
import 'package:newtok/application/screens/user/excel%20upload/widgets/excel_data_weather_details.dart';
import 'package:newtok/application/utils/colors.dart';
import 'package:newtok/application/utils/height_width.dart';

class ExcelDataWeaterDetailWidget extends StatelessWidget {
  const ExcelDataWeaterDetailWidget({
    super.key, required this.data,
  });
  final List<Map<String, String>> data;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: data.length,
      itemBuilder: (context, index) {
        final item = data[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.all(16),
            leading: const CircleAvatar(
              backgroundColor: kClrBlue,
              child: Icon(Icons.location_on, color: Colors.white),
            ),
            title: Text(
              item['Country'] ?? 'No Country',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            subtitle: Text(
              '${item['State'] ?? 'No State'},'
              '${item['District'] ?? 'No District'},'
              '${item['City'] ?? 'No City'}',
              style: const TextStyle(color: kClrGrey),
            ),
            onTap: () {
             showDetailsWeaterExcel(context, item['Country']??"No Country", item['State'] ?? 'No State', item['District'] ?? 'No District', item['City'] ?? 'No City') ;
            },
          ),
        );
      },
      separatorBuilder: (context, index) => kHeight10,
    );
  }
}