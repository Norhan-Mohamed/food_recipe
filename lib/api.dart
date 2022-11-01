import 'dart:convert';

import 'package:food_recipe_app/models/recipeResponse.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<RecipeResponse> getData() async {
    final http.Response response = await http.get(Uri.parse(
        "https://api.spoonacular.com/recipes/complexSearch/information?apiKey=dfde703d995a45d980d3a707a7b91deb"));
    if (response.statusCode <= 299 && response.statusCode >= 200) {
      Map<String, dynamic> body = jsonDecode(response.body);
      RecipeResponse recipeResponse = RecipeResponse.fromMap(body);

      return recipeResponse;
    } else {
      throw ('failed' + response.body);
    }
  }
}
