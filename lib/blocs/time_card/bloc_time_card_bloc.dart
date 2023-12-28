import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bloc_time_card_event.dart';
part 'bloc_time_card_state.dart';

class TimeCardBloc extends Bloc<TimeCardEvent, TimeCardState> {
  TimeCardBloc() : super(TimeCardState.initial()) {
    on<TimeCardCreate>(_onTimeCardCreate);
    on<TimeCardUpdate>(_onTimeCardUpdate);
    on<TimeCardDelete>(_onTimeCardDelete);
    on<TimeCardFetch>(_onTimeCardFetch);
  }

  Future<void> _onTimeCardCreate(TimeCardCreate event, Emitter<TimeCardState> emit) async {
    emit(state.copyWith(status: TimeCardStatus.loading));
    try {
      // TODO: Implement create logic
      emit(state.copyWith(status: TimeCardStatus.success, timeCardList: [...state.timeCardList, event.timeCard]));
    } catch (error) {
      emit(state.copyWith(status: TimeCardStatus.error));
    }
  }

  Future<void> _onTimeCardUpdate(TimeCardUpdate event, Emitter<TimeCardState> emit) async {
    emit(state.copyWith(status: TimeCardStatus.loading));
    try {
      // TODO: Implement update logic
      emit(state.copyWith(status: TimeCardStatus.success, timeCardList: [...state.timeCardList]));
    } catch (error) {
      emit(state.copyWith(status: TimeCardStatus.error));
    }
  }

  Future<void> _onTimeCardDelete(TimeCardDelete event, Emitter<TimeCardState> emit) async {
    emit(state.copyWith(status: TimeCardStatus.loading));
    try {
      // TODO: Implement delete logic
      emit(state.copyWith(status: TimeCardStatus.success, timeCardList: state.timeCardList.where((tc) => tc.id != event.id).toList()));
    } catch (error) {
      emit(state.copyWith(status: TimeCardStatus.error));
    }
  }

  Future<void> _onTimeCardFetch(TimeCardFetch event, Emitter<TimeCardState> emit) async {
    emit(state.copyWith(status: TimeCardStatus.loading));
    try {
      // TODO: Implement fetch logic
      emit(state.copyWith(status: TimeCardStatus.success, timeCardList: [...event.timeCards]));
    } catch (error) {
      emit(state.copyWith(status: TimeCardStatus.error));
    }
  }

  // Add any stream to close if needed
  @override
  Future<void> close() {
    // TODO: Close any streams if necessary
    return super.close();
  }
}
