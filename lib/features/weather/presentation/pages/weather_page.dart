import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:weather_flutter/features/weather/data/constants.dart';
import 'package:weather_flutter/features/weather/presentation/bloc/weather_bloc.dart';
import 'package:weather_flutter/injection.dart' as di;

class WeatherPage extends StatelessWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Weather',
          style: TextStyle(color: Colors.orange),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(children: [
          TextField(
            textAlign: TextAlign.center,
            decoration: InputDecoration(hintText: 'Enter city name'),
            onSubmitted: (query) {
              context.read<WeatherBloc>().add(OnCityChanged(query));
            },
          ),
          SizedBox(
            height: 32.0,
          ),
          BlocListener<WeatherBloc, WeatherState>(
            listener: (context, state) {
              if (state is WeatherEmpty) {
                print("Weather Empty");
              }

              if (state is WeatherLoading) {
                print("Weather Loading...");
              }

              if (state is WeatherHasData) {
                print("Weather Has Data.");
              }
            },
            child: BlocBuilder<WeatherBloc, WeatherState>(
              builder: (context, state) {
                if (state is WeatherLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is WeatherHasData) {
                  return Column(
                    key: Key('weather_data'),
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            state.result.cityName,
                            style: TextStyle(fontSize: 22),
                          ),
                          Image(
                              image: NetworkImage(
                                  Urls.weatherIcon(state.result.iconCode)))
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "",
                        style: TextStyle(fontSize: 16, letterSpacing: 1.2),
                      ),
                      SizedBox(height: 24.0),
                      Table(
                        defaultColumnWidth: FixedColumnWidth(150.0),
                        border: TableBorder.all(
                          color: Colors.grey,
                          style: BorderStyle.solid,
                          width: 1,
                        ),
                        children: [
                          TableRow(children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Temperature',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  letterSpacing: 1.2,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                state.result.temperature.toString(),
                                style: TextStyle(
                                  fontSize: 16.0,
                                  letterSpacing: 1.2,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ), // Will be change later
                          ]),
                          TableRow(children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Pressure',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  letterSpacing: 1.2,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                state.result.pressure.toString(),
                                style: TextStyle(
                                    fontSize: 16.0,
                                    letterSpacing: 1.2,
                                    fontWeight: FontWeight.bold),
                              ),
                            ), // Will be change later
                          ]),
                          TableRow(children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Humidity',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  letterSpacing: 1.2,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                state.result.humidity.toString(),
                                style: TextStyle(
                                  fontSize: 16.0,
                                  letterSpacing: 1.2,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ), // Will be change later
                          ]),
                        ],
                      ),
                    ],
                  );
                } else if (state is WeatherError) {
                  return Center(
                    child: Text('Something went wrong!'),
                  );
                } else {
                  return SizedBox();
                }
              },
            ),
          )
        ]),
      ),
    );
  }
}
