import 'package:flutter/material.dart';
import 'package:meal_app/screens/category_meal_screen.dart';
import 'package:meal_app/screens/filters_screen.dart';
import 'package:meal_app/screens/meal_details.dart';
import 'package:meal_app/screens/tab_screen.dart';
import 'screens/categories_screen.dart';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes:  {
        '/' : (context)=> TabScreen(),
        '/CategoriesMealScreen' : (context)=> CategoryMealScreen() ,
        '/CategoriesScreen' : (context)=> CategoriesScreen(),
        '/MealDetailsScreen' : (context)=> MealDetailsScreen(),
        '/FiltersScreen' : (context) => FiltersScreen()
      },
      theme: ThemeData(
        primarySwatch: Colors.pink ,
        accentColor: Colors.amber ,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
          bodyText1:  TextStyle(
            color: Color.fromRGBO(20, 50, 50, 1)
          ),
          bodyText2:  TextStyle(
            color: Color.fromRGBO(20, 50, 50, 1)
          ),
          headline6: TextStyle(
            fontFamily: 'Roboto' ,
            fontSize: 20 ,
            fontWeight: FontWeight.bold
          )
        )
      ),
      
      
    );
  } // end build()
} // end MyApp

