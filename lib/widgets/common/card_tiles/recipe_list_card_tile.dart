import 'package:flutter/material.dart';

import '../../../models/recipe.dart';
import '../../../utils/constants.dart';
import '../list_tiles/recipe_list_tile.dart';

/// A tile for custom cards with a list displaying [Recipe]s.
class RecipeListCardTile extends StatelessWidget {
  /// Creates a card tile to display [Recipe]s.
  const RecipeListCardTile(this.recipes, {Key? key}) : super(key: key);

  /// All the [Recipe]s that need to be displayed.
  final List<Recipe> recipes;

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
      child: LimitedBox(
        maxHeight: 450,
        child: Card(
          elevation: 0,
          margin: const EdgeInsets.only(top: 3),
          child: Scrollbar(
            thumbVisibility: true,
            controller: scrollController,
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                  children: recipes
                      .map((recipe) => RecipeListTile(recipe: recipe))
                      .toList()),
            ),
          ),
        ),
      ),
    );
  }
}
