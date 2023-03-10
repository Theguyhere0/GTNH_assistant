import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/assistant_controller.dart';
import '../../../models/fluid.dart';
import '../../../models/item.dart';
import '../../../models/item_type.dart';
import '../../../utils/constants.dart';
import '../../common/card_tiles/sectioned_list_card_tile.dart';
import '../../common/cards/small_card.dart';

class ResourceSelectionCard extends ConsumerWidget {
  const ResourceSelectionCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void select(name) {
      ref.read(assistantControllerProvider.notifier).craftResource(name);
    }

    Map<String, List<String>> values = {};
    values['Fluids'] = Fluid.values.map((e) => e.name).toList();
    for (var type in ItemType.values) {
      List<String> staging = Item.values
          .toList()
          .where((item) => item.type == type)
          .map((e) => e.name)
          .toList();
      if (staging.isNotEmpty) {
        values[type.name] = Item.values
            .toList()
            .where((item) => item.type == type)
            .map((e) => e.name)
            .toList();
      }
    }

    return SmallCard(
      'Resource Selection',
      infoContent:
          'Select a resource for the Crafting Report to attempt generating the Crafting Steps and Bill of Materials for.',
      content: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        child: SectionedListCardTile(
          values: values,
          select: select,
        ),
      ),
    );
  }
}
