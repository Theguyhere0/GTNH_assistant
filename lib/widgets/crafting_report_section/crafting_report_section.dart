import 'package:flutter/material.dart';

import '../common/page_section.dart';

/// The section for generating a report of crafting recipes and materials.
class CraftingReportSection extends StatelessWidget {
  const CraftingReportSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageSection(
      'Export',
      icon: Icons.upload_rounded,
      content: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
            Spacer(),
          ],
        ),
      ],
    );
  }
}
