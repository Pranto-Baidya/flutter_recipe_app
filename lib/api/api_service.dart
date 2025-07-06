

import 'dart:convert';

import 'package:http/http.dart'as http;
import 'package:recipe_app/model/category_meal_model.dart';
import 'package:recipe_app/model/category_model.dart';

import 'package:recipe_app/model/recipe_model.dart';

class ApiService{

  static const String baseUrl = 'https://www.themealdb.com/api/json/v1/1';

  static Future<List<RecipeModel>> searchMeals(String query)async{

    final response = await http.get(Uri.parse('$baseUrl/search.php?s=$query'));

    if(response.statusCode==200){
      Map<String,dynamic> json = jsonDecode(response.body);
      List<dynamic> items = json['meals'];
      return items.map((i)=> RecipeModel.fromJson(i)).toList();
    }
    else{
      throw Exception('Something went wrong');
    }
  }

  static Future<List<RecipeModel>> getMealsByFirstLetter(String letter)async{

    final response = await http.get(Uri.parse("$baseUrl/search.php?f=$letter"));

    if(response.statusCode==200){
      Map<String,dynamic> json = jsonDecode(response.body);
      List<dynamic> items = json['meals'];
      return items.map((i)=>RecipeModel.fromJson(i)).toList();
    }
    else{
      throw Exception('Something went wrong');
    }

  }

  static Future<List<CategoryModel>> getCategories()async{
    final response = await http.get(Uri.parse("$baseUrl/categories.php"));

    if(response.statusCode==200){
      Map<String,dynamic> json = jsonDecode(response.body);
      List<dynamic> items = json['categories'];
      return items.map((i)=>CategoryModel.fromJson(i)).toList();
    }
    else{
      throw Exception('Something went wrong');
    }
  }
  
  static Future<List<CategoryMealModel>> getMealsByCategory(String category)async {
    final response = await http.get(
        Uri.parse('$baseUrl/filter.php?c=$category'));

    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      List<dynamic> items = json['meals'];
      return items.map((i) => CategoryMealModel.fromJson(i)).toList();

    }
    else{
      throw Exception('Something went wrong');
    }
  }


}