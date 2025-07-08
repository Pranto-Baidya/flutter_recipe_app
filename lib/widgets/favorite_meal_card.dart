import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/model/recipe_model.dart';
import 'package:recipe_app/widgets/favorite_button.dart';

class FavoriteMealCard extends StatefulWidget {
  final String index;
  final RecipeModel meals;

  const FavoriteMealCard({
    super.key,
    required this.meals,
    required this.index,
  });

  @override
  State<FavoriteMealCard> createState() => _FavoriteMealCardState();
}

class _FavoriteMealCardState extends State<FavoriteMealCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Card(
        color: theme.cardColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: ExpansionTile(
          backgroundColor: Colors.transparent,
          tilePadding: const EdgeInsets.all(15),
          collapsedShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),

          leading: CircleAvatar(
            radius: 20,
            backgroundColor: Colors.blue.shade400,
            child: Text(
              widget.index,
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),

          title: Text(
            widget.meals.name,
            style: theme.textTheme.titleLarge,
          ),

          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              FavoriteButton(meals: widget.meals),
              const SizedBox(width: 12),
              AnimatedRotation(
                turns: _isExpanded ? 0.5 : 0.0,
                duration: const Duration(milliseconds: 200),
                child: Icon(Icons.expand_more, color: theme.iconTheme.color),
              ),
            ],
          ),

          onExpansionChanged: (expanded) {
            setState(() {
              _isExpanded = expanded;
            });
          },

          children: [
            Padding(
              padding: const EdgeInsets.only(right: 12, left: 12, bottom: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(
                      imageUrl: widget.meals.imageUrl,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 150,
                    ),
                  ),
                  SizedBox(height: 10),

                  Text(
                    'Ingredients',
                    style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  ...widget.meals.ingredients.map(
                        (ingredient) => Text('• $ingredient', style: theme.textTheme.titleMedium),
                  ),
                  SizedBox(height: 10),

                  Text(
                    'Instructions',
                    style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  ConstrainedBox(
                    constraints: BoxConstraints(maxHeight: 150),
                    child: SingleChildScrollView(
                      child: Text(widget.meals.instructions, style: theme.textTheme.titleMedium),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
