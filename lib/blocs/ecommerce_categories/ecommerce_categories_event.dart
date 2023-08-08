part of 'ecommerce_categories_bloc.dart';

import 'package:equatable/equatable.dart';

abstract class EcommerceCategoriesEvent extends Equatable {
  const EcommerceCategoriesEvent();

  @override
  List<Object> get props => [];
}

class LoadCategories extends EcommerceCategoriesEvent {
  const LoadCategories();
}

class SelectCategory extends EcommerceCategoriesEvent {
  final String category;

  const SelectCategory(this.category);

  @override
  List<Object> get props => [category];
}

class UpdateCategoryList extends EcommerceCategoriesEvent {
  const UpdateCategoryList();
}

class HandleError extends EcommerceCategoriesEvent {
  final String errorMessage;

  const HandleError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
