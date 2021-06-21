import 'package:flutter/material.dart';
import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildDrawerItems(IconData icon , String itemName , Function clickHandler){
    return ListTile(
      title: Text(itemName , style: TextStyle(
        fontWeight: FontWeight.w900 ,
        fontSize: 24
      ),),
      leading: Icon(icon , size: 26,),
      onTap: clickHandler,
    ) ;
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * .25,
            width: double.infinity,
            color: Theme.of(context).accentColor,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: Text(
              ' cooking up!',
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 30,
                  fontWeight: FontWeight.w900),
            ),
          ),
          SizedBox(height: 20,) , 
          buildDrawerItems(Icons.restaurant, 'Meal', (){
            return Navigator.of(context).pushReplacementNamed('/');
          }),
          buildDrawerItems(Icons.settings, 'Filters', (){
            return Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
          }),
        ],
      ),
    );
  }
}
