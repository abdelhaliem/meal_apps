import 'package:flutter/material.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilter;
  final Map<String, bool> currentFilters;

  FiltersScreen(this.saveFilter, this.currentFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _isGlutenFree = false;
  bool _isLactoseFree = false;
  bool _isVegan = false;
  bool _isVegetarian = false;

  @override
  initState() {
    _isGlutenFree = widget.currentFilters['Gluten'];
    _isLactoseFree = widget.currentFilters['Lactose'];
    _isVegan = widget.currentFilters['Vegan'];
    _isVegetarian = widget.currentFilters['Vegetarian'];
    super.initState();
  }

  Widget buildSwitchListTile(
      String title, String subTitle, Function onChan, bool valu) {
    return Container(
      margin: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 5),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(color: Colors.amber, offset: Offset(0, 0), blurRadius: 5)
      ], borderRadius: BorderRadius.circular(40), color: Colors.grey.shade200),
      child: SwitchListTile(
          title: Text(title),
          value: valu,
          subtitle: Text(subTitle),
          onChanged: onChan),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(
                Icons.save_rounded,
                color: Colors.white,
              ),
              onPressed: () {
                final selectedFilters = {
                  'Gluten': _isGlutenFree,
                  'Lactose': _isLactoseFree,
                  'Vegan': _isVegan,
                  'Vegetarian': _isVegetarian,
                };
                widget.saveFilter(selectedFilters);
              }),
        ],
        elevation: 1,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(25),
                bottomLeft: Radius.circular(25))),
        centerTitle: true,
        title: Text(
          "Your Filters",
          style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              shadows: [Shadow(color: Colors.black, offset: Offset(1.5, 1.2))]),
        ),
      ),
      drawer: MyDrawer(),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15)),
                color: Colors.white70,
                boxShadow: [
                  BoxShadow(color: Colors.amber, offset: Offset(3, 3))
                ]),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Expanded(
              child: ListView(
            children: [
              buildSwitchListTile('GlutenFree', "Only include glutenFree meals",
                  (newValue) {
                setState(() {
                  _isGlutenFree = newValue;
                });
              }, _isGlutenFree),
              buildSwitchListTile(
                  'LactoseFree', "Only include lactoseFree meals", (newValue) {
                setState(() {
                  _isLactoseFree = newValue;
                });
              }, _isLactoseFree),
              buildSwitchListTile('Vegetarian', "Only include Vegetarian meals",
                  (newValue) {
                setState(() {
                  _isVegetarian = newValue;
                });
              }, _isVegetarian),
              buildSwitchListTile('Vegan', "Only include Vegan meals",
                  (newValue) {
                setState(() {
                  _isVegan = newValue;
                });
              }, _isVegan),
            ],
          ))
        ],
      ),
    );
  }
}
