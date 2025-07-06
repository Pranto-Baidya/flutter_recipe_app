
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:recipe_app/screens/home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  final Function(bool) onToggle;
  const SplashScreen({super.key, required this.onToggle});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Timer(Duration(seconds: 3), ()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(onToggle: widget.onToggle)
            )
        )
    );
    super.initState();
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
         Center(child: Lottie.asset('assets/splash.json',width: 150.w,height: 150.h)),
          Text('RecipeBook',style: theme.textTheme.displaySmall?.copyWith(color: Colors.blue.shade400),)
        ],
      ),
    );
  }
}
