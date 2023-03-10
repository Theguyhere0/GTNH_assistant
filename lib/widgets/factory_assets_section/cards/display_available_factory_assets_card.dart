import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/assistant_controller.dart';
import '../../../models/industrial_age.dart';
import '../../../models/machine.dart';
import '../../../models/tool.dart';
import '../../../utils/constants.dart';
import '../../common/card_tiles/sectioned_list_card_tile.dart';
import '../../common/cards/small_card.dart';

class DisplayAvailableFactoryAssetsCard extends ConsumerWidget {
  const DisplayAvailableFactoryAssetsCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void delete(name) {
      ref
          .read(assistantControllerProvider.notifier)
          .removeAvailableToolByName(name);
      ref
          .read(assistantControllerProvider.notifier)
          .removeAvailableMachineByName(name);
    }

    Map<String, List<String>> values = {};
    List<String> staging = Tool.values
        .where((tool) => ref
            .watch(assistantControllerProvider)
            .availableTools
            .contains(tool))
        .map((e) => e.name)
        .toList();
    if (staging.isNotEmpty) {
      values['Tools'] = staging;
    }
    List<Machine> reduced = Machine.values
        .where((machine) => ref
            .watch(assistantControllerProvider)
            .availableMachines
            .contains(machine))
        .toList();
    for (var type in IndustrialAge.values) {
      List<String> staging = reduced
          .where((machine) => machine.type == type)
          .map((e) => e.name)
          .toList();
      if (staging.isNotEmpty) {
        values[type.name] = reduced
            .where((machine) => machine.type == type)
            .map((e) => e.name)
            .toList();
      }
    }

    return SmallCard(
      'Available Factory Assets',
      infoContent:
          'A list of all the tools and machines that you have access to for crafting.',
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
