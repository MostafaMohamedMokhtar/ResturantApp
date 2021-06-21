import 'package:flutter/material.dart';
import 'package:meal_app/screens/category_meal_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id ; 
  final String title ;
  final Color color ;

   CategoryItem({ this.id, this.title, this.color});
   void selectCategory(BuildContext ctx){
     Navigator.of(ctx).pushNamed(CategoryMealScreen.routeName , 
     arguments: {
       'id' :  id ,
       'title' : title
     });
   } // end selectCategory()

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15) ,
      onTap: (){
       // print('clicked');
       selectCategory(context);
      },
      child: Container(
        padding: EdgeInsets.all(15),
        child: Text(title , style: Theme.of(context).textTheme.headline6,),
        decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(15) ,
         gradient: LinearGradient(
           begin: Alignment.topLeft ,
           end: Alignment.bottomRight ,
           colors: [
             color ,
             color.withOpacity(.5)
           ]
         )
        ),
      ),
    );
  }
}