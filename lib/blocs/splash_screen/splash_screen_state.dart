part of 'splash_screen_bloc.dart';

enum SplashScreenStatus { initial, loading, loaded, error }

class SplashScreenState extends Equatable {
  final SplashScreenStatus status;

  const SplashScreenState({
    this.status = SplashScreenStatus.initial,
  });

  SplashScreenState copyWith({
    SplashScreenStatus? status,
  }) {
    return SplashScreenState(
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [status];
}