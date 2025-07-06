import 'dart:convert';

class RecipeModel {
  final String id;
  final String name;
  final String imageUrl;
  final String instructions;
  final List<String> ingredients;

  RecipeModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.instructions,
    required this.ingredients,
  });

  factory RecipeModel.fromJson(Map<String, dynamic> json) {
    List<String> ingredients = [];
    for (int i = 1; i <= 20; i++) {
      String? ingredient = json['strIngredient$i'];
      if (ingredient != null && ingredient.isNotEmpty) {
        ingredients.add(ingredient);
      }
    }

    return RecipeModel(
      id: json['idMeal'],
      name: json['strMeal'],
      imageUrl: json['strMealThumb'],
      instructions: json['strInstructions'],
      ingredients: ingredients,
    );
  }

  factory RecipeModel.fromMap(Map<String,dynamic>map){
    return RecipeModel(
        id: map['id'],
        name: map['name'],
        imageUrl: map['imageUrl'],
        instructions: map['instructions'],
        ingredients: List<String>.from(jsonDecode(map['ingredients']))
    );
  }

  Map<String,dynamic> toMap(){
    return {
      'id': id,
      'name' : name,
      'imageUrl' : imageUrl,
      'instructions' : instructions,
      'ingredients' : jsonEncode(ingredients)
    };
  }
}
