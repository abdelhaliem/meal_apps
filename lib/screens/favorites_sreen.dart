import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../models/meal.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favorteMeals;
  FavoritesScreen(this.favorteMeals);
  @override
  Widget build(BuildContext context) {
    if (favorteMeals.isEmpty) {
      return Center(
        child: Text(
          'you have favorites yet - star adding some !',
          textAlign: TextAlign.center,
        ),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favorteMeals[index].id,
            imageUrl: favorteMeals[index].imageUrl,
            title: favorteMeals[index].title,
            duration: favorteMeals[index].duration,
            complexity: favorteMeals[index].complexity,
            affordability: favorteMeals[index].affordability,
          );
        },
        itemCount: favorteMeals.length,
      );
    }
  }
}
