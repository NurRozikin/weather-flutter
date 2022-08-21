// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:weather_flutter/app/routes/router.dart';
import 'package:weather_flutter/counter/counter.dart';
import 'package:weather_flutter/features/splash/presentation/pages/splash_page.dart';
import 'package:weather_flutter/features/splash/presentation/bloc/splash_bloc.dart';
import 'package:weather_flutter/features/weather/presentation/bloc/weather_bloc.dart';
import 'package:weather_flutter/features/weather/presentation/pages/weather_page.dart';
import 'package:weather_flutter/l10n/l10n.dart';
import 'package:weather_flutter/injection.dart' as di;

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => di.locator<SplashBloc>(),
          ),
          BlocProvider(
            create: (_) => di.locator<WeatherBloc>(),
          ),
        ],
        child: MaterialApp.router(
          theme: ThemeData(
            appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
            colorScheme: ColorScheme.fromSwatch(
              accentColor: const Color(0xFF13B9FF),
            ),
          ),
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          routerDelegate: router.routerDelegate,
          routeInformationParser: router.routeInformationParser,
          routeInformationProvider: router.routeInformationProvider,
        ));
  }
}
