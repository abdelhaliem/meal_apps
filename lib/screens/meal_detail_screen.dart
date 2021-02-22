import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = 'meal_detail';
  final Function toggleFavorite;
  final Function isFavorites;

  MealDetailScreen(this.toggleFavorite, this.isFavorites);

  Widget buildSlectionTitle(BuildContext context, String text) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(15), bottomLeft: Radius.circular(15)),
          color: Colors.white70,
          boxShadow: [BoxShadow(color: Colors.amber, offset: Offset(3, 3))]),
      child: Text(
        text,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

  Widget buildContainer(Widget child, BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.amber.shade100,
            border: Border.all(color: Colors.pink),
            borderRadius: BorderRadius.circular(10)),
        padding: EdgeInsets.only(bottom: 0, top: 0, left: 5, right: 5),
        margin: EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width * 0.80,
        height: 300,
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        shadowColor: Colors.pink,
        elevation: 5,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(25),
                bottomLeft: Radius.circular(25))),
        centerTitle: true,
        title: Text(
          selectedMeal.title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            padding: EdgeInsets.all(20),
            width: double.infinity,
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          buildSlectionTitle(context, "Ingredients"),
          buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                    color: Theme.of(context).accentColor,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        selectedMeal.ingredients[index],
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Raleway'),
                      ),
                    ),
                  );
                },
                itemCount: selectedMeal.ingredients.length,
              ),
              context),
          buildSlectionTitle(context, "Steps"),
          buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Text(
                            '# ${index + 1}',
                            style: TextStyle(
                                color: Colors.pink,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        title: Text(
                          selectedMeal.steps[index],
                          style: TextStyle(fontFamily: 'Raleway'),
                        ),
                      ),
                      Divider(
                        color: Colors.white,
                        thickness: 2,
                      )
                    ],
                  );
                },
                itemCount: selectedMeal.steps.length,
              ),
              context),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          splashColor: Colors.amber,
          onPressed: () => toggleFavorite(mealId),
          child: Icon(
            isFavorites(mealId) ? Icons.favorite : Icons.favorite_border,
            color: Colors.red,
          )),
    );
  }
}
