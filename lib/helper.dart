import 'package:food_recipe_app/models/discription.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

final String recipeTitle = 'title';
final String recipeId = 'id';
final String recipeImage = 'image';

class RecipeProvider {
  late Database db;
  static final RecipeProvider instance = RecipeProvider._internal();

  factory RecipeProvider() {
    return instance;
  }
  RecipeProvider._internal();

  Future open() async {
    db = await openDatabase(join(await getDatabasesPath(), 'contacts.db'),
        version: 1, onCreate: (Database db, int version) async {
      await db.execute('''
create table ContactTable ( 
  $recipeId integer primary key autoincrement,
  $recipeTitle text not null,
  $recipeImage text not null,
  )
''');
    });
  }

  Future<List<Description>> getFavRecipes() async {
    List<Map<String, dynamic>> maps = await db.query('RecipeTable');
    if (maps.isEmpty)
      return [];
    else {
      List<Description> recipe = [];
      maps.forEach((element) {
        recipe.add(Description.fromMap(element as Map<String, dynamic>));
      });
      print(maps);
      return recipe;
    }
  }

  Future<Description> insert(Description description) async {
    description.id = await db.insert('RecipeTable', description.toMap());
    return description;
  }

  Future<int> delete(int? id) async {
    return await db
        .delete('RecipeTable', where: '$recipeId = ?', whereArgs: [id]);
  }

  Future close() async => db.close();
}
