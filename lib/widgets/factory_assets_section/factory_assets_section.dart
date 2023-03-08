import 'package:flutter/material.dart';

import '../common/page_section.dart';
import 'cards/display_available_factory_assets_card.dart';
import 'cards/select_available_machines_card.dart';
import 'cards/select_available_tools_card.dart';

/// The section for describing the factory assets of the base.
class FactoryAssetsSection extends StatelessWidget {
  const FactoryAssetsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageSection(
      'Factory Assets',
      icon: Icons.factory_rounded,
      content: <Widget>[
        Column(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                DisplayAvailableFactoryAssetsCard(),
                SelectAvailableMachinesCard(),
                SelectAvailableToolsCard(),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
