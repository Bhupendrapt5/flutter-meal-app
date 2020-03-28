import 'package:flutter/material.dart';

import '../test_data.dart';

class MealDetailScreen extends StatelessWidget {
  Widget sectionTitle(BuildContext context, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

  Widget buildContainer({BuildContext context, Widget childWidget}) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(20)),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8 ),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5 ),
      height: MediaQuery.of(context).size.height * 0.25,
      width: MediaQuery.of(context).size.width,
      child: childWidget,
    );
  }

  @override
  Widget build(BuildContext context) {
    final _mealId = ModalRoute.of(context).settings.arguments as String;
    final _selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == _mealId);

    return Scaffold(
      appBar: AppBar(
        title: Text("${_selectedMeal.title}"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 220,
            width: double.infinity,
            child: Image.network(
              _selectedMeal.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: SafeArea(
                          child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    sectionTitle(context, "Ingredients"),
                    buildContainer(
                      context: context,
                      childWidget: ListView.builder(
                        itemBuilder: (ctx, index) {
                          return Card(
                            color: Theme.of(context).accentColor,
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Text(_selectedMeal.ingredients[index]),
                            ),
                          );
                        },
                        itemCount: _selectedMeal.ingredients.length,
                      ),
                    ),
                    sectionTitle(context, "Steps"),
                    buildContainer(
                      context: context,
                      childWidget: ListView.builder(
                        itemBuilder: (ctx, index) {
                          return Column(children: <Widget>[
                            ListTile(
                              leading: CircleAvatar(
                                child: Text("#${(index + 1)}"),
                              ),
                              title: Text(_selectedMeal.steps[index]),
                            ),
                            Divider(),
                          ]);
                        },
                        itemCount: _selectedMeal.steps.length,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
