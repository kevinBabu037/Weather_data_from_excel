import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:newtok/data/model/weather_model.dart';
import 'package:newtok/data/repo/weather_service.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
   
   WeatherService service = WeatherService();

    on<FechWeatherEvent>((event, emit)async {
       emit(WeatherLoadingState());

       WeatherResponse? weatherResponse = await service.getWeather(event.city);

      if (weatherResponse!=null) {
        emit(WeatherSuccessState(weatherResponse: weatherResponse));
      }else if(weatherResponse==null) {
          emit(WeatherErrorState());
      } 
    });
  }
}
