import 'package:flutter/material.dart';

import '../../../theme/palette.dart';
import '../../../utils/constants.dart';

/// A class to standardize addition buttons across the app.
class AddButton extends StatelessWidget {
  /// Creates a standard addition button customized for the UI of this app.
  const AddButton(
    this.add, {
    Key? key,
  }) : super(key: key);

  /// The function to call to perform the delete.
  final void Function() add;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: add,
      mouseCursor: SystemMouseCursors.click,
      color: Palette.success,
      icon: const Icon(Icons.add_circle_outline_rounded),
      iconSize: infoIconSize,
      padding: const EdgeInsets.all(0),
      alignment: Alignment.topCenter,
    );
  }
}
