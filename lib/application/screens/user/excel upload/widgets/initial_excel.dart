import 'package:flutter/material.dart';
import 'package:newtok/application/utils/height_width.dart';

class InitialExcelStateWidget extends StatelessWidget {
  const InitialExcelStateWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
         const Text(
            "Upload your Excel file to get Weather Details",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          kHeight15,
         const Text(
            "Please ensure your Excel file contains the following headers: Country, State, District, City.",
            style: TextStyle(
              fontSize: 14 ,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}