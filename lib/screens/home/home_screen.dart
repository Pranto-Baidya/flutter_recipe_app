
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/provider/internet_checker_provider/internet_checker_provider.dart';
import 'package:recipe_app/provider/theme_provider/theme_provider.dart';
import 'package:recipe_app/screens/favorite_recipes/favorite_recipe.dart';
import 'package:recipe_app/screens/meal_category/meals_by_category.dart';
import 'package:recipe_app/screens/meal_screen/meal_screen.dart';

class HomeScreen extends StatefulWidget {
  final Function(bool) onToggle;
  const HomeScreen({super.key, required this.onToggle});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  int currentIndex = 0;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_){
      final netProvider = Provider.of<InternetCheckerProvider>(context,listen: false);
      netProvider.addListener((){
        if(!mounted) {
          return;
        }

        final message = netProvider.isConnected? 'Back online' : 'No internet connection, check favorites';
        final color = netProvider.isConnected? Colors.green : Colors.red;

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Center(child: Text(message,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),)),
              backgroundColor: color,
              behavior: SnackBarBehavior.floating,
              closeIconColor: Colors.white,
              showCloseIcon: true,
          )
        );
      });
    });
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    final isDark = Provider.of<ThemeProvider>(context,listen: false).themeMode==ThemeMode.dark;
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: theme.appBarTheme.backgroundColor,
        title: Text('RecipeBook',style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold,color: Colors.blue.shade400,fontSize: 28),),
        scrolledUnderElevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: FlutterSwitch(
                width: 60.0,
                height: 30.0,
                toggleSize: 25.0,
                value: isDark,
                borderRadius: 20.0,
                activeColor: Colors.black,
                inactiveColor: Colors.grey.shade300,
                activeIcon: Icon(Icons.nightlight, color: Colors.black),
                inactiveIcon: Icon(Icons.sunny, color: Colors.orange.shade700),
                activeToggleColor: Colors.white,
                inactiveToggleColor: Colors.white,
                onToggle: widget.onToggle
            ),
          ),
        ],
      ),
      body: [
        MealScreen(),
        MealsByCategory(),
        FavoriteRecipe()
      ][currentIndex],

      bottomNavigationBar: NavigationBar(
        backgroundColor: theme.navigationBarTheme.backgroundColor,
          labelTextStyle: WidgetStatePropertyAll(theme.textTheme.titleSmall),
          selectedIndex: currentIndex,
          onDestinationSelected: (int index){
            setState(() {
              currentIndex = index;
            });
          },
          indicatorColor: theme.navigationBarTheme.indicatorColor,
          destinations: [
            NavigationDestination(
                selectedIcon: Icon(Icons.home,color: isDark?Colors.white:Colors.white),
                icon: Icon(Icons.home_outlined,color: isDark?Colors.white:Colors.black),
                label: 'Home'
            ),
            NavigationDestination(
                selectedIcon: Icon(Icons.category,color: isDark?Colors.white:Colors.white),
                icon: Icon(Icons.category_outlined,color: isDark?Colors.white:Colors.black),
                label: 'Categories'
            ),
            NavigationDestination(
                selectedIcon: Icon(Icons.favorite,color: isDark?Colors.white:Colors.white),
                icon: Icon(Icons.favorite_border,color: isDark?Colors.white:Colors.black),
                label: 'Favorites'
            ),
          ]
      ),
    );
  }
}
