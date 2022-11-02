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
    print('----');
    this.id = map['id'];
    print('---1---');
    this.title = map['title'];
    print('---2---');
    this.foodImage = map['foodImage'];
    print('---3---');

    this.imageType = map['imageType'];
    print('---4---');
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
