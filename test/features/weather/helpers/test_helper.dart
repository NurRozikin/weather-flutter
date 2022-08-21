import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:weather_flutter/features/weather/data/datasources/remote_data_source.dart';
import 'package:weather_flutter/features/weather/domain/repositories/weather_repository.dart';

@GenerateMocks(
  [
    WeatherRepository,
    RemoteDataSource,
  ],
  customMocks: [MockSpec<http.Client>(as: #MockHttpClient)],
)
void main() {}
