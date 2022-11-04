import 'dart:core';

import 'package:flutter/material.dart';
import 'package:food_recipe_app/api.dart';
import 'package:food_recipe_app/models/discription.dart';

class DetailsScreen extends StatefulWidget {
  final int? id;
  DetailsScreen(this.id);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late Description description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back,
          color: Color(0xff0c9173),
        ),
        actions: [
          IconButton(
              icon: const Icon(Icons.favorite_border),
              onPressed: () async {
                /* await RecipeProvider.instance.insert(Description(
                      image: widget.description.image,
                    title: widget.description.title,
                    imageType: widget.description.imageType,
                    id: widget.description.id,
                    aggregateLikes: widget.description.aggregateLikes,
                    cheap: widget.description.cheap,
                    cookingMinutes: widget.description.cookingMinutes,
                    creditsText: widget.description.creditsText,
                    dairyFree: widget.description.dairyFree,
                    dishType: widget.description.dishType,
                    extendedIngredients: widget.description.extendedIngredients,
                    gaps: widget.description.gaps,
                    glutenFree: widget.description.glutenFree,
                    healthScore: widget.description.healthScore,
                    license: widget.description.license,
                    lowFodmap: widget.description.lowFodmap,
                    preparationMinutes: widget.description.preparationMinutes,
                    pricePerServing: widget.description.pricePerServing,
                    readyInMinutes: widget.description.readyInMinutes,
                    servings: widget.description.servings,
                    sourceName: widget.description.sourceName,
                    sourceUrl: widget.description.sourceUrl,
                    summary: widget.description.summary,
                    sustainable: widget.description.sustainable,
                    vegan: widget.description.vegan,
                    vegetarian: widget.description.vegetarian,
                    veryHealthy: widget.description.veryHealthy,
                    veryPopular: widget.description.veryPopular,
                    weightWatcherSmartPoints:
                        widget.description.weightWatcherSmartPoints));*/
              }),
          IconButton(
            icon: const Icon(Icons.play_arrow_outlined),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: FutureBuilder<Description>(
            future: Api().getDataDetails(widget.id),
            builder: (context, snapShot) {
              if (snapShot.hasError) {
                print(snapShot.error.toString());
              }
              if (snapShot.hasData) {
                return Column(children: [
                  Image(image: snapShot.data!.image as ImageProvider),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Text(
                          snapShot.data!.title.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff0c9173),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Text(('easy')),
                            ),
                            Container(
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(Icons.timer_sharp),
                                    Text(
                                      snapShot.data!.readyInMinutes.toString(),
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 10),
                                    )
                                  ],
                                )),
                            Container(
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      snapShot.data!.weightWatcherSmartPoints
                                          .toString(),
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 10),
                                    ),
                                    Text(
                                      'Ingredients',
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 15),
                                    )
                                  ],
                                )),
                          ],
                        ),
                        Divider(
                          height: 10,
                          thickness: 2,
                        ),
                        Text(
                          snapShot.data!.summary.toString(),
                          style: TextStyle(
                              color: Colors.black26,
                              fontSize: 25,
                              letterSpacing: 1,
                              wordSpacing: 2),
                        ),
                        Divider(
                          height: 10,
                          thickness: 2,
                        ),
                        Row(
                          children: [
                            Text(
                              snapShot.data!.servings.toString() + 'serving',
                              style: TextStyle(color: Colors.black26),
                            ),
                            SizedBox(
                              width: 300,
                            ),
                            Container(
                              child: Icon(
                                Icons.add,
                                color: Colors.black26,
                              ),
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            Container(
                              child: Icon(
                                Icons.minimize,
                                color: Colors.black26,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ]);
              }
              return Center(
                  child: Container(
                child: CircularProgressIndicator(),
                height: 100,
                width: 100,
              ));
            }),
      ),
    );
  }
}
