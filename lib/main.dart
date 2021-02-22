import 'package:flutter/material.dart';
import 'package:meal_app/screens/filters_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/category_screen_meal.dart';
import './screens/tasks_screen.dart';
import 'dummy_data.dart';
import 'models/meal.dart';
//import 'package:splash_screen_view/SplashScreenView.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'Gluten': false,
    'Lactose': false,
    'Vegan': false,
    'Vegetarian': false,
  };
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favorteMeals = [];

  void _setfilters(Map<String, bool> filterdata) {
    setState(() {
      _filters = filterdata;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['Gluten'] && meal.isGlutenFree == false) {
          return false;
        }

        if (_filters['Lactose'] && meal.isLactoseFree == false) {
          return false;
        }

        if (_filters['Vegan'] && meal.isVegan == false) {
          return false;
        }

        if (_filters['Vegetarian'] && meal.isVegetarian == false) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    final existingindex = _favorteMeals.indexWhere((meal) => meal.id == mealId);

    if (existingindex >= 0) {
      setState(() {
        _favorteMeals.removeAt(existingindex);
      });
    } else {
      setState(() {
        _favorteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool _isMaelFavorite(String id) {
    return _favorteMeals.any((meal) => meal.id == id);
  }

  // splasScreen() {
  //   return SplashScreenView(
  //     home: TapsScreen(_favorteMeals),
  //     duration: 7000,
  //     imageSize: 150,
  //     imageSrc: "assets/meal.png",
  //     text: "Meal App",
  //     textType: TextType.ColorizeAnimationText,
  //     textStyle: TextStyle(
  //       fontFamily: 'Raleway',
  //       fontSize: 40.0,
  //     ),
  //     colors: [
  //       Colors.pink,
  //       Colors.blue,
  //       Colors.yellow,
  //       Colors.red,
  //     ],
  //     backgroundColor: Colors.white,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Meal App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.amber,
          textTheme: ThemeData.light().textTheme.copyWith(
                body1: TextStyle(color: Color.fromRGBO(20, 50, 50, 1)),
                body2: TextStyle(color: Color.fromRGBO(20, 50, 50, 1)),
                title: TextStyle(fontSize: 24, fontFamily: 'RobotoCondensed'),
              ),
        ),
        routes: {
          '/': (context) => TapsScreen(_favorteMeals),          
          CategoryMealScreen.routeName: (context) =>
              CategoryMealScreen(_availableMeals),
          MealDetailScreen.routeName: (context) =>
              MealDetailScreen(_toggleFavorite, _isMaelFavorite),
          FiltersScreen.routeName: (context) =>
              FiltersScreen(_setfilters, _filters),
        });
  }
}
