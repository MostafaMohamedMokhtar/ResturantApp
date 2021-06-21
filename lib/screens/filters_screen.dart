import 'package:flutter/material.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const String routeName = '/FiltersScreen';

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool isGlutenFree = false;
  bool isLactoseFree = false;
  bool isVegan = false;
  bool isVegetarian = false;

  Widget buildSwitchListTile(String titleName, String subtitleName,
      bool currentValue, Function updateValue) {
    return SwitchListTile(
        title: Text(titleName),
        subtitle: Text(subtitleName),
        value: currentValue,
        onChanged: updateValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Filters')),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                buildSwitchListTile(
                    'Gluten-free',
                    'only include gluten-free meals ',
                    isGlutenFree, (newValue) {
                  setState(() {
                    isGlutenFree = newValue;
                  });
                }),
                buildSwitchListTile(
                    'Lactose-free',
                    'only include lactose-free meals ',
                    isGlutenFree, (newValue) {
                  setState(() {
                    isLactoseFree = newValue;
                  });
                }),
                 buildSwitchListTile(
                    'Vegan-free',
                    'only include vegan-free meals ',
                    isGlutenFree, (newValue) {
                  setState(() {
                    isVegan = newValue;
                  });
                }),
                buildSwitchListTile(
                    'Vegetarian-free',
                    'only include vegetarian-free meals ',
                    isGlutenFree, (newValue) {
                  setState(() {
                    isVegetarian = newValue;
                  });
                }),
              ],
            ),
          ),
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
