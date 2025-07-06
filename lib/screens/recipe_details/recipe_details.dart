import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/model/recipe_model.dart';

class RecipeDetails extends StatelessWidget {
  final RecipeModel meals;
  const RecipeDetails({super.key, required this.meals});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: theme.iconTheme,
        title: Text(meals.name,style: theme.textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.bold
        ),),
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 20,top: 10,left: 20,bottom: 10),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.h,),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  imageUrl: meals.imageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity.w,
                  height: 200.h,
                ),
              ),
              SizedBox(height: 10.h,),
              Text('Ingredients',style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold
              ),),
              SizedBox(height: 10.h,),
              ...meals.ingredients.map((ingredient)=>Text('• $ingredient',style: theme.textTheme.titleMedium,)),
              SizedBox(height: 10.h,),
              Text('Instructions',style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold
              ),),
              SizedBox(height: 10.h,),
              Text(meals.instructions,style: theme.textTheme.titleMedium,)
            ],
          ),
        ),
      ),
    );
  }
}
