import 'package:flutter/material.dart';
import 'package:food_recipe_app/helper.dart';
import 'package:food_recipe_app/screens/favoriteRecipesScreen.dart';
import 'package:food_recipe_app/screens/homePage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await RecipeProvider.instance.open();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selsctedIndex = 0;
  PageController pageController = PageController();
  static List<Widget> screens = <Widget>[
    MyHomePage(),
    FavoriteRecipesScreen(),
  ];

  void onTapped(int index) {
    setState(() {
      _selsctedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _selsctedIndex, children: screens),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border_outlined), label: 'Favorites'),
        ],
        backgroundColor: Colors.white,
        currentIndex: _selsctedIndex,
        selectedItemColor: Color(0xff0c9173),
        unselectedItemColor: Colors.black26,
        onTap: onTapped,
      ),
    );
  }
}
