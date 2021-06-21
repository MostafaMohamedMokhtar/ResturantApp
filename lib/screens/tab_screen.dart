import 'package:flutter/material.dart';
import '../screens/categories_screen.dart';
import '../screens/favorite_screen.dart';
import '../widgets/main_drawer.dart';
class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {

final List<Map<String , Object>> _pages = [
  {
    'page' : CategoriesScreen() ,
    'title' : 'Categories'
  } , 
   {
    'page' : FavoriteScreen() ,
    'title' : 'Favorites'
  } , 
];

   int _selectedPageIndex = 0 ;

  void selectScreen(value){
    setState(() {
      _selectedPageIndex = value ;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.category) ,
          label: 'Categories' 
          ),
        BottomNavigationBarItem(
          icon: Icon(Icons.star) ,
          label: 'Favorites'
          ),
      ],
      currentIndex: _selectedPageIndex,
      selectedItemColor: Theme.of(context).accentColor ,
      unselectedItemColor: Colors.white,
      backgroundColor: Theme.of(context).primaryColor ,
      onTap: selectScreen
      
    ),
    drawer: MainDrawer(),
    );
  }
}