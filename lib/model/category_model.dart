

class CategoryModel{

  final String categoryName;
  final String categoryImage;

  CategoryModel({required this.categoryName, required this.categoryImage});

  factory CategoryModel.fromJson(Map<String,dynamic>json){
    return CategoryModel(
        categoryName: json['strCategory'],
        categoryImage: json['strCategoryThumb']
    );
  }

}