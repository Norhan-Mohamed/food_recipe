import 'package:flutter/material.dart';
import 'package:food_recipe_app/api.dart';
import 'package:food_recipe_app/models/recipeDetails.dart';

import '../models/recipeResponse.dart';
import 'detailsScreeen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.equalizer_sharp,
              color: Color(0xff0c9173),
              size: 25,
            ),
            onPressed: null,
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
              print(snapShot.data);

              List<RecipeDetails>? recipes = snapShot.data!.results;
              return GridView.builder(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 250,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 14),
                  itemCount: snapShot.data!.results!.length,
                  itemBuilder: (context, index) {
                    print(snapShot.data!.results![index].image);
                    return Container(
                        padding: const EdgeInsets.all(8),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                iconSize: 100,
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => DetailsScreen(
                                          snapShot.data!.results![index].id,
                                          snapShot.data!.results![index].image,
                                          snapShot.data!.results![index].title,
                                          snapShot.data!.results![index]
                                              .imageType)));
                                },
                                icon: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15.0))),
                                  child: Image.network(
                                    snapShot.data!.results![index].image
                                        .toString(),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                snapShot.data!.results![index].title.toString(),
                                maxLines: 3,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 10),
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
