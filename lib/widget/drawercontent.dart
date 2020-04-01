import 'package:flutter/material.dart';
import 'package:my_meal_app/miscFiles/routeNames.dart';

class DrawerContent extends StatelessWidget {
  Widget _myListTile(String title, IconData icon, BuildContext context, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).primaryColor
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 150,
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            // decoration: (),
            child: Text(
              "Cooking Up",
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          _myListTile(
            "Meals",
            Icons.restaurant,
            context,
            (){
              Navigator.of(context).pushReplacementNamed('/');
            }
          ),
          _myListTile(
            "Filters",
            Icons.settings,
            context,
            (){
                Navigator.of(context).pushReplacementNamed(RouteNames.filterScreen);
            }
          ),
        ],
      ),
    );
  }
}
