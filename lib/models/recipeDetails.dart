class RecipeDetails {
  late int? id;
  late String? title;
  late String? foodImage;
  late String? imageType;
  RecipeDetails({
    required this.id,
    required this.title,
    required this.foodImage,
    required this.imageType,
  });
  RecipeDetails.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.title = map['title'];
    this.foodImage = map['foodImage'];
    this.imageType = map['imageType'];
  }
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "id": this.id,
      "title": this.title,
      "foodImage": this.foodImage,
      "imageTyoe": this.imageType,
    };
    return map;
  }
}
