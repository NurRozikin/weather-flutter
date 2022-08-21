import 'package:dartz/dartz.dart';
import 'package:weather_flutter/features/weather/data/failure.dart';
import 'package:weather_flutter/features/weather/domain/entities/weather.dart';

abstract class WeatherRepository {
  Future<Either<Failure, Weather>> getCurrentWeather(String cityName);
}
