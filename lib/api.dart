import 'dart:convert';

import 'package:food_recipe_app/models/discription.dart';
import 'package:http/http.dart' as http;

import 'models/recipeResponse.dart';

class Api {
  Future<RecipeResponse> getData() async {
    final http.Response response = await http.get(Uri.parse(
        "https://api.spoonacular.com/recipes/complexSearch?apiKey=a8c1e3bc47214fc784d5780251b2c025"));
    if (response.statusCode <= 299 && response.statusCode >= 200) {
      Map<String, dynamic> body = jsonDecode(response.body);
      RecipeResponse recipeResponse = RecipeResponse.fromMap(body);
      print(body);
      return recipeResponse;
    } else {
      throw ('failed' + response.body);
    }
  }

  Future<Description> getDataDetails(int? id) async {
    final http.Response response = await http.get(Uri.parse(
        "https://api.spoonacular.com/recipes/$id/information?apiKey=a8c1e3bc47214fc784d5780251b2c025"));
    if (response.statusCode <= 299 && response.statusCode >= 200) {
      Map<String, dynamic> body = jsonDecode(response.body);
      Description description = Description.fromMap(body);

      return description;
    } else {
      throw ('failed' + response.body);
    }
  }
}
