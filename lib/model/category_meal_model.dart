

class CategoryMealModel{

  final String meal;
  final String mealThumb;

  CategoryMealModel({required this.meal, required this.mealThumb});

  factory CategoryMealModel.fromJson(Map<String,dynamic> json){
    return CategoryMealModel(
        meal: json['strMeal'],
        mealThumb: json['strMealThumb']
    );
  }
}