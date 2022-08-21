import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashLoading()) {
    on<SplashProcess>((event, emit) async {
      print("Process");
      await Future.delayed(
        Duration(seconds: 5),
        () => emit(SplashDone()),
      );
    });
  }
}
