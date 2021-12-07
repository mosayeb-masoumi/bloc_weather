import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:block_weather/data/model/weather.dart';
import 'package:block_weather/data/weather_repository.dart';
import 'package:meta/meta.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {

  final WeatherRepository _weatherRepository;

  WeatherBloc(this._weatherRepository) : super(WeatherInitial()) {
    on<WeatherEvent>((event, emit) async {

      if(event is GetWeather){
        try{
          emit (WeatherLoading());
          final weather = await _weatherRepository.fetchWeather(event.cityName);
          emit(WeatherLoaded(weather));
        } on NetworkException {
          emit(WeatherError("couldent fetch weather . Is the device online?"));
        }
      }

    });
  }
}
