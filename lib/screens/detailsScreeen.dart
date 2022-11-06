import 'dart:core';

import 'package:flutter/material.dart';
import 'package:food_recipe_app/api.dart';
import 'package:food_recipe_app/models/discription.dart';

import '../helper.dart';
import '../models/recipeDetails.dart';

class DetailsScreen extends StatefulWidget {
  final int? id;
  final String? title;
  final String? image;
  final String? imageType;

  DetailsScreen(this.id, this.title, this.imageType, this.image);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late RecipeDetails recipeDetails;
  bool isFavourite = false;
  Color _favIconColor = Colors.black;
  void isFavoritePressed() {
    isFavourite = !isFavourite;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Color(0xff0c9173),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            color: _favIconColor,
            icon: const Icon(
              Icons.favorite_border,
            ),
            onPressed: () async {
              isFavoritePressed();
              setState(() {
                if (_favIconColor == Colors.black) {
                  _favIconColor = Colors.red;
                } else {
                  _favIconColor = Colors.black;
                }
              });
              print("is favourite");
              await RecipeProvider.instance.insert(RecipeDetails(
                  id: widget.id,
                  title: widget.title,
                  image: widget.image,
                  imageType: widget.imageType));
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.play_arrow_outlined,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.shopping_cart_outlined,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.share,
              color: Colors.black,
            ),
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
                  Image.network(snapShot.data!.image.toString()),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Text(
                          snapShot.data!.title.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff0c9173),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Text(
                                'easy',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            Container(
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(
                                      Icons.timer_sharp,
                                      size: 20,
                                    ),
                                    Text(
                                      snapShot.data!.readyInMinutes.toString(),
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 20),
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
                                          color: Colors.black, fontSize: 15),
                                    ),
                                    Text(
                                      'Ingredients',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 20),
                                    )
                                  ],
                                )),
                          ],
                        ),
                        Divider(
                          height: 15,
                          thickness: 2,
                        ),
                        Text(
                          snapShot.data!.summary.toString(),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            letterSpacing: 1,
                          ),
                        ),
                        Divider(
                          height: 10,
                          thickness: 2,
                        ),
                        Row(
                          children: [
                            Text(
                              snapShot.data!.servings.toString() + 'serving',
                              style: TextStyle(color: Colors.black),
                            ),
                            SizedBox(
                              width: 250,
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
