
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/model/category_model.dart';
import 'package:recipe_app/screens/category_meals/category_meals.dart';

class GridCategory extends StatelessWidget {
  final CategoryModel category;
  const GridCategory({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>CategoryMeals(
            category: category,
        )));
      },
      child: Card(
        elevation: 3,
        color: Theme.of(context).cardColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Stack(
          children: [
            CachedNetworkImage(
                imageUrl: category.categoryImage,
                fit: BoxFit.contain,
                width: double.infinity.w,
                height: 120.h,
            ),
            Positioned(
              top: 145,
                bottom: 0,
                right: 0,
                left: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue.shade400,
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10))
                  ),
                  child: Center(child: Text(category.categoryName,style: TextStyle(color: Colors.white),)),
                )
            )
          ],
        ),
      ),
    );
  }
}
