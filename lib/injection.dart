import 'package:get_it/get_it.dart';
import 'package:weather_flutter/features/splash/presentation/bloc/splash_bloc.dart';
import 'package:weather_flutter/features/weather/data/datasources/remote_data_source.dart';
import 'package:weather_flutter/features/weather/data/repositories/weather_repository_impl.dart';
import 'package:weather_flutter/features/weather/domain/repositories/weather_repository.dart';
import 'package:weather_flutter/features/weather/domain/usecases/get_current_weather.dart';
import 'package:weather_flutter/features/weather/presentation/bloc/weather_bloc.dart';
import 'package:http/http.dart' as http;

final locator = GetIt.instance;

void init() {
  // bloc
  locator.registerFactory(() => WeatherBloc(locator()));
  locator.registerFactory(() => SplashBloc());

  // usecase
  locator.registerLazySingleton(() => GetCurrentWeather(locator()));

  // repository
  locator.registerLazySingleton<WeatherRepository>(
    () => WeatherRepositoryImpl(
      remoteDataSource: locator(),
    ),
  );

  // data source
  locator.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImpl(
      client: locator(),
    ),
  );

  // external
  locator.registerLazySingleton(() => http.Client());
}
