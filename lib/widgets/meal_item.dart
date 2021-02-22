import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String imageUrl;
  final String title;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
 
  const MealItem(
      {@required this.imageUrl,
      @required this.title,
      @required this.duration,
      @required this.complexity,
      @required this.affordability,
      @required this.id,
 });

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default:
        return 'Unknown';
        break;
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Luxurious:
        return 'Luxurious';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      default:
        return 'Unknown';
        break;
    }
  }

  void selectMeal(BuildContext ctx) {
    Navigator.of(ctx)
        .pushNamed(MealDetailScreen.routeName, arguments: id)
        .then((result) {
     // if (result != null) removeIteml(result);
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () => selectMeal(context),
      child: Card(
        color: Colors.grey.shade300,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20),
                          bottomRight: Radius.circular(0),
                          bottomLeft: Radius.circular(0)),
                      child: Image.network(
                        imageUrl,
                        width: double.infinity,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomCenter,
                      padding: EdgeInsets.all(6),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.amber, offset: Offset(0, -6))
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(0),
                              topLeft: Radius.circular(0),
                              bottomRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20))),
                      child: Text(
                        title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'RobotoCondensed',
                          fontSize: 20,
                          color: Colors.amber,
                        ),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ],
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(width: 6),
                      Text('$duration min')
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work_outline),
                      SizedBox(width: 6),
                      Text('$complexityText')
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money_outlined),
                      SizedBox(width: 6),
                      Text('$affordabilityText')
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
