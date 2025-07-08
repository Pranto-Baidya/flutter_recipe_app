
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../provider/data_provider/api_data/recipe_provider.dart';
import '../../provider/theme_provider/theme_provider.dart';
import '../../widgets/meal_card.dart';

class MealScreen extends StatefulWidget {
  const MealScreen({super.key});

  @override
  State<MealScreen> createState() => _MealScreenState();
}

class _MealScreenState extends State<MealScreen> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_){
      Provider.of<RecipeProvider>(context,listen: false).loadMealsByLetter('c');
    });
    super.initState();
  }

  final TextEditingController _nameController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      body: Form(
        key: _key,
        child: Column(
          children: [
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 8),
              child: TextFormField(
                cursorColor: Colors.blue.shade400,
                controller: _nameController,
                validator: (String? value){
                  if(value!.isEmpty){
                    return "Please type a meal name";
                  }
                  return null;
                },
                decoration: InputDecoration(
                    hintText: 'Search for a meal',
                    hintStyle: theme.textTheme.titleMedium,
                    prefixIcon: Icon(Icons.search,color: theme.iconTheme.color,),
                ),
                onChanged: (query){
                  Provider.of<RecipeProvider>(context,listen: false).getSearchedMeal(query);
                },
                onFieldSubmitted: (query){
                  if(_key.currentState!.validate()){
                    Provider.of<RecipeProvider>(context,listen: false).getSearchedMeal(query);
                  }
                },
              ),
            ),
            SizedBox(height: 8),
            Expanded(
                child: Consumer<RecipeProvider>(
                    builder: (context,api,_){
                      return api.isLoading? const Center(child: CircularProgressIndicator(),)
                          :api.meals.isEmpty? Center(child: Text('Oops! No meals found',style: theme.textTheme.titleLarge,),)
                          :ListView.builder(
                          itemCount: api.meals.length,
                          itemBuilder: (context,index){
                            final data = api.meals[index];
                            return MealCard(
                              meals: data,
                            );
                          }
                      );
                    }
                )
            )

          ],
        ),
      ),
    );
  }
}
