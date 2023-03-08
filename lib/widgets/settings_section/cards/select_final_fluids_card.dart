import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/assistant_controller.dart';
import '../../../models/fluid.dart';
import '../../../utils/constants.dart';
import '../../common/card_tiles/list_card_tile.dart';
import '../../common/cards/small_card.dart';

class SelectFinalFluidsCard extends ConsumerWidget {
  const SelectFinalFluidsCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void add(name) {
      ref.read(assistantControllerProvider.notifier).addFinalFluidByName(name);
    }

    return SmallCard(
      'Select Final Fluids',
      infoContent:
          'Select the fluids that the Crafting Report will treat as final and will not try to find the recipes for to create the crafting tree.',
      content: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        child: ListCardTile(
          values: fluids
              .where((fluid) => !(ref
                  .watch(assistantControllerProvider)
                  .finalResources
                  .contains(fluid)))
              .map((e) => e.name)
              .toList(),
          add: add,
        ),
      ),
    );
  }
}
