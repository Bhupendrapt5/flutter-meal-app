import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widget/drawercontent.dart';

import './favorite_meals_screen.dart';
import './categories_screen.dart';

class BottomTabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  const BottomTabsScreen({Key key, this.favoriteMeals}) : super(key: key);

  @override
  _BottomTabsScreenState createState() => _BottomTabsScreenState();
}

class _BottomTabsScreenState extends State<BottomTabsScreen> {
  List<Map<String, Object>> _pages;

  @override
  void initState() {
    _pages = [
      {
        "title": "Meals",
        "page": CategoriesScreen(),
      },
      {
        "title": "Your Favorite",
        "page": FavoriteMeals(widget.favoriteMeals),
      },
    ];
    super.initState();
  }

  int _selectPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(_pages[_selectPageIndex]['title']),
        ),
        drawer: DrawerContent(),
        body: _pages[_selectPageIndex]['page'],
        bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).accentColor,
          currentIndex: _selectPageIndex,
          type: BottomNavigationBarType.shifting,
          items: [
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.category),
              title: Text("Categories"),
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.favorite),
              title: Text("Favorites"),
            ),
          ],
        ),
      ),
    );
  }
}
