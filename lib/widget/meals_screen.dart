import 'package:flutter/material.dart';

class MealsScreen extends StatelessWidget {
  // final String categoryId;
  // final String categoryTitle;

  // MealsScreen(this.categoryId, this.categoryTitle);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    final categoryId = routeArgs['id'];
    final categoryTitle = routeArgs['title'];

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Center(
        child: Text('Receipe will appear here'),
      ),
    );
  }
}