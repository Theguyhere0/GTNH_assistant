import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/assistant_controller.dart';
import '../../../models/item.dart';
import '../../../models/item_type.dart';
import '../../../utils/constants.dart';
import '../../common/card_tiles/sectioned_list_card_tile.dart';
import '../../common/cards/small_card.dart';

class SelectFinalItemsCard extends ConsumerWidget {
  const SelectFinalItemsCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void add(name) {
      ref.read(assistantControllerProvider.notifier).addFinalItemByName(name);
    }

    Map<String, List<String>> values = {};
    List<Item> reduced = items
        .where((item) => !(ref
            .watch(assistantControllerProvider)
            .finalResources
            .contains(item)))
        .toList();
    for (var type in ItemType.values) {
      List<String> staging = reduced
          .where((item) => item.type == type)
          .map((e) => e.name)
          .toList();
      if (staging.isNotEmpty) {
        values[type.value] = reduced
            .where((item) => item.type == type)
            .map((e) => e.name)
            .toList();
      }
    }

    return SmallCard(
      'Select Final Items',
      infoContent:
          'Select the items that the Crafting Report will treat as final and will not try to find the recipes for to create the crafting tree.',
      content: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        child: SectionedListCardTile(
          values: values,
          add: add,
        ),
      ),
    );
  }
}
