import 'package:flutter/material.dart';
import '../widgets/category_item.dart';

import '../dummy_data.dart';
class CategoriesScreen extends StatelessWidget {
  static const String routeName = '/CategoriesScreen';
  @override
  Widget build(BuildContext context) {
    return GridView(

      padding: EdgeInsets.all(25),
      children:
        DUMMY_CATEGORIES.map((catData)=>
       CategoryItem( 
         id: catData.id,
         title: catData.title,
         color: catData.color,
       ),
      ).toList(), 
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200 ,
        childAspectRatio: 3/2 ,
        mainAxisSpacing: 20 ,
        crossAxisSpacing: 20 ,
      ),
      
    );
  }
}