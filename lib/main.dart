import 'package:block_weather/bloc/weather_bloc.dart';
import 'package:block_weather/data/weather_repository.dart';
import 'package:block_weather/pages/weather_search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
          create: (context) => WeatherBloc(FakeWeatherRepository()),
          child: const WeatherSearchPage()),
    );
  }
}
