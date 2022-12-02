import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:recipe_app/data/model/category.dart';

abstract class CategoryRepository {
  Future<List<Recipe>> getCategorys();
}

class CategoryRepositoryImpl extends CategoryRepository {
  @override
  Future<List<Recipe>> getCategorys() async {
    var response = await http.get(
        Uri.parse('https://forkify-api.herokuapp.com/api/search?q=pizza#'));

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      List<Recipe> recipes = Category.fromJson(data).recipes;
      return recipes;
    } else {
      throw Exception('Failed');
    }
  }
}
