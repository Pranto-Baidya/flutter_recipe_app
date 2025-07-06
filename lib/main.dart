
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/provider/data_provider/api_data/recipe_provider.dart';
import 'package:recipe_app/provider/data_provider/db_data/offline_recipe.dart';
import 'package:recipe_app/provider/internet_checker_provider/internet_checker_provider.dart';
import 'package:recipe_app/provider/theme_provider/theme_provider.dart';
import 'package:recipe_app/screens/splash_screen/splash_screen.dart';
import 'package:recipe_app/theme_data/theme_data.dart';

main(){
  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_)=>RecipeProvider()),
          ChangeNotifierProvider(create: (_)=>OfflineRecipeProvider()),
          ChangeNotifierProvider(create: (_)=>InternetCheckerProvider()),
          ChangeNotifierProvider(create: (_)=>ThemeProvider())
        ],
      child: MyApp(),
    )
  );
    
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return ScreenUtilInit(
      designSize: Size(360, 690),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: themeProvider.themeMode,
          debugShowCheckedModeBanner: false,
          home: SplashScreen(onToggle: themeProvider.toggleTheme)
        );
      }
    );
  }
}
