import 'package:flutter/material.dart';
import '../screens/category_screen_meal.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem(this.id, this.title, this.color);
  void selectCategory(BuildContext ctx){
    Navigator.of(ctx).pushNamed(CategoryMealScreen.routeName,
    arguments: {
      'id' :id,
      'title':title,

        }
    );

  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {
      selectCategory(context);
      },
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.amber.withOpacity(0.2),
            color.withOpacity(0.4),
            color
          ]),
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: EdgeInsets.all(15),
        child: Center(
            child: Text(
              title,
              style: Theme.of(context).textTheme.title
            )),
      ),
    );
  }
}