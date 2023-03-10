import 'package:flutter/material.dart';

import '../../../models/recipe.dart';
import '../../../theme/palette.dart';
import '../../../utils/constants.dart';

/// A tile for custom lists for that display [Recipe]s.
class RecipeListTile extends StatelessWidget {
  /// Creates a card tile with some text.
  const RecipeListTile({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  /// The [Recipe] to display.
  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    List<Widget> inputs = [];
    List<Widget> process = [];
    List<Widget> outputs = [];

    if (recipe.energyInput > 0) {
      inputs.add(Text(
        '${recipe.energyInput} EU',
        style: Theme.of(context).textTheme.titleMedium,
      ));
    }
    recipe.resourceInputs.forEach((resource, quantity) => inputs.add(Text(
          '$quantity ${resource.name}',
          style: Theme.of(context).textTheme.titleMedium,
        )));
    for (var tool in recipe.tools) {
      process.add(Text(
        tool.name,
        style: Theme.of(context).textTheme.titleMedium,
      ));
    }
    for (var machine in recipe.machines) {
      process.add(Text(
        machine.name,
        style: Theme.of(context).textTheme.titleMedium,
      ));
    }
    if (recipe.energyOutput > 0) {
      outputs.add(Text(
        '${recipe.energyOutput} EU',
        style: Theme.of(context).textTheme.titleMedium,
      ));
    }
    recipe.itemOutputs.forEach((item, quantity) {
      int wholeValue = quantity as int;
      int percentage = (quantity - wholeValue) * 100 as int;

      // No percentage
      if (percentage == 0) {
        outputs.add(Text(
          '$wholeValue ${item.name}',
          style: Theme.of(context).textTheme.titleMedium,
        ));
      }

      // No whole value
      else if (wholeValue == 0) {
        outputs.add(Text(
          '$percentage% ${item.name}',
          style: Theme.of(context).textTheme.titleMedium,
        ));
      }

      // Both
      else {
        outputs.add(Text(
          '$wholeValue + $percentage% ${item.name}',
          style: Theme.of(context).textTheme.titleMedium,
        ));
      }
    });
    recipe.fluidOutputs.forEach((fluid, quantity) => outputs.add(Text(
          '$quantity ${fluid.name}',
          style: Theme.of(context).textTheme.titleMedium,
        )));

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
      child: Row(
        children: [
          Expanded(child: Column(children: inputs)),
          Expanded(
            child: Column(children: [
              ...process,
              const Icon(
                Icons.arrow_right_alt_rounded,
                color: Palette.standard,
                size: 30,
              )
            ]),
          ),
          Expanded(child: Column(children: outputs)),
        ],
      ),
    );
  }
}
