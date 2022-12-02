// To parse this JSON data, do
//
//     final Category = CategoryFromJson(jsonString);

import 'dart:convert';

Category categoryFromJson(String str) => Category.fromJson(json.decode(str));

String categoryToJson(Category data) => json.encode(data.toJson());

class Category {
  Category({
    required this.recipes,
  });

  List<Recipe> recipes;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        recipes:
            List<Recipe>.from(json["recipes"].map((x) => Recipe.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "recipes": List<dynamic>.from(recipes.map((x) => x.toJson())),
      };
}

class Recipe {
  Recipe({
    required this.strCategory,
  });

  String strCategory;

  factory Recipe.fromJson(Map<String, dynamic> json) => Recipe(
        strCategory: json["strCategory"],
      );

  Map<String, dynamic> toJson() => {
        "strCategory": strCategory,
      };
}
