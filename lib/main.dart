import 'package:flutter/material.dart';
import 'package:my_meal_app/screen/meal_detail_screen.dart';
import './miscFiles/routeNames.dart';

import './screen/meals_screen.dart';
import './screen/categories_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.



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
                body1: TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                body2: TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                title: TextStyle(
                    fontFamily: 'Raleway',
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              )),
      // home: CategoriesScreen(),
      routes: {
        RouteNames.homeScreen: (ctx) => CategoriesScreen(),
        RouteNames.mealScreen: (ctx) => MealsScreen(),
        RouteNames.mealDeatailScreen: (ctx) => MealDetailScreen()
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
      onUnknownRoute: (settings){
        //onUnknownRoute work as 404 error route
        //

        return MaterialPageRoute(
          builder: (ctx) => CategoriesScreen(),
        );
      },
    );
  }
}

// class MyHomePage extends StatefulWidget {

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text('My Meals'),
//       ),
//       body: Center(
//         child: Text('Navigaton Time'),
//       ),
//     );
//   }
// }
