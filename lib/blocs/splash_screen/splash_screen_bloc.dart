import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'splash_screen_event.dart';
part 'splash_screen_state.dart';

class SplashScreenBloc extends Bloc<SplashScreenEvent, SplashScreenState> {
  SplashScreenBloc() : super(SplashScreenState.initial()) {
    on<SplashScreenEvent>((event, emit) async {
      // Handle SplashScreenEvent
    });
    on<UserLoggedInEvent>((event, emit) async {
      // Handle UserLoggedInEvent
      emit(SplashScreenState.loading());
      // Simulate some loading process
      await Future.delayed(Duration(seconds: 2));
      emit(SplashScreenState.loaded());
    });
    on<UserLoggedOutEvent>((event, emit) async {
      // Handle UserLoggedOutEvent
      emit(SplashScreenState.loading());
      // Simulate some loading process
      await Future.delayed(Duration(seconds: 2));
      emit(SplashScreenState.initial());
    });
  }
}
