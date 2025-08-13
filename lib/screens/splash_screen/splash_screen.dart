
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/provider/theme_provider/theme_provider.dart';
import 'package:recipe_app/screens/home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  final Function(bool) onToggle;
  const SplashScreen({super.key, required this.onToggle});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

 @override
  void didChangeDependencies() {
   final theme = Provider.of<ThemeProvider>(context);
   final isDark = theme.themeMode == ThemeMode.dark;

   SystemChrome.setSystemUIOverlayStyle(
       SystemUiOverlayStyle(
           systemNavigationBarColor: isDark ? Color(0xFF1c1c1d) : Colors.white
       )
   );
   Timer(Duration(seconds: 3), ()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(onToggle: widget.onToggle)
   )
   )
   );    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         Center(child: Lottie.asset('assets/splash.json',width: 150,height: 150)),
          Text('RecipeBook',style: theme.textTheme.displaySmall?.copyWith(color: Colors.blue.shade400),)
        ],
      ),
    );
  }
}
