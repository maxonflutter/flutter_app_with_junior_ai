import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'ecommerce_categories_event.dart';
part 'ecommerce_categories_state.dart';

class EcommerceCategoriesBloc extends Bloc<EcommerceCategoriesEvent, EcommerceCategoriesState> {
  final EcommerceCategoriesRepository _ecommerceCategoriesRepository;
  final StreamSubscription<EcommerceCategory> _ecommerceCategoriesSubscription;

  EcommerceCategoriesBloc({
    required EcommerceCategoriesRepository ecommerceCategoriesRepository,
  })  : _ecommerceCategoriesRepository = ecommerceCategoriesRepository,
        super(const EcommerceCategoriesState()) {
    on<LoadCategories>(_onLoadCategories);
    on<SelectCategory>(_onSelectCategory);
    on<UpdateCategoryList>(_onUpdateCategoryList);
    on<HandleError>(_onHandleError);

    _ecommerceCategoriesSubscription = _ecommerceCategoriesRepository.ecommerceCategoriesStream().listen(_ecommerceCategoriesChanged);
  }

  void _ecommerceCategoriesChanged(EcommerceCategory ecommerceCategory) => add(UpdateCategoryList(ecommerceCategory));

  Future<void> _onLoadCategories(
    LoadCategories event,
    Emitter<EcommerceCategoriesState> emit,
  ) async {
    emit(state.copyWith(status: EcommerceCategoriesStatus.loading));

    try {
      final categoryList = await _ecommerceCategoriesRepository.getCategories();
      emit(state.copyWith(status: EcommerceCategoriesStatus.success, categoryList: categoryList));
    } catch (err) {
      emit(state.copyWith(status: EcommerceCategoriesStatus.error));
    }
  }

  Future<void> _onSelectCategory(
    SelectCategory event,
    Emitter<EcommerceCategoriesState> emit,
  ) async {
    emit(state.copyWith(selectedCategory: event.category));
  }

  Future<void> _onUpdateCategoryList(
    UpdateCategoryList event,
    Emitter<EcommerceCategoriesState> emit,
  ) async {
    emit(state.copyWith(status: EcommerceCategoriesStatus.loading));

    try {
      final categoryList = await _ecommerceCategoriesRepository.getCategories();
      emit(state.copyWith(status: EcommerceCategoriesStatus.success, categoryList: categoryList));
    } catch (err) {
      emit(state.copyWith(status: EcommerceCategoriesStatus.error));
    }
  }

  Future<void> _onHandleError(
    HandleError event,
    Emitter<EcommerceCategoriesState> emit,
  ) async {
    emit(state.copyWith(status: EcommerceCategoriesStatus.error));
  }

  @override
  Future<void> close() {
    _ecommerceCategoriesSubscription.cancel();
    return super.close();
  }
}