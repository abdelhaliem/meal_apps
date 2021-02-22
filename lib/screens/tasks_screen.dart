import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/widgets/main_drawer.dart';
import 'category_screen.dart';
import 'favorites_sreen.dart';

class TapsScreen extends StatefulWidget {
 // static const routeName = 'tapsScreen';
  final List<Meal> favorteMeals;
  TapsScreen(this.favorteMeals);
  @override
  _TapsScreenState createState() => _TapsScreenState();
}

class _TapsScreenState extends State<TapsScreen> {
  List<Map<String, Object>> _pages;

  int _selectedPageIndex = 0;
  @override
  void initState() {
    _pages = [
      {
        'page': CategoryScreen(),
        'title': 'Catigories',
      },
      {
        'page': FavoritesScreen(widget.favorteMeals),
        'title': 'Your Favorite',
      }
    ];
    super.initState();
  }

  void _selectPage(int value) {
    setState(() {
      _selectedPageIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(25),
                bottomLeft: Radius.circular(25))),
        centerTitle: true,
        title: Text(
          _pages[_selectedPageIndex]['title'],
          style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              shadows: [Shadow(color: Colors.black, offset: Offset(1.5, 1.2))]),
        ),
      ),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.yellow,
          unselectedItemColor: Colors.white,
          currentIndex: _selectedPageIndex,
          onTap: _selectPage,
          backgroundColor: Colors.orange,
          elevation: 0,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.category_outlined,
                ),
                title: Text('category')),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite,
                ),
                title: Text('Favorite'))
          ]),
      drawer: MyDrawer(),
    );
  }
}
