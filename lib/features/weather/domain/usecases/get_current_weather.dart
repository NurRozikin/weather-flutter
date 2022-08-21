import 'package:dartz/dartz.dart';
import 'package:weather_flutter/features/weather/data/failure.dart';
import 'package:weather_flutter/features/weather/domain/entities/weather.dart';
import 'package:weather_flutter/features/weather/domain/repositories/weather_repository.dart';

class GetCurrentWeather {
  final WeatherRepository repository;

  GetCurrentWeather(this.repository);

  Future<Either<Failure, Weather>> execute(String cityName) {
    return repository.getCurrentWeather(cityName);
  }
}
