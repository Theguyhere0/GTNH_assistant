import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/assistant_controller.dart';
import '../../../models/tool.dart';
import '../../../utils/constants.dart';
import '../../common/card_tiles/list_card_tile.dart';
import '../../common/cards/small_card.dart';

class SelectAvailableToolsCard extends ConsumerWidget {
  const SelectAvailableToolsCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void add(name) {
      ref
          .read(assistantControllerProvider.notifier)
          .addAvailableToolByName(name);
    }

    return SmallCard(
      'Select Available Tools',
      infoContent: 'Select the tools that you have access to for crafting.',
      content: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        child: ListCardTile(
          values: Tool.values
              .where((tool) => !(ref
                  .watch(assistantControllerProvider)
                  .availableTools
                  .contains(tool)))
              .map((e) => e.name)
              .toList(),
          add: add,
        ),
      ),
    );
  }
}
