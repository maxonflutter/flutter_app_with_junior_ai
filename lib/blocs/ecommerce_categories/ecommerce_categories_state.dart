part of 'ecommerce_categories_bloc.dart';

import 'package:equatable/equatable.dart';

enum EcommerceCategoriesStatus { initial, loading, success, error }

class EcommerceCategoriesState extends Equatable {
  final EcommerceCategoriesStatus status;
  final List<String> categoryList;
  final String selectedCategory;

  const EcommerceCategoriesState({
    this.status = EcommerceCategoriesStatus.initial,
    required this.categoryList,
    this.selectedCategory = '',
  });

  EcommerceCategoriesState copyWith({
    EcommerceCategoriesStatus? status,
    List<String>? categoryList,
    String? selectedCategory,
  }) {
    return EcommerceCategoriesState(
      status: status ?? this.status,
      categoryList: categoryList ?? this.categoryList,
      selectedCategory: selectedCategory ?? this.selectedCategory,
    );
  }

  @override
  List<Object?> get props => [status, categoryList, selectedCategory];
}