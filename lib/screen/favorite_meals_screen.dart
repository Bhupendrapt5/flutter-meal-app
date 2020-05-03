import 'package:flutter/material.dart';
import 'package:my_meal_app/models/meal.dart';
import 'package:my_meal_app/widget/meal_item.dart';

class FavoriteMeals extends StatelessWidget {
  final List<Meal> favoriteMeals;

  FavoriteMeals(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isNotEmpty) {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favoriteMeals[index].id,
            title: favoriteMeals[index].title,
            imageURL: favoriteMeals[index].imageUrl,
            duration: favoriteMeals[index].duration,
            complexity: favoriteMeals[index].complexity,
            affordability: favoriteMeals[index].affordability,
            // removeItem: _removeMeal,
          );
        },
        itemCount: favoriteMeals.length,
      );
    } else {
      return Center(
        child: Text("No favorites yet: - Add some..."),
      );
    }
  }
}
