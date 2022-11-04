import 'package:flutter/material.dart';
import 'package:food_recipe_app/helper.dart';
import 'package:food_recipe_app/models/discription.dart';

class DetailsScreen extends StatefulWidget {
  DetailsScreen(int? id);

  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: Transform.rotate(
            angle: 90,
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
            ' Favourite Recipes ',
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
      body: FutureBuilder<List<Description>>(
          future: RecipeProvider.instance.getFavRecipes(),
          builder: (context, snapShot) {
            if (snapShot.hasError) {
              print(snapShot.error.toString());
            }
            if (snapShot.hasData) {
              return GridView.builder(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
                  itemCount: snapShot.data!.length,
                  itemBuilder: (context, index) {
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
                                          snapShot.data![index].id)));
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
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                snapShot.data![index].title.toString(),
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
