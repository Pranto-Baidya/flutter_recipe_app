
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/model/category_meal_model.dart';
import 'package:recipe_app/screens/recipe_details/recipe_details.dart';

class CategoryMealCard extends StatefulWidget {
  final CategoryMealModel meals;
  const CategoryMealCard({super.key, required this.meals});

  @override
  State<CategoryMealCard> createState() => _CategoryMealCardState();
}

class _CategoryMealCardState extends State<CategoryMealCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 8),
      child: SizedBox(
        width: double.infinity.w,
        height: 200.h,
        child: GestureDetector(
          onTap: (){

          },
          child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl: widget.meals.mealThumb,
                    fit: BoxFit.cover,
                    width: double.infinity.w,
                    height: 200.h,
                  ),
                ),
                Positioned(
                    top: 40.h,
                    bottom: 40.h,
                    right: 25.w,
                    left: 25.w,
                    child: Container(
                        width: 250.w,
                        height: 100.h,
                        decoration: BoxDecoration(
                            color: Colors.black54,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(widget.meals.meal,textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 22.sp,fontWeight: FontWeight.w500,overflow: TextOverflow.ellipsis),),
                              SizedBox(height: 5.h,),
                              Text('Get pro to view details',style: TextStyle(color: Colors.white,fontSize: 16.sp,fontWeight: FontWeight.w500,overflow: TextOverflow.ellipsis),)
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
