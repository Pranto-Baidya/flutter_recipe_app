
import 'package:flutter/material.dart';
import 'package:recipe_app/database/db_service.dart';
import 'package:recipe_app/model/recipe_model.dart';

class OfflineRecipeProvider extends ChangeNotifier{

  List<RecipeModel> _favorites = [];

  List<RecipeModel> get favorites => _favorites;

  List<RecipeModel> _searchFavorites = [];

  List<RecipeModel> get searchFavorites => _searchFavorites;

  Future<void> searchOfflineRecipes(String query)async{
    if(query.isEmpty){
      _searchFavorites = [];
    }
    else{
      _searchFavorites = _favorites.where((q)=>q.name.toLowerCase().startsWith(query.toLowerCase())).toList();
      notifyListeners();
    }
  }

  bool _inProgress = false;

  bool get inProgress => _inProgress;

  void setInProgress(bool value) {
    _inProgress = value;
    notifyListeners();
  }


  Future<void> loadFavorites()async{
    _inProgress =true;
    notifyListeners();
    _favorites = await DBService.getAllFavoriteRecipes();

    _inProgress = false;
    notifyListeners();
  }

  Future<void> addToFavorites(RecipeModel recipe)async{
    await DBService.insertFavoriteRecipe(recipe);
    await loadFavorites();
  }

  Future<void> removeFromFavorites(String id)async{
    await DBService.removeFromFavorites(id);
    await loadFavorites();
  }

  Future<bool> isAvailable(String id)async{
    return await DBService.isAvailableInFavorites(id);
  }

}