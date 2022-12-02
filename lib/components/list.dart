import 'package:flutter/material.dart';
import 'package:recipe_app/data/model/category.dart';

Widget buildHintsList(List<Recipe> recipes) {
  return ListView.builder(
      itemCount: recipes.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(recipes[index].strCategory),
        );
      });
}
