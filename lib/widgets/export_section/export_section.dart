import 'package:flutter/material.dart';

import '../common/page_section.dart';

/// The section for exporting crafting reports and base statuses.
class ExportSection extends StatelessWidget {
  const ExportSection({Key? key}) : super(key: key);

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