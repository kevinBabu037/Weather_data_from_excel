import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newtok/application/screens/user/excel%20upload/bloc/bloc/weather_bloc.dart';
import 'package:newtok/application/utils/colors.dart';
import 'package:newtok/application/utils/height_width.dart';
import 'package:newtok/application/widgets/error_ui_and_empty_ui_text.dart';

void showDetailsWeaterExcel(BuildContext context,String country, String state, String district, String city ) {
  context.read<WeatherBloc>().add(FechWeatherEvent(city:city));  

  showDialog(  
    context: context,
    builder: (BuildContext context) {
      return AlertDialog( 
        title: Text(
          country, 
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'State: $state',
              style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
            ),
            kHeight10,
            Text(
              'District: $district',
              style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
            ),
            kHeight10,
            Text(
              'City: $city',
              style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
            ),
            kHeight10,
            BlocBuilder<WeatherBloc, WeatherState>(
              builder: (context, state) {
                if (state is WeatherLoadingState) {
                  return kCircularProgressIndicator;
                } else if (state is WeatherSuccessState) {
                  final weather = state.weatherResponse;
                  return Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                         const Text(
                            'Weather Details',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          kHeight10, 
                          ListTile(
                            leading:const Icon(Icons.thermostat_outlined, color:kClrBlue),
                            title: Text('Temperature: ${weather.main.temp}°C'),
                            subtitle: Text('Feels Like: ${weather.main.feelsLike}°C'),
                          ),
                          ListTile(   
                            leading:const Icon(Icons.cloud, color: kClrGrey), 
                            title: Text('Clouds: ${weather.clouds.all}%'), 
                            subtitle: Text(weather.weather.first.description), 
                          ),
                          ListTile(
                            leading: const Icon(Icons.air, color: kClrGreen), 
                            title: Text('Wind: ${weather.wind.speed} m/s'), 
                          ),
                          ListTile(  
                            leading: const Icon(Icons.opacity, color: kClrBlue),
                            title: Text('Humidity: ${weather.main.humidity}%'),
                          ), 
                        ], 
                      ),
                    ),
                  );
                }  
                return Row(
                  children: [
                   const Icon(Icons.error),
                    centerText("  No Weather Data Available"),
                  ],
                );
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Close'),
          ),
        ],
      );
    },
  );
}
