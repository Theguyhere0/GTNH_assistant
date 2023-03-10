import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/assistant_controller.dart';
import '../../../models/fluid.dart';
import '../../../utils/constants.dart';
import '../../common/card_tiles/list_card_tile.dart';
import '../../common/cards/small_card.dart';

class BillOfMaterialsCard extends ConsumerWidget {
  const BillOfMaterialsCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SmallCard(
      'Bill of Materials',
      infoContent:
          'The Crafting Report will list out all of the basic materials needed to craft the desired resource. Some values are based on probabilistic recipes, and have a "~" next to them to indicate the estimated quantity needed.',
      content: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        child: ListCardTile(
            values: ref
                .watch(assistantControllerProvider)
                .bom
                .map((itemstack) =>
                    '${itemstack.resource?.name ?? 'EU'}: ${itemstack.predicted ? '~' : ''}${itemstack.quantity}${itemstack.resource is Fluid ? ' mB' : ''}')
                .toList()
              ..sort()),
      ),
    );
  }
}
