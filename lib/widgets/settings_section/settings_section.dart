import 'package:flutter/material.dart';

import '../common/page_section.dart';

/// The section for customizing certain behaviors of the assistant.
class SettingsSection extends StatelessWidget {
  const SettingsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageSection(
      'Settings',
      icon: Icons.settings_rounded,
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
