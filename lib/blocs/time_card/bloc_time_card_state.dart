part of 'bloc_time_card_bloc.dart';

enum TimeCardStatus { initial, loading, success, error }

class TimeCardState extends Equatable {
  final TimeCardStatus status;
  final List<TimeCard> timeCardList;

  const TimeCardState({
    this.status = TimeCardStatus.initial,
    this.timeCardList = const [],
  });

  TimeCardState copyWith({
    TimeCardStatus? status,
    List<TimeCard>? timeCardList,
  }) {
    return TimeCardState(
      status: status ?? this.status,
      timeCardList: timeCardList ?? this.timeCardList,
    );
  }

  @override
  List<Object?> get props => [status, timeCardList];
}