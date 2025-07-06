
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:recipe_app/model/recipe_model.dart';
import 'package:sqflite/sqflite.dart';

class DBService{

  static Database? _db;

  static Future<Database> getDB()async{
    if(_db!=null){
      return _db!;
    }
    _db = await initDB();
    return _db!;
  }

  static Future<Database>initDB()async{
    Directory appDir = await getApplicationDocumentsDirectory();
    String dirPath = join(appDir.path,'MealDB.db');
    return await openDatabase(
      dirPath,
      version: 1,
      onCreate: _createTable
    );
  }

  static Future<void> _createTable(Database db, int version)async{
    await db.execute(
      '''
      CREATE TABLE recipes(
       id TEXT PRIMARY KEY,
       name TEXT,
       imageUrl TEXT,
       instructions TEXT,
       ingredients TEXT
      )
      '''
    );
    await db.execute(
        '''
        CREATE TABLE favorites(
        id TEXT PRIMARY KEY,
        name TEXT,
        imageUrl TEXT,
        instructions TEXT,
        ingredients TEXT
       )
      '''
    );
  }

  static Future<void> insertRecipe(RecipeModel recipe)async{
     final db = await getDB();
     await db.insert('recipes', recipe.toMap(),conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<List<RecipeModel>> searchLocalRecipes(String query) async {
    final db = await getDB();
    final result = await db.query(
      'recipes',
      where: 'name LIKE ?',
      whereArgs: ['%$query%'],
    );
    return result.map((e) => RecipeModel.fromMap(e)).toList();
  }

  static Future<void> deleteAllRecipes()async{
    final db = await getDB();
    await db.delete('recipes');
  }

  //favorites section

  static Future<void> insertFavoriteRecipe(RecipeModel recipe)async{
    final db = await getDB();
    await db.insert('favorites', recipe.toMap(),conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<List<RecipeModel>> getAllFavoriteRecipes()async{
    final db = await getDB();
    List<Map<String,dynamic>> value = await db.query('favorites');
    return value.map((i)=>RecipeModel.fromMap(i)).toList();
  }

  static Future<void> removeFromFavorites(String id)async{
     final db = await getDB();
     await db.delete('favorites',where: 'id=?',whereArgs: [id]);
  }

  static Future<bool> isAvailableInFavorites(String id)async{
    final db = await getDB();
    final result = await db.query('favorites',where: 'id=?',whereArgs: [id]);
    return result.isNotEmpty;
  }

}