part of 'bloc_time_card_bloc.dart';

import 'package:equatable/equatable.dart';

class TimeCardEvent extends Equatable {
  const TimeCardEvent();

  @override
  List<Object> get props => [];
}

class CreateTimeCard extends TimeCardEvent {
  const CreateTimeCard(this.timeCard);

  final TimeCard timeCard;

  @override
  List<Object> get props => [timeCard];
}

class UpdateTimeCard extends TimeCardEvent {
  const UpdateTimeCard(this.timeCard);

  final TimeCard timeCard;

  @override
  List<Object> get props => [timeCard];
}

class DeleteTimeCard extends TimeCardEvent {
  const DeleteTimeCard(this.timeCard);

  final TimeCard timeCard;

  @override
  List<Object> get props => [timeCard];
}

class FetchTimeCard extends TimeCardEvent {
  const FetchTimeCard();
}
