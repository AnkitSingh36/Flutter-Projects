import 'package:equatable/equatable.dart';
import 'package:recipe_app/data/model/category.dart';

abstract class CategoryState extends Equatable {}

class CategoryInitialState extends CategoryState {
  @override
  List<Object> get props => [];
}

class CategoryLoadingState extends CategoryState {
  @override
  List<Object> get props => [];
}

class CategoryLoadedState extends CategoryState {
  List<Recipe> recipes;
  CategoryLoadedState({required this.recipes});
  @override
  List<Object> get props => [];
}

class CategoryErrorState extends CategoryState {
  String message;
  CategoryErrorState({required this.message});
  @override
  List<Object> get props => [];
}
