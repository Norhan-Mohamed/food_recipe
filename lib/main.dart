import 'package:flutter/material.dart';
import 'package:food_recipe_app/helper.dart';
import 'package:food_recipe_app/screens/homePage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await RecipeProvider.instance.open();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}
