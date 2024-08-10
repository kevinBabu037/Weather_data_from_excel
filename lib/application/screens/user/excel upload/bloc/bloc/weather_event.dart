part of 'weather_bloc.dart';

@immutable
sealed class WeatherEvent {}

class FechWeatherEvent extends WeatherEvent{
 final String city;

  FechWeatherEvent({required this.city});
}



