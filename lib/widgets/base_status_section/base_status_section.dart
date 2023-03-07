import 'package:flutter/material.dart';

import '../common/page_section.dart';

/// The section for setting up the status of the base.
class BaseStatusSection extends StatelessWidget {
  const BaseStatusSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageSection(
      'Base Status',
      icon: Icons.home_rounded,
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
