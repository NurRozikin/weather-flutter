import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_flutter/app/routes/router.dart';
import 'package:weather_flutter/features/splash/presentation/bloc/splash_bloc.dart';

import 'package:weather_flutter/injection.dart' as di;

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<SplashBloc>().add(SplashProcess());

    return Scaffold(
        body: BlocListener<SplashBloc, SplashState>(
      listener: (context, state) {
        if (state is SplashDone) {
          print("hehe");
          //GoRouter.of(context).goNamed(AppRouter.weather);
          context.goNamed(AppRouter.weather);
        }
      },
      child: BlocBuilder<SplashBloc, SplashState>(
          builder: (context, state) => Center(
                child: CircularProgressIndicator(),
              )),
    ));
  }
}
