class ExtendedIngredients {
  late int id;
  late String aisle;
  late String image;
  late String consistency;
  late String name;
  late String nameClean;
  late String original;
  late String originalName;
  late int amount;
  late String unit;
  late List meta = [];
  // late List<>measure;

  ExtendedIngredients({
    required this.image,
    required this.name,
    required this.aisle,
    required this.id,
    required this.amount,
    required this.consistency,
    required this.meta,
    required this.nameClean,
    required this.original,
    required this.originalName,
    required this.unit,
  });
  ExtendedIngredients.fromMap(Map<String, dynamic> map) {
    this.image = map['image'];
    this.name = map['name'];
    this.aisle = map['aisle'];
    this.id = map['id'];
    this.amount = map['amount'];
    this.consistency = map['consistency'];
    this.meta = map['meta'];
    this.nameClean = map['nameClean'];
    this.original = map['original'];
    this.originalName = map['originalName'];
    this.unit = map['unit'];
  }
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "image": this.image,
      "name  ": this.name,
      " aisle ": this.aisle,
      "  id": this.id,
      "amount  ": this.amount,
      " consistency ": this.consistency,
      " meta ": this.meta,
      "nameClean  ": this.nameClean,
      "original  ": this.original,
      "originalName  ": this.originalName,
      " unit ": this.unit,
    };
    return map;
  }
}
