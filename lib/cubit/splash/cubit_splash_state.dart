part of 'cubit_splash_cubit.dart';

enum SplashStatus {
  initial,
  loading,
  success,
  error,
}

class SplashState {
  const SplashState({
    this.splashStatus = SplashStatus.initial,
  });

  final SplashStatus splashStatus;

  SplashState copyWith({
    SplashStatus? splashStatus,
  }) {
    return SplashState(
      splashStatus: splashStatus ?? this.splashStatus,
    );
  }

  @override
  List<Object?> get props => [splashStatus];
}