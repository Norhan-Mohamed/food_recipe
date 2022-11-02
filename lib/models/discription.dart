import 'package:food_recipe_app/models/dishType.dart';
import 'package:food_recipe_app/models/extendedIngredients.dart';

class Description {
  late bool vegetarian;
  late bool vegan;
  late bool glutenFree;
  late bool dairyFree;
  late bool veryHealthy;
  late bool cheap;
  late bool veryPopular;
  late bool sustainable;
  late bool lowFodmap;
  late int? weightWatcherSmartPoints;
  late String? gaps;
  late int? preparationMinutes;
  late int? cookingMinutes;
  late int? aggregateLikes;
  late int? healthScore;
  late String? creditsText;
  late String? license;
  late String? sourceName;
  late double? pricePerServing;
  late List<ExtendedIngredients> extendedIngredients;
  late int? id;
  late String? title;
  late int? readyInMinutes;
  late int? servings;
  late String? sourceUrl;
  late String? image;
  late String? imageType;
  late String? summary;
  late List<DishType> dishType;

  Description({
    required this.image,
    required this.title,
    required this.imageType,
    required this.id,
    required this.aggregateLikes,
    required this.cheap,
    required this.cookingMinutes,
    required this.creditsText,
    required this.dairyFree,
    required this.dishType,
    required this.extendedIngredients,
    required this.gaps,
    required this.glutenFree,
    required this.healthScore,
    required this.license,
    required this.lowFodmap,
    required this.preparationMinutes,
    required this.pricePerServing,
    required this.readyInMinutes,
    required this.servings,
    required this.sourceName,
    required this.sourceUrl,
    required this.summary,
    required this.sustainable,
    required this.vegan,
    required this.vegetarian,
    required this.veryHealthy,
    required this.veryPopular,
    required this.weightWatcherSmartPoints,
  });
  Description.fromMap(Map<String, dynamic> map) {
    this.image = map['image'];
    this.title = map['title'];
    this.imageType = map['imageType'];
    this.id = map['id'];
    this.aggregateLikes = map['aggregateLikes'];
    this.cheap = map['cheap'];
    this.cookingMinutes = map['cookingMinutes'];
    this.creditsText = map['creditsText'];
    this.dairyFree = map['dairyFree'];
    this.dishType = map['dishType'];
    this.extendedIngredients = [];
    (map['extendedIngredients'] as List).forEach((element) {
      this.extendedIngredients.add(ExtendedIngredients.fromMap(element));
    });
    this.gaps = map['gaps'];
    this.glutenFree = map['glutenFree'];
    this.healthScore = map['healthScore'];
    this.license = map['license'];
    this.lowFodmap = map['lowFodmap'];
    this.preparationMinutes = map['preperationMinutes'];
    this.pricePerServing = map['pricePerServing'];
    this.readyInMinutes = map['readyInMinutes'];
    this.servings = map['servings'];
    this.sourceName = map['sourceName'];
    this.sourceUrl = map['sourceUrl'];
    this.summary = map['summary'];
    this.sustainable = map['sustainable'];
    this.vegan = map['vegan'];
    this.vegetarian = map['vegetarian'];
    this.veryHealthy = map['veyrHeahthy'];
    this.veryPopular = map['veryPopular'];
    this.weightWatcherSmartPoints = map['weightWatcherSmartPoints'];
  }

  Map<String, dynamic> toMap() {
    List<Map> tmpList = [];
    this.extendedIngredients.forEach((element) {
      tmpList.add(element.toMap());
    });
    Map<String, dynamic> map = {
      "id": this.id,
      "title": this.title,
      "image": this.image,
      "imageType": this.imageType,
      "aggregateLikes": this.aggregateLikes,
      "cheap": this.cheap,
      'cookingMinutes': this.cookingMinutes,
      "creditsText": this.creditsText,
      "dairyFree": this.dairyFree,
      "dishType": this.dishType,
      "extendedIngredients": tmpList,
      "gaps": this.gaps,
      "glutenFree": this.glutenFree,
      "healthScore": this.healthScore,
      "license": this.license,
      "lowFodmap": this.lowFodmap,
      "preperationMinutes": this.preparationMinutes,
      "pricePerServing": this.pricePerServing,
      "readyInMinutes": this.readyInMinutes,
      "servings": this.servings,
      "sourceName": this.sourceName,
      "sourceUrl": this.sourceUrl,
      "summary": this.summary,
      "sustainable": this.sustainable,
      "vegan": this.vegan,
      "vegetarian": this.vegetarian,
      "veyrHeahthy": this.veryHealthy,
      "veryPopular": this.veryPopular,
      "weightWatcherSmartPoints": this.weightWatcherSmartPoints,
    };
    return map;
  }
}
