
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

  final TextEditingController _searchController = TextEditingController();

  final GlobalKey<FormState> _key = GlobalKey<FormState>();



  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<OfflineRecipeProvider>(context, listen: false);

    });
  }


  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 15,right: 15,left: 15),
        child: Form(
          key: _key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Favorite Meals',style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),),
              SizedBox(height: 15.h,),
              TextFormField(
                cursorColor: Colors.blue.shade400,
                controller: _searchController,
                validator: (String? value){
                  if(value!.isEmpty){
                    return "Please type something";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: 'Search in favorites',
                  hintStyle: theme.textTheme.titleMedium,
                  prefixIcon: Icon(Icons.search,color: theme.iconTheme.color,),
                ),
                onChanged: (query){
                  Provider.of<OfflineRecipeProvider>(context,listen: false).searchOfflineRecipes(query);
                  },
                onFieldSubmitted: (query){
                  if(_key.currentState!.validate()){
                    Provider.of<OfflineRecipeProvider>(context,listen: false).searchOfflineRecipes(query);
                  }
                },
              ),
              SizedBox(height: 10.h,),
              Expanded(
                child: Consumer<OfflineRecipeProvider>(
                  builder: (context, db, _) {
                    if (db.inProgress) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (_searchController.text.isNotEmpty) {
                      if (db.searchFavorites.isEmpty) {
                        return Center(
                          child: Text('No favorite meals found', style: theme.textTheme.titleLarge),
                        );
                      } else {
                        return ListView.builder(
                          itemCount: db.searchFavorites.length,
                          itemBuilder: (context, index) {
                            final data = db.searchFavorites[index];
                            return FavoriteMealCard(
                              meals: data,
                              index: (index + 1).toString().padLeft(2, '0'),
                            );
                          },
                        );
                      }
                    }

                    if (db.favorites.isEmpty) {
                      return Center(
                        child: Text('No favorite meals to show', style: theme.textTheme.titleLarge),
                      );
                    } else {
                      return ListView.builder(
                        itemCount: db.favorites.length,
                        itemBuilder: (context, index) {
                          final data = db.favorites[index];
                          return FavoriteMealCard(
                            meals: data,
                            index: (index + 1).toString().padLeft(2, '0'),
                          );
                        },
                      );
                    }
                  },
                ),

              )
            ],
          ),
        ),
      )
    );
  }
}
