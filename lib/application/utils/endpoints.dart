class ApiEndPoint {
  final String apiKey = "2acb2178a47ea6da591641cad7fdb38b";
  final String cityUrl = "https://api.openweathermap.org/data/2.5/weather";
  final String unit = "&units=metric";

  String getWeatherUrl(String cityName) {
    return "$cityUrl?q=$cityName$unit&appid=$apiKey";
  }
}
