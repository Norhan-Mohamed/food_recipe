import 'package:food_recipe_app/models/discription.dart';
import 'package:food_recipe_app/models/recipeDetails.dart';

class RecipeResponse {
  late List<RecipeDetails> list;
  late int offset;
  late int number;
  late int totalResults;
  late List<Description> description;

  RecipeResponse({
    required this.list,
    required this.offset,
    required this.number,
    required this.totalResults,
  });

  RecipeResponse.fromMap(Map<String, dynamic> map) {
    this.offset = map['offset'];
    this.number = map['number'];
    this.totalResults = map['totalResults'];
    this.list = [];
    (map['list'] as List).forEach((element) {
      this.list.add(RecipeDetails.fromMap(element));
    });
    Map<String, dynamic> toMap() {
      List<Map> tmpList = [];
      this.list.forEach((element) {
        tmpList.add(element.toMap());
      });

      Map<String, dynamic> map = {
        "offset": this.offset,
        "number": this.number,
        "totalResults": this.totalResults,
        "list": tmpList,
      };
      return map;
    }
  }
}
