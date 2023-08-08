part 'data_filtering_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class DataFilteringCubit extends Cubit<DataFilteringState> {
  final DataRepository _dataRepository;

  DataFilteringCubit({required DataRepository dataRepository})
      : _dataRepository = dataRepository,
        super(const DataFilteringState());

  void fetchData() {
    try {
      emit(state.copyWith(status: 'loading'));
      final data = _dataRepository.fetchData();
      emit(state.copyWith(filteredData: data, status: 'success'));
    } catch (e) {
      emit(state.copyWith(status: 'failure'));
    }
  }

  void applyFilters(FilterCriteria criteria) {
    try {
      emit(state.copyWith(status: 'loading'));
      final filteredData = _dataRepository.applyFilters(criteria);
      emit(state.copyWith(filteredData: filteredData, status: 'success'));
    } catch (e) {
      emit(state.copyWith(status: 'failure'));
    }
  }
}