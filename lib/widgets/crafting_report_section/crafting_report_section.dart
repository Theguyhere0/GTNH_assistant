import 'package:flutter/material.dart';

import '../common/page_section.dart';
import 'cards/bill_of_materials_card.dart';
import 'cards/crafting_steps_card.dart';
import 'cards/resource_selection_card.dart';

/// The section for generating a report of crafting recipes and materials.
class CraftingReportSection extends StatelessWidget {
  const CraftingReportSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageSection(
      'Crafting Report',
      icon: Icons.description_rounded,
      content: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
            ResourceSelectionCard(),
            CraftingStepsCard(),
            BillOfMaterialsCard(),
          ],
        ),
      ],
    );
  }
}
