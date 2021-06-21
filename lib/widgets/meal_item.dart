import 'package:flutter/material.dart';
import 'package:meal_app/screens/meal_details.dart';
import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final Function removeMeal ;

  const MealItem(
      {this.id,
      this.title,
      this.imageUrl,
      this.duration,
      this.complexity,
      this.affordability ,
      this.removeMeal});

  String get complexityType{
    switch(complexity){
      case Complexity.Simple : 
       return 'Simple' ;
       break ;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default: return 'unknown' ; break ;
    }
  } // end complexityType

    String get affordabilityType{
    switch(affordability){
      case Affordability.Affordable : 
       return 'Affordable' ;
       break ;
      case Affordability.Luxurious:
        return 'Luxurious';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      default: return 'unknown' ; break ;
    }
  } // end complexityType

  void selectMeal(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(MealDetailsScreen.routeName ,
    arguments:id ).then((result) {
       if(result != null){
        // print(meal) ;
        removeMeal(result);
       }
    });
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    height: 200,
                    width: double.infinity,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20 , vertical: 5),
                    color: Colors.black45,
                    width: MediaQuery.of(context).size.width * .7,
                    child: Text(
                      title,
                      style: TextStyle(fontSize: 26 , color: Colors.white),
                      overflow: TextOverflow.fade,
                      softWrap: true,
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Icon(Icons.schedule) , 
                    SizedBox(width:6),
                    Text('$duration min'),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.work) , 
                    SizedBox(width:6),
                    Text('$complexityType'),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.attach_money) , 
                    SizedBox(width:6),
                    Text(' $affordabilityType'),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
