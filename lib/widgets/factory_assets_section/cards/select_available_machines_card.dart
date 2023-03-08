import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/assistant_controller.dart';
import '../../../models/industrial_age.dart';
import '../../../models/machine.dart';
import '../../../utils/constants.dart';
import '../../common/card_tiles/sectioned_list_card_tile.dart';
import '../../common/cards/small_card.dart';

class SelectAvailableMachinesCard extends ConsumerWidget {
  const SelectAvailableMachinesCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void add(name) {
      ref
          .read(assistantControllerProvider.notifier)
          .addAvailableMachineByName(name);
    }

    Map<String, List<String>> values = {};
    List<Machine> reduced = machines
        .where((machine) => !(ref
            .watch(assistantControllerProvider)
            .availableMachines
            .contains(machine)))
        .toList();
    for (var type in IndustrialAge.values) {
      List<String> staging = reduced
          .where((machine) => machine.type == type)
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
      'Select Available Machines',
      infoContent: 'Select the machines that you have access to for crafting.',
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
