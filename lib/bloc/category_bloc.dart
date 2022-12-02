import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/bloc/category_event.dart';
import 'package:recipe_app/bloc/category_state.dart';
import 'package:recipe_app/data/model/category.dart';
import 'package:recipe_app/data/repositories/recipe.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryRepository repository;
  CategoryBloc({required this.repository}) : super(CategoryInitialState());
  CategoryState get initialState => CategoryInitialState();

  Stream<CategoryState> mapEventToState(CategoryEvent event) async* {
    if (event is FoodEvent) {
      yield CategoryLoadingState();

      try {
        List<Recipe> recipes = await repository.getCategorys();
        yield CategoryLoadedState(recipes: recipes);
      } catch (e) {
        yield CategoryErrorState(message: e.toString());
      }
    }
  }
}
