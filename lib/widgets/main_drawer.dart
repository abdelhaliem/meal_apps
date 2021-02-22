import 'package:flutter/material.dart';
import 'package:meal_app/screens/filters_screen.dart';

class MyDrawer extends StatelessWidget {
  Widget buildListTitle(String title, IconData icon, Function tap) {
    return ListTile(
        leading: Icon(
          icon,
          color: Colors.amber,
          size: 26,
        ),
        title: Text(
          title,
          style: TextStyle(
              color: Colors.pink, fontSize: 20, fontFamily: 'RobotoCondensed'),
        ),
        onTap: tap);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 150,
            width: double.infinity,
            margin: EdgeInsets.only(top: 45, left: 10, right: 10, bottom: 20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.red, Colors.white, Colors.amber]),
              boxShadow: [
                BoxShadow(color: Colors.black, offset: Offset(6, 6)),
                BoxShadow(color: Colors.white, spreadRadius: 2)
              ],
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15),
                  bottomLeft: Radius.circular(15)),
            ),
            padding: EdgeInsets.all(10),
            alignment: Alignment.center,
            child: Text(
              'Welcome To Meal App',
              textAlign: TextAlign.center,
              style: TextStyle(
                shadows: [
                  Shadow(color: Colors.black, offset: Offset(2, 2)),
                  Shadow(color: Colors.pink, blurRadius: 4)
                ],
                fontSize: 23,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
          Divider(),
          buildListTitle('Meal', Icons.restaurant_menu_sharp, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          Divider(),
          buildListTitle('Filters', Icons.settings, () {
            Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
          }),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.50,
          ),
          Text(
            '♦ Meal App By Abd Elhalem Emad ♦',
            style:
                TextStyle(color: Colors.grey.shade400, fontFamily: 'Raleway'),
          ),
        ],
      ),
    );
  }
}
