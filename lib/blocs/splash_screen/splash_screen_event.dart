part of 'splash_screen_bloc.dart';

abstract class SplashScreenEvent extends Equatable {
  const SplashScreenEvent();

  @override
  List<Object> get props => [];
}

class SplashScreenStarted extends SplashScreenEvent {
  const SplashScreenStarted();
}

class UserLoggedInEvent extends SplashScreenEvent {
  const UserLoggedInEvent();
}

class UserLoggedOutEvent extends SplashScreenEvent {
  const UserLoggedOutEvent();
}
