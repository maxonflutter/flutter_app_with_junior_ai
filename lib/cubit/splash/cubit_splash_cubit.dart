part 'cubit_splash_state.dart';

class SplashScreenCubit extends Cubit<SplashScreenState> {
  SplashScreenCubit() : super(const SplashScreenState.initial());

  Future<void> loadData() async {
    try {
      emit(const SplashScreenState.loading());
      // Simulate a delay
      await Future.delayed(const Duration(seconds: 2));
      // TODO: Load your initialization data here
      emit(const SplashScreenState.success());
    } catch (e) {
      emit(SplashScreenState.error(e.toString()));
    }
  }
}
