import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/assistant_controller.dart';
import '../../../models/item.dart';
import '../../../models/item_type.dart';
import '../../../utils/constants.dart';
import '../../common/card_tiles/recipe_list_card_tile.dart';
import '../../common/cards/small_card.dart';

class CraftingStepsCard extends ConsumerWidget {
  const CraftingStepsCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Map<String, List<String>> values = {};
    List<Item> reduced = Item.values
        .where((item) =>
            !(ref.watch(assistantControllerProvider).finalItems.contains(item)))
        .toList();
    for (var type in ItemType.values) {
      List<String> staging = reduced
          .where((item) => item.type == type)
          .map((e) => e.name)
          .toList();
      if (staging.isNotEmpty) {
        values[type.name] = reduced
            .where((item) => item.type == type)
            .map((e) => e.name)
            .toList();
      }
    }

    return SmallCard(
      'Crafting Steps',
      infoContent:
          'The Crafting Report will display all the crafting steps used to create the resource selected. Order is not necessarily the optimal crafting order.',
      content: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        child: RecipeListCardTile(
            ref.watch(assistantControllerProvider).craftingSteps),
      ),
    );
  }
}
