import 'package:flutter/material.dart';

import 'custom_icon_button.dart';

/// A button to redirect users to a video for a full tutorial if they want one.
class HelpButton extends StatelessWidget {
  const HelpButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CustomIconButton(
      icon: Icons.help_rounded,
      tooltip: 'Visit the wiki',
      onPressed: null, // TODO: Open tutorial video in new tab
    );
  }
}
