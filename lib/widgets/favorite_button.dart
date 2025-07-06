import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/model/recipe_model.dart';
import 'package:recipe_app/provider/data_provider/db_data/offline_recipe.dart';

class FavoriteButton extends StatefulWidget {
  final RecipeModel meals;
  const FavoriteButton({super.key, required this.meals});

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {

  @override
  void initState() {
    checkFavorite();
    super.initState();
  }

  bool isFavorite = false;

  Future<void> checkFavorite()async{
    bool isInFavorites = await Provider.of<OfflineRecipeProvider>(context,listen: false).isAvailable(widget.meals.id);
    setState(() {
      isFavorite = isInFavorites;
    });
  }

  Future<void> toggleFavorite()async{
    if(isFavorite){
      Provider.of<OfflineRecipeProvider>(context,listen: false).removeFromFavorites(widget.meals.id);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Center(child: Text('Removed from favorites',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),)),
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
            closeIconColor: Colors.white,
            showCloseIcon: true,
        )
      );
    }
    else{
      Provider.of<OfflineRecipeProvider>(context,listen: false).addToFavorites(widget.meals);
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Center(child: Text('Added to favorites',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),)),
            backgroundColor: Colors.green,
            behavior: SnackBarBehavior.floating,
            closeIconColor: Colors.white,
            showCloseIcon: true,
          )
      );
    }
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 20,
      backgroundColor: Colors.white,
      child: IconButton(
          onPressed: (){
            toggleFavorite();
          },
          icon: isFavorite? Icon(Icons.favorite,color: Colors.red) : Icon(Icons.favorite_border,color: Colors.black)
      ),
    );
  }
}
