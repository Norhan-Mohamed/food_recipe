import 'dart:core';

import 'package:flutter/material.dart';
import 'package:food_recipe_app/models/recipeResponse.dart';

class DetailsScreen extends StatefulWidget {
  final RecipeResponse recipeDetails;
  DetailsScreen(this.recipeDetails);
  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late int id;
  late String title;
  late String Foodimage;

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
            onPressed: () {},
          ),
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
        child: Column(children: [
          Image(
              image:
                  widget.recipeDetails.list.first.foodImage as ImageProvider),
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  widget.recipeDetails.list!.first!.title!,
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
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Text(('easy')),
                    ),
                    Container(
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.timer_sharp),
                            Text(
                              widget.recipeDetails.description.first
                                  .readyInMinutes
                                  .toString(),
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 10),
                            )
                          ],
                        )),
                    Container(
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.recipeDetails.description.first
                                  .weightWatcherSmartPoints
                                  .toString(),
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 10),
                            ),
                            Text(
                              'Ingredients',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 15),
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
                  widget.recipeDetails.description.first.summary,
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
                      widget.recipeDetails.description.first.servings
                              .toString() +
                          'serving',
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
        ]),
      ),
    );
  }
}
