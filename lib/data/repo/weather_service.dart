
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:newtok/application/utils/endpoints.dart';
import 'package:newtok/data/model/weather_model.dart';

class WeatherService {
  final ApiEndPoint apiEndPoint = ApiEndPoint();

  Future<WeatherResponse?> getWeather(String cityName) async {
    final url = apiEndPoint.getWeatherUrl(cityName);

    try {
      final response = await http.get(Uri.parse(url));

      log("----------------${response.body}");

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
        return WeatherResponse.fromJson(jsonResponse);
      } else {
        throw Exception('Failed to load weather data');
      }
    } catch (e) {
       log('Failed to fetch weather data: $e');
    }
    return null;
    
  }
}








