import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:newtok/data/model/weather_model.dart';
import 'package:newtok/data/repo/weather_service.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {

  WeatherBloc() : super(WeatherInitial()) {

      final WeatherService weatherService = WeatherService();

    on<FechWeatherEvent>((event, emit) async {
      emit(WeatherLoadingState());

      WeatherResponse? weatherResponse = await weatherService.getWeather(event.city);

      if (weatherResponse != null) {
        emit(WeatherSuccessState(weatherResponse: weatherResponse));
      } else {
        emit(WeatherErrorState());
      }
    });

    
  }
}
