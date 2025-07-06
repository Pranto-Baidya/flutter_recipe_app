
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/provider/data_provider/db_data/offline_recipe.dart';
import 'package:recipe_app/widgets/favorite_meal_card.dart';

class FavoriteRecipe extends StatefulWidget {
  const FavoriteRecipe({super.key});

  @override
  State<FavoriteRecipe> createState() => _FavoriteRecipeState();
}

class _FavoriteRecipeState extends State<FavoriteRecipe> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<OfflineRecipeProvider>(context, listen: false);
      provider.setInProgress(true);
      Future.delayed(const Duration(seconds: 1), () {
        if (mounted) {
          provider.loadFavorites();
        }
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 15,right: 15,left: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Favorite Meals',style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),),
            SizedBox(height: 10.h,),
            Expanded(
                child: Consumer<OfflineRecipeProvider>(
                    builder: (context,db,_){
                      return db.inProgress?Center(child: CircularProgressIndicator(),)
                        :db.favorites.isEmpty? Center(child: Text('No favorite meals to show',style: theme.textTheme.titleLarge,),)
                          :ListView.builder(
                          itemCount: db.favorites.length,
                          itemBuilder: (context,index){
                            final data = db.favorites[index];
                            return FavoriteMealCard(
                                meals: data,
                                index: (index + 1).toString().padLeft(2, '0'),
                            );
                          }
                      );
                    }
                )
            )
          ],
        ),
      )
    );
  }
}
