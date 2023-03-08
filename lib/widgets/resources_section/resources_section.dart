import 'package:flutter/material.dart';

import '../common/page_section.dart';
import 'cards/display_final_resources_card.dart';
import 'cards/select_final_fluids_card.dart';
import 'cards/select_final_items_card.dart';

/// The section for customizing resource related options.
class ResourcesSection extends StatelessWidget {
  const ResourcesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageSection(
      'Resources',
      icon: Icons.water_drop_rounded,
      content: <Widget>[
        Column(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                DisplayFinalResourcesCard(),
                SelectFinalItemsCard(),
                SelectFinalFluidsCard(),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
