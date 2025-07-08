
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/model/recipe_model.dart';
import 'package:recipe_app/screens/recipe_details/recipe_details.dart';
import 'package:recipe_app/widgets/favorite_button.dart';

import '../screens/favorite_recipes/favorite_recipe.dart';

class MealCard extends StatefulWidget {
  final RecipeModel meals;
  const MealCard({super.key, required this.meals});

  @override
  State<MealCard> createState() => _MealCardState();
}

class _MealCardState extends State<MealCard> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 8),
      child: SizedBox(
        width: double.infinity,
        height: 200,
        child: GestureDetector(
          onTap: (){
           Navigator.push(context, MaterialPageRoute(builder: (context)=>RecipeDetails(meals: widget.meals)));
          },
          child: Card(
            color: theme.cardColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                      imageUrl: widget.meals.imageUrl,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 200,
                  ),
                ),
                Positioned(
                    top: 10,
                    right: 8,
                    child: FavoriteButton(
                        meals: widget.meals
                    )
                ),
                Positioned(
                  top: 55,
                    bottom: 55,
                    right: 25,
                    left: 25,
                    child: Container(
                      width: 250,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(widget.meals.name,textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.w500,overflow: TextOverflow.ellipsis),),
                            SizedBox(height: 5,),
                            Text('Tap to view details',style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w500,overflow: TextOverflow.ellipsis),)
                          ],
                        ),
                      )
                    )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
