part of 'data_filtering_cubit.dart';

enum DataFilteringStatus {
  initial,
  loading,
  success,
  failure,
}

class DataFilteringState {
  const DataFilteringState({
    this.status = DataFilteringStatus.initial,
    required this.filteredData,
  });

  final DataFilteringStatus status;
  final List<dynamic> filteredData;

  DataFilteringState copyWith({
    DataFilteringStatus? status,
    List<dynamic>? filteredData,
  }) {
    return DataFilteringState(
      status: status ?? this.status,
      filteredData: filteredData ?? this.filteredData,
    );
  }

  @override
  List<Object?> get props => [status, filteredData];
}