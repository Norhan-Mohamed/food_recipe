import 'package:flutter/material.dart';
import 'package:food_recipe_app/api.dart';
import 'package:food_recipe_app/models/discription.dart';
import 'package:food_recipe_app/models/recipeDetails.dart';

import '../models/recipeResponse.dart';
import 'detailsScreeen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<RecipeDetails> recipes = [];
  List<Description> descriptions = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: Transform.rotate(
            angle: 80,
            child: IconButton(
              icon: Icon(
                Icons.equalizer_sharp,
                color: Color(0xff0c9173),
                size: 25,
              ),
              onPressed: null,
            ),
          ),
          title: Text(
            ' Recipes ',
            style: TextStyle(
                fontSize: 30,
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
      body: FutureBuilder<RecipeResponse>(
          future: Api().getData(),
          builder: (context, snapShot) {
            if (snapShot.hasError) {
              print(snapShot.error.toString());
            }
            if (snapShot.hasData) {
              recipes = snapShot.data! as List<RecipeDetails>;
              return GridView.builder(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
                  itemBuilder: (context, index) {
                    RecipeDetails recipeDetails = recipes[index];
                    Description descriptionF = descriptions[index];
                    return Container(
                        padding: const EdgeInsets.all(8),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => DetailsScreen(
                                          recipeDetails, descriptionF)));
                                },
                                icon: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15.0))),
                                  child: Image(
                                    image: snapShot.data!.list.first.foodImage
                                        .toString() as ImageProvider,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                snapShot.data!.list.first.title.toString(),
                                maxLines: 3,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15),
                              ),
                            ],
                          ),
                        ));
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
