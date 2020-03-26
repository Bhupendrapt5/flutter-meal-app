import 'package:flutter/material.dart';
import './ miscFiles/routeNames.dart';


import './widget/meals_screen.dart';
import './categories_screen.dart';

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
          canvasColor: Color.fromRGBO(255, 254, 230, 1),
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
                  fontWeight: FontWeight.bold
                ),
              )),
      // home: CategoriesScreen(),
      routes: {

        RouteNames.homeScreen : (ctx) => CategoriesScreen(),
        RouteNames.mealScreen : (ctx) => MealsScreen()
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
