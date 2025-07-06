
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/model/recipe_model.dart';
import 'package:recipe_app/provider/data_provider/api_data/recipe_provider.dart';
import 'package:recipe_app/widgets/category_meal_card.dart';
import 'package:recipe_app/widgets/meal_card.dart';

import '../../model/category_model.dart';

class CategoryMeals extends StatefulWidget {
  final CategoryModel? category;
  const CategoryMeals({super.key, this.category});

  @override
  State<CategoryMeals> createState() => _CategoryMealsState();
}

class _CategoryMealsState extends State<CategoryMeals> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_){
      final categoryName = widget.category?.categoryName?.trim();
      print('[DEBUG] Fetching meals for category: "$categoryName"');
      Provider.of<RecipeProvider>(context, listen: false).getMealsByCategory('$categoryName');
      //Provider.of<RecipeProvider>(context,listen: false).getMealsByCategory('${widget.category?.categoryName}');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Meals with ${widget.category?.categoryName ?? 'No name'}',style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),),
      ),
      body: Consumer<RecipeProvider>(
          builder: (context,api,_){
            return api.isLoading? Center(child: CircularProgressIndicator(),)
                : api.filteredCategory.isEmpty? Center(child: Text('No meals found',style: theme.textTheme.titleLarge,),)
                :ListView.builder(
                itemCount: api.filteredCategory.length,
                itemBuilder: (context,index){
                  final data = api.filteredCategory[index];
                  return CategoryMealCard(
                      meals: data
                  );
                }
            );
          }
      ),
    );
  }
}
