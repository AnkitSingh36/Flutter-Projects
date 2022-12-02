import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/bloc/category_bloc.dart';
import 'package:recipe_app/bloc/category_state.dart';
import '../bloc/category_event.dart';
import 'error.dart';
import 'list.dart';
import 'loading.dart';

class FoodCategory extends StatefulWidget {
  const FoodCategory({super.key});

  @override
  State<FoodCategory> createState() => _FoodCategoryState();
}

class _FoodCategoryState extends State<FoodCategory> {
  CategoryBloc? categoryBloc;

  @override
  void initState() {
    final dynamic categoryBloc;
    categoryBloc = BlocProvider.of<CategoryBloc>(context);
    categoryBloc.add(FoodEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CategoryBloc, CategoryState>(builder: (context, state) {
        if (state is CategoryInitialState) {
          return buildLoading();
        } else if (state is CategoryLoadedState) {
          return buildHintsList(state.recipes);
        } else if (state is CategoryErrorState) {
          return buildError(state.message);
        } else {
          throw exceptionName();
        }
      }),
    );
  }

  exceptionName() {
    // ignore: avoid_print
    print('error');
  }
}
