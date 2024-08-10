part of 'weather_bloc.dart';

@immutable
sealed class WeatherState {}

final class WeatherInitial extends WeatherState {}

final class WeatherLoadingState extends WeatherState {}

final class WeatherSuccessState extends WeatherState {
  final WeatherResponse weatherResponse;

  WeatherSuccessState({required this.weatherResponse});
}

final class WeatherErrorState extends WeatherState {}


