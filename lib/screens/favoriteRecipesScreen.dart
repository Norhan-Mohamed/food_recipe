import 'package:flutter/material.dart';
import 'package:food_recipe_app/helper.dart';
import 'package:food_recipe_app/models/recipeDetails.dart';

import 'detailsScreeen.dart';

class FavoriteRecipesScreen extends StatefulWidget {
  State<FavoriteRecipesScreen> createState() => _FavoriteRecipesScreenState();
}

class _FavoriteRecipesScreenState extends State<FavoriteRecipesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: Icon(
              Icons.menu,
              color: Color(0xff0c9173),
              size: 20,
            ),
            onPressed: null,
          ),
          title: Text(
            ' Favourite Recipes ',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                letterSpacing: 1,
                color: Color(0xff0c9173)),
          ),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.search,
                color: Color(0xff0c9173),
                size: 25,
              ),
              onPressed: () {},
            ),
          ]),
      body: FutureBuilder<List<RecipeDetails>>(
          future: RecipeProvider.instance.getFavRecipes(),
          builder: (context, snapShot) {
            if (snapShot.hasError) {
              print(snapShot.error.toString());
            }
            if (snapShot.hasData) {
              return GridView.builder(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 350,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 10),
                  itemCount: snapShot.data!.length,
                  itemBuilder: (context, index) {
                    print(snapShot.data![index].image);
                    return Flexible(
                      child: Container(
                          color: Color(0xffd0fee2),
                          padding: const EdgeInsets.all(8),
                          child: Center(
                            child: Column(
                              children: [
                                IconButton(
                                  iconSize: 100,
                                  onPressed: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                            builder: (context) => DetailsScreen(
                                                  snapShot.data![index].id,
                                                  snapShot.data![index].title,
                                                  snapShot.data![index].image,
                                                  snapShot
                                                      .data![index].imageType,
                                                )));
                                  },
                                  icon: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15.0))),
                                    child: Image.network(
                                      snapShot.data![index].image.toString(),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Row(children: [
                                  IconButton(
                                      onPressed: () async {
                                        await RecipeProvider.instance
                                            .delete(snapShot.data![index].id);
                                      },
                                      icon: Icon(
                                        Icons.delete,
                                        color: Color(0xff0c9173),
                                        size: 20,
                                      )),
                                  SizedBox(
                                    width: 120,
                                    child: Text(
                                      snapShot.data![index].title.toString(),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      softWrap: false,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 15),
                                    ),
                                  ),
                                ]),
                              ],
                            ),
                          )),
                    );
                  });
            }
            return Center(
              child: Container(
                child: CircularProgressIndicator(),
                height: 100,
                width: 100,
              ),
            );
          }),
    );
  }
}
