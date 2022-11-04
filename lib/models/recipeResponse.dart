import 'package:food_recipe_app/models/recipeDetails.dart';

class RecipeResponse {
  late List<RecipeDetails>? list;
  late int? offset;
  late int? number;
  late int? totalResults;

  RecipeResponse({
    required this.list,
    required this.offset,
    required this.number,
    required this.totalResults,
  });

  RecipeResponse.fromMap(Map<String, dynamic> map) {
    this.offset = map['offset'];
    print('---1-');

    this.number = map['number'];
    print('---2-');
    this.totalResults = map['totalResults'];
    print('---3-');

    this.list = [];
    print('---6--');
    ((map['list'] ?? []) as List<dynamic>).forEach((element) {
      print('----5--');

      this.list!.add(RecipeDetails.fromMap(element));
      print('---4-');
      print(map["list"]);
    });

    Map<String, dynamic> toMap() {
      List<Map> tmpList = [];
      this.list!.forEach((element) {
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
