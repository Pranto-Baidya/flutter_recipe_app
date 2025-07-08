import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/provider/data_provider/api_data/recipe_provider.dart';
import 'package:recipe_app/widgets/grid_category.dart';

class MealsByCategory extends StatefulWidget {
  const MealsByCategory({super.key});

  @override
  State<MealsByCategory> createState() => _MealsByCategoryState();
}

class _MealsByCategoryState extends State<MealsByCategory> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_){
      Provider.of<RecipeProvider>(context,listen: false).getAllCategories();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 15, left: 15,right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Meals By Category",style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),),
            SizedBox(height: 15),
            Expanded(
                child: Consumer<RecipeProvider>(
                    builder: (context, api, _){
                      return api.isLoading? Center(child: CircularProgressIndicator(),)
                          :api.category.isEmpty? Center(child: Text("No category available",style: theme.textTheme.titleLarge,),)
                          :GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 5,
                              mainAxisSpacing: 5
                          ),
                          itemCount: api.category.length,
                          itemBuilder: (context,index){
                            final data = api.category[index];
                            return GridCategory(
                                category: data
                            );
                          }
                      );
                    }
                )
            )

          ],
        ),
      ),
    );
  }
}
