import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';
import '../dummy_data.dart';
class CategoryMealScreen extends StatefulWidget {
  static const String routeName = '/CategoriesMealScreen';
  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  String categoryTitle  ;
  List<Meal> categoryMeals ;

 // this method insted of init state becasue init state dont work with context 
  @override
  void didChangeDependencies() {
    final routeArg = ModalRoute.of(context).settings.arguments as Map<String , String>;
    final String categoryId = routeArg['id']  ;
     categoryTitle = routeArg['title']  ;
     categoryMeals = DUMMY_MEALS.where((meal){
      return meal.categories.contains(categoryId);
    }).toList();
    super.didChangeDependencies();
  }

  @override
  void _removeMeal(String mealId){
    setState(() {
      categoryMeals.removeWhere((meal) => meal.id == mealId);
    });
  }
  
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemCount:categoryMeals.length ,
        itemBuilder: (ctx , index){
          return MealItem(
            imageUrl:categoryMeals[index].imageUrl ,
            id: categoryMeals[index].id ,
            title: categoryMeals[index].title,
            duration: categoryMeals[index].duration,
            affordability: categoryMeals[index].affordability,
            complexity: categoryMeals[index].complexity,
            removeMeal: _removeMeal,
          );
        }
        ),
    );
  }
}