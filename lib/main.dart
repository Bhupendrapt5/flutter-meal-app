import 'package:flutter/material.dart';

import './models/meal.dart';
import './screen/bottom_tabs_screen.dart';
import './screen/filter_screen.dart';
import './test_data.dart';
import './screen/meal_detail_screen.dart';
import './screen/meals_screen.dart';
import './screen/categories_screen.dart';
import './miscFiles/routeNames.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'vegetarian': false,
    'vegan': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _toggleFavorite(String mealId) {
    final existingMealId =
        _favoriteMeals.indexWhere((meal) => meal.id == mealId);

    if (existingMealId >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingMealId);
      });
    } else {
      setState(() {
        _favoriteMeals.add(
          DUMMY_MEALS.firstWhere((element) => element.id == mealId),
        );
      });
    }
  }

  bool _isFavoriteMeal(String mealId) {
    return _favoriteMeals.any((meal) => meal.id == mealId);
  }

  void _setFilter(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        //...
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        //...
        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        //...
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }

        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Make Meal',
      theme: ThemeData(
          primarySwatch: Colors.indigo,
          accentColor: Colors.lightBlue,
          canvasColor: Color.fromRGBO(255, 254, 240, 1),
          fontFamily: "RobotoCondensed",
          textTheme: ThemeData.light().textTheme.copyWith(
                bodyText1: TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                bodyText2: TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                headline6: TextStyle(
                    fontFamily: 'Raleway',
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              )),
      // home: CategoriesScreen(),
      initialRoute: "/", //"/" is default route
      routes: {
        RouteNames.homeScreen: (ctx) => BottomTabsScreen(
              favoriteMeals: _favoriteMeals,
            ),
        RouteNames.mealScreen: (ctx) => MealsScreen(_availableMeals),
        RouteNames.mealDeatailScreen: (ctx) => MealDetailScreen(
              togleFavorite: _toggleFavorite,
              isFavoriteMeal: _isFavoriteMeal,
            ),
        RouteNames.filterScreen: (ctx) => FilterScreen(_filters, _setFilter),
        RouteNames.categoriesScreen: (ctx) => CategoriesScreen(),
      },
      onGenerateRoute: (settings) {
        //It takes a function which executes for any named navigation (=pushNamed())
        //for which no registered route was found in the route table. it should return a
        //navigation action (MaterialPageRoute()) in onGenerationRoute.

        print(settings.arguments);
        return MaterialPageRoute(
          builder: (ctx) => CategoriesScreen(),
        );
      },
      onUnknownRoute: (settings) {
        //onUnknownRoute work as 404 error route
        //

        return MaterialPageRoute(
          builder: (ctx) => CategoriesScreen(),
        );
      },
    );
  }
}
