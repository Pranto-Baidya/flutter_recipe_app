

import 'package:flutter/widgets.dart';
import 'package:recipe_app/api/api_service.dart';
import 'package:recipe_app/database/db_service.dart';
import 'package:recipe_app/model/category_meal_model.dart';
import 'package:recipe_app/model/category_model.dart';
import 'package:recipe_app/model/recipe_model.dart';

class RecipeProvider extends ChangeNotifier{

  List<RecipeModel> _meals = [];

  List<RecipeModel> get meals => _meals;

  List<CategoryModel> _category = [];

  List<CategoryModel> get category => _category;
  
  List<CategoryMealModel> _filteredCategory = [];
  
  List<CategoryMealModel> get filteredCategory => _filteredCategory;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> getSearchedMeal(String query)async{
    try{
      _isLoading = true;
      notifyListeners();

      _meals = await ApiService.searchMeals(query);

      for(RecipeModel recipe in _meals){
        await DBService.insertRecipe(recipe);
      }
    }
    catch(_) {
      _meals = await DBService.searchLocalRecipes(query);
    }

    finally{
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> loadMealsByLetter(String letter)async{
    try{
      _isLoading = true;
      notifyListeners();

      _meals = await ApiService.getMealsByFirstLetter(letter);
    }
    catch(_){
      _meals = [];
    }
    finally{
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> getAllCategories()async{
    try{
      _isLoading = true;
      notifyListeners();

      _category = await ApiService.getCategories();
    }
    catch(_){
      _category = [];
    }
    finally{
      _isLoading = false;
      notifyListeners();
    }
  }
  
  Future<void> getMealsByCategory(String category)async{
    try{
      _isLoading = true;
      notifyListeners();
      
      _filteredCategory = await ApiService.getMealsByCategory(category);
    }
    catch(_){
      _filteredCategory = [];
    }
    finally{
      _isLoading = false;
      notifyListeners();
    }
  }

}