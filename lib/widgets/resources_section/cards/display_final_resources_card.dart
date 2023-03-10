import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/assistant_controller.dart';
import '../../../models/fluid.dart';
import '../../../models/item.dart';
import '../../../models/item_type.dart';
import '../../../utils/constants.dart';
import '../../common/card_tiles/sectioned_list_card_tile.dart';
import '../../common/cards/small_card.dart';

class DisplayFinalResourcesCard extends ConsumerWidget {
  const DisplayFinalResourcesCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void delete(name) {
      ref
          .read(assistantControllerProvider.notifier)
          .removeFinalFluidByName(name);
      ref
          .read(assistantControllerProvider.notifier)
          .removeFinalItemByName(name);
    }

    Map<String, List<String>> values = {};
    List<String> staging = Fluid.values
        .where((item) =>
            ref.watch(assistantControllerProvider).finalFluids.contains(item))
        .map((e) => e.name)
        .toList();
    if (staging.isNotEmpty) {
      values['Fluids'] = staging;
    }
    List<Item> reduced = Item.values
        .where((item) =>
            ref.watch(assistantControllerProvider).finalItems.contains(item))
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
      'Current Final Resources',
      infoContent:
          'A list of all the resources that the Crafting Report will treat as final and will not try to find the recipes for to create the crafting tree.',
      content: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        child: SectionedListCardTile(
          values: values,
          delete: delete,
        ),
      ),
    );
  }
}
