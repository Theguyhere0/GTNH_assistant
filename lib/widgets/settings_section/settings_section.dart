import 'package:flutter/material.dart';

import '../common/page_section.dart';
import 'cards/display_final_resources_card.dart';
import 'cards/select_final_fluids_card.dart';
import 'cards/select_final_items_card.dart';

/// The section for customizing certain behaviors of the assistant.
class SettingsSection extends StatelessWidget {
  const SettingsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageSection(
      'Settings',
      icon: Icons.settings_rounded,
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
