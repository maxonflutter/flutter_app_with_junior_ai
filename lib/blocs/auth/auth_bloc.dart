import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserRepository _userRepository;
  StreamSubscription<User>? _userSubscription;

  AuthBloc({required UserRepository userRepository})
      : _userRepository = userRepository,
        super(const AuthState()) {
    on<AuthSignUpRequested>(_onSignUpRequested);
    on<AuthSignInRequested>(_onSignInRequested);
    on<AuthSignOutRequested>(_onSignOutRequested);

    _userSubscription = _userRepository.userStream().listen(_userChanged);
  }

  void _userChanged(User user) => add(UserChanged(user));

  Future<void> _onSignUpRequested(AuthSignUpRequested event, Emitter<AuthState> emit) async {
    emit(state.copyWith(status: AuthStatus.loading));
    try {
      await _userRepository.signUp(event.email, event.password);
      emit(state.copyWith(status: AuthStatus.success));
    } catch (_) {
      emit(state.copyWith(status: AuthStatus.failure));
    }
  }

  Future<void> _onSignInRequested(AuthSignInRequested event, Emitter<AuthState> emit) async {
    emit(state.copyWith(status: AuthStatus.loading));
    try {
      await _userRepository.signIn(event.email, event.password);
      emit(state.copyWith(status: AuthStatus.success));
    } catch (_) {
      emit(state.copyWith(status: AuthStatus.failure));
    }
  }

  Future<void> _onSignOutRequested(AuthSignOutRequested event, Emitter<AuthState> emit) async {
    emit(state.copyWith(status: AuthStatus.loading));
    try {
      await _userRepository.signOut();
      emit(state.copyWith(status: AuthStatus.success));
    } catch (_) {
      emit(state.copyWith(status: AuthStatus.failure));
    }
  }

  @override
  Future<void> close() {
    _userSubscription?.cancel();
    return super.close();
  }
}